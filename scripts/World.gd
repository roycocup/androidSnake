extends Node2D

func _ready():
	set_process(true)

func _process(delta):
	check_quit()
	check_pause()
	check_menu()

func check_quit():
	if Input.is_action_just_pressed('ui_cancel'):
		get_tree().quit()
		

func check_pause():
	if Input.is_action_just_pressed('ui_pause'):
		pause_game()

func pause_game():
	if get_tree().paused == false:
		get_tree().paused = true;
	else:
		get_tree().paused = false;
			
func check_menu():
	if Input.is_action_just_pressed('ui_show_hide'):
		var menu = get_node('/root/World/Menu')
		if menu.visible:
			menu.visible = false
			pause_game()
		else:
			menu.visible = true
			pause_game()