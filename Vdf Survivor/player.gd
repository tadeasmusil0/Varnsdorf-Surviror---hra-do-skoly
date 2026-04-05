extends CharacterBody2D

var speed = 200.0
var health = 100.0 

# LEVELOVÁNÍ PROMĚNNÉ
var xp = 0
var level = 1
var xp_to_next_level = 10

@onready var pause_menu = $UI/PauseMenu
@onready var game_over_menu = $UI/GameOverMenu

func _ready():
	$UI/HealthBar.max_value = health
	$UI/HealthBar.value = health
	
	# Inicializace XP Baru a Levelu
	$UI/XPBar.max_value = xp_to_next_level
	$UI/XPBar.value = xp
	$UI/LevelLabel.text = "Level: " + str(level)
	
	$UI/PauseMenu/PokracovatBtn.pressed.connect(unpause_game)
	$UI/PauseMenu/UkoncitBtn.pressed.connect(quit_game)
	$UI/GameOverMenu/RestartBtn.pressed.connect(restart_game)
	$UI/GameOverMenu/UkoncitBtn.pressed.connect(quit_game)

func _physics_process(_delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed
	move_and_slide()
	
	if Input.is_action_just_pressed("ui_accept"):
		attack()
	
	var bodies = $Hurtbox.get_overlapping_bodies()
	for body in bodies:
		if body.is_in_group("enemies"):
			take_damage(0.5)

# TATO FUNKCE SE SAMA PŘIDALA V KROKU 4
func _on_pickup_area_area_entered(area):
	# Pokud to, čeho jsme se dotkli, je v naší vytvořené skupině xp_gems
	if area.is_in_group("xp_gems"):
		gain_xp(area.xp_amount) # Přidáme si XP
		area.queue_free() # Drahokam po sebrání zmizí

func gain_xp(amount):
	xp += amount
	if xp >= xp_to_next_level:
		level_up()
	$UI/XPBar.value = xp

func level_up():
	xp -= xp_to_next_level
	level += 1
	xp_to_next_level = int(xp_to_next_level * 1.5) # Další level vyžaduje o 50 % více XP
	
	# Aktualizace UI
	$UI/XPBar.max_value = xp_to_next_level
	$UI/LevelLabel.text = "Level: " + str(level)
	print("LEVEL UP! Nyní jsi level: ", level)

func take_damage(amount):
	health -= amount
	$UI/HealthBar.value = health
	if health <= 0:
		die()

func die():
	get_tree().paused = true # Zastaví hru
	game_over_menu.show()    # Ukáže obrazovku smrti 

func attack():
	$AttackArea/CollisionShape2D.disabled = false
	await get_tree().create_timer(0.2).timeout
	$AttackArea/CollisionShape2D.disabled = true
	
	# Kontrola zmáčknutí klávesy ESC (v Godotu je to defaultně akce "ui_cancel")
func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel") and health > 0:
		if get_tree().paused:
			unpause_game()
		else:
			pause_game()

func pause_game():
	get_tree().paused = true
	pause_menu.show()

func unpause_game():
	get_tree().paused = false
	pause_menu.hide()

func restart_game():
	get_tree().paused = false # Musíme hru odpauzovat před restartem!
	get_tree().reload_current_scene()

func quit_game():
	get_tree().quit()
