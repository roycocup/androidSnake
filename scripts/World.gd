extends Node2D

func _ready():
	set_process(true)

func _process(delta):
	check_quit()
	check_pause()
	pass

func check_quit():
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
		

func check_pause():
	if Input.is_action_just_pressed('ui_pause'):
		print(get_tree().paused)
		if get_tree().paused == false:
			get_tree().paused = true;
		else:
			get_tree().paused = false;
