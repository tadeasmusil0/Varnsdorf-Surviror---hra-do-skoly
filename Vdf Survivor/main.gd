extends Node2D

# Odkaz na scénu nepřítele
var enemy_scene = preload("res://enemy.tscn")
@onready var player = $Player

func _ready():
	# Propojení timeru ze skriptu
	$SpawnTimer.timeout.connect(_on_spawn_timer_timeout)

func _on_spawn_timer_timeout():
	spawn_enemy()

func spawn_enemy():
	var enemy = enemy_scene.instantiate()
	
	# Jednoduché náhodné spawnování mimo obrazovku kolem hráče
	var random_angle = randf() * PI * 2
	var spawn_radius = 600 # vzdálenost od hráče
	var spawn_pos = player.global_position + Vector2(cos(random_angle), sin(random_angle)) * spawn_radius
	
	enemy.global_position = spawn_pos
	add_child(enemy)
