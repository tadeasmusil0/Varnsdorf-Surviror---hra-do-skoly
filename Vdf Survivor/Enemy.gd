extends CharacterBody2D
@export var gem_scene: PackedScene # Sem v editoru přetáhneme XPGem.tscn!

var speed = 50.0
var health = 20 # Základní životy důchodce
var player = null
var xp_reward = 5 # Kolik z něj padne
var can_play_sound = true

func play_attack_sound():
	# Pokud už zvuk hraje, nebudeme ho spouštět znovu
	if can_play_sound and not $AttackSound.playing:
		$AttackSound.pitch_scale = randf_range(0.8, 1.2) # Mírná změna tónu pro pestrost
		$AttackSound.play()
		
		# Cooldown, aby jeden nepřítel neřval pořád dokola
		can_play_sound = false
		await get_tree().create_timer(1.0).timeout 
		can_play_sound = false
func _ready():
	# Najde hráče ve scéně
	player = get_tree().get_first_node_in_group("player_group")


func _physics_process(_delta):
	if player:
		# Jde přímo na hráče
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * speed
		move_and_slide()

func take_damage(amount):
	health -= amount
	if health <= 0:
		# SPAWNOVÁNÍ XP GEMU PŘI SMRTI
		if gem_scene:
			var gem = gem_scene.instantiate()
			gem.global_position = global_position
			gem.xp_amount = xp_reward
			# Přidáme gem do hlavní scény, aby nezmizel s nepřítelem
			get_tree().current_scene.call_deferred("add_child", gem)
		
		queue_free()

# Tato funkce se spustí, když Area2D hráče (pěst) narazí do důchodce
func _on_hitbox_area_entered(area):
	if area.name == "AttackArea":
		take_damage(10) # Pěst dává 10 poškození
