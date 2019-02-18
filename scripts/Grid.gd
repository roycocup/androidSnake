extends Node2D

const DIM = {
	'min':Vector2(0, 0), 
	'max':Vector2(429, 768)
}

func is_inside(point):
	if point.x < DIM.min.x or point.y < DIM.min.y:
		return false
	if point.x > DIM.max.x or point.y > DIM.max.y:
		return false
	
	return true 
	