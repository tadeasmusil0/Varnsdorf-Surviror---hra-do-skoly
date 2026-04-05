extends CharacterBody2D

# Atributy hráče
const SPEED = 200.0 # střední rychlost pohybu
var hp = 100 # 100 HP
var xp = 0 # zkušenosti

func _physics_process(_delta):
	# Pohyb pomocí kláves WASD
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction:
		velocity = direction * SPEED
	else:
		velocity = Vector2.ZERO

	move_and_slide()

func take_damage(amount):
	hp -= amount
	if hp <= 0:
		die()

func die():
	# Hra končí po smrti hráče
	print("Game Over")
	get_tree().reload_current_scene()
