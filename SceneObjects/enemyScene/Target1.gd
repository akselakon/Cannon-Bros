extends KinematicBody2D

export (int) var move_area = 100
export (int) var move_speed = 1



# Initial values
var x_init = 0
var y_init = 0

# 
var increase = true


func _ready():
	set_process(true)
	x_init = get_position().x
	y_init = get_position().y
	

func _process(delta):
	if(get_position().y > y_init + move_area):
		increase = false
	if(get_position().y < y_init - move_area):
		increase = true
		
	if(increase):
		position.y = get_position().y + move_speed
	else:
		position.y = get_position().y - move_speed
	
	
	
