extends Node2D

onready var grid = get_node('/root/World/Grid')
onready var fruit = $ColorRect

var showing = false

func place_fruit_at_random():
	fruit.rect_size = Vector2(21,21)
	var x = randi() % int(grid.DIM.max.x) + 1
	var y = randi() % int(grid.DIM.max.y) + 1
	fruit.rect_position = Vector2(x,y)
	fruit.visible = false

func _ready():
	place_fruit_at_random()
	fruit.visible = true

func _process(delta):
	pass
