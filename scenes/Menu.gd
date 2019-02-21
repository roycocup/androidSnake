extends Container

onready var panel = $Panel

func position_me():
	var mid_x = panel.rect_size.x / 2
	var mid_y = panel.rect_size.y / 2
	var win_mid = Vector2(429 / 2, 768 / 2)
	rect_position = Vector2(win_mid.x-mid_x, win_mid.y-mid_y)

func _ready():
	visible = false
	position_me()
	
