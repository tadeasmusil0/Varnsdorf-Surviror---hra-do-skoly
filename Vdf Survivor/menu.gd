extends Control

func _ready():
	# Připojení tlačítka
	$VBoxContainer/Button.pressed.connect(_on_play_pressed)

func _on_play_pressed():
	# Přepne do hlavní hry
	get_tree().change_scene_to_file("res://main.tscn")
