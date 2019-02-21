extends Node2D

func _ready():
	set_process(true)

func _process(delta):
	check_quit()
	pass

func check_quit():
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
