extends CharacterBody2D

var speed = 50.0 # Pomalý, šouravý pohyb
var player = null

func _ready():
	# Najde hráče ve scéně
	player = get_tree().get_first_node_in_group("player_group")

func _physics_process(_delta):
	if player:
		# Jde přímo na hráče
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * speed
		move_and_slide()

# Tuto funkci propoj s uzlem Hitbox (Area2D) přes signál "body_entered"
func _on_hitbox_body_entered(body):
	if body.name == "Player":
		body.take_damage(10)
