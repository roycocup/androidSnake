extends Node2D


const DIR_UP = 'up'
const DIR_DOWN = 'down'
const DIR_LEFT = 'left'
const DIR_RIGHT = 'right'


var size = 21
var step = 10
var direction = null
var counter = 0
var move_interval = .5 
var history = []
var tail = []
var tail_size = 5
var init_pos = Vector2(429 / 2, 768 / 2)

func _ready():
	$Block.rect_size = Vector2(size, size)
	direction = get_random_dir()
	set_position(init_pos)
	#build_initial_tail()

func _process(delta):
	listen_to_direction()
	listen_to_keys()
	counter = counter + delta
	if counter >= move_interval:
		counter = 0
		record_position()
		move(delta)
		move_tail(delta)

func move(delta):
	if direction == DIR_UP:
		position.y = position.y - size
	if direction == DIR_DOWN:
		position.y = position.y + size
	if direction == DIR_LEFT:
		position.x = position.x - size
	if direction == DIR_RIGHT:
		position.x = position.x + size

func move_tail(delta):
	var i = 0
	for element in tail:
		var last_history_index = history.size()-1
		element.position = history[last_history_index-i]
		i += 1
	
func listen_to_keys():
	if Input.is_action_just_pressed('ui_accept'):
		grow_tail()

func listen_to_direction():
	if Input.is_action_pressed('ui_up'):
		set_direction(DIR_UP)
	if Input.is_action_pressed('ui_down'):
		set_direction(DIR_DOWN)	
	if Input.is_action_pressed('ui_left'):
		set_direction(DIR_LEFT)
	if Input.is_action_pressed('ui_right'):
		set_direction(DIR_RIGHT)

func get_random_dir():
	var i = randi() % 3
	if i == 0:
		return DIR_UP
	if i == 1:
		return DIR_DOWN
	if i == 2:
		return DIR_LEFT
	if i == 3:
		return DIR_RIGHT

func set_direction(dir):
	if (direction == DIR_DOWN and dir == DIR_UP or
		direction == DIR_UP and dir == DIR_DOWN or
		direction == DIR_RIGHT and dir == DIR_LEFT or
		direction == DIR_LEFT and dir == DIR_RIGHT):
		return false
	else:
		direction = dir

func set_position(pos):
	position = pos

func record_position():
	history.append(position)

func grow_tail():
	var element = load('res://scenes/SnakeElement.tscn').instance()
	var elements = get_node('/root/World/SnakeElements')
	element.get_node('Block').color = Color('#cccccc')
	element.position = Vector2(position.x, position.y-size)
	elements.add_child(element)	
	tail.append(element)
	
	
	