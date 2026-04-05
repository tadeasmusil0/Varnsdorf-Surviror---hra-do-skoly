extends Node2D

# Velikost jedné dlaždice (můžeš zvětšit/zmenšit)
var grid_size = 64

func _process(_delta):
	# Každý snímek řekneme enginu, aby mapu překreslil podle pohybu hráče
	queue_redraw()

func _draw():
	# Najdeme hráče ve scéně
	var player = get_tree().get_first_node_in_group("player")
	if not player: 
		return
		
	var cam_pos = player.global_position
	# Zjistíme velikost okna, abychom kreslili jen to, co je vidět + malý přesah
	var screen_size = get_viewport_rect().size
	var draw_area = Rect2(cam_pos - screen_size, screen_size * 2.0)
	
	# 1. Vykreslení temného podkladu (noční atmosféra)
	draw_rect(draw_area, Color(0.05, 0.05, 0.08)) # Tmavě modro-šedá
	
	# 2. Výpočet startovní pozice pro čáry mřížky (asfaltové spáry)
	var start_x = floor(draw_area.position.x / grid_size) * grid_size
	var start_y = floor(draw_area.position.y / grid_size) * grid_size
	
	# 3. Vykreslení vertikálních čar
	for x in range(start_x, draw_area.end.x, grid_size):
		draw_line(Vector2(x, draw_area.position.y), Vector2(x, draw_area.end.y), Color(0.1, 0.1, 0.15), 2.0)
		
	# 4. Vykreslení horizontálních čar
	for y in range(start_y, draw_area.end.y, grid_size):
		draw_line(Vector2(draw_area.position.x, y), Vector2(draw_area.end.x, y), Color(0.1, 0.1, 0.15), 2.0)
