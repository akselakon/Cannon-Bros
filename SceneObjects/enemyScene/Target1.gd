extends KinematicBody2D

export (int) var edge_offset = 50

# Initial values
var x_init = 0
var y_init = 0
var limit_x = 0
var limi_y = 0

# Random Values
var move_speed = 1
var vertical_direction = true


# Controller
var increase = true
var move_area = 100


func _ready():
	set_process(true)
	randomize()
	move_speed = randi()%6+2
	move_area = randi()%200+100
	if(randi()%2+0 == 1):
		vertical_direction = false 
	
	x_init = get_position().x
	y_init = get_position().y
	

func _process(delta):
	var max_x = global_declarations.map_width - edge_offset
	var max_y = global_declarations.map_height - edge_offset
	
	if(vertical_direction):
		if(get_position().y > y_init + move_area or get_position().y > max_y):
			increase = false
		if(get_position().y < y_init - move_area or get_position().y < edge_offset):
			increase = true
			
		if(increase):
			position.y = get_position().y + move_speed
		else:
			position.y = get_position().y - move_speed
	else:
		if(get_position().x > x_init + move_area or get_position().x > max_x):
			increase = false
		if(get_position().x < x_init - move_area or get_position().x < edge_offset):
			increase = true
			
		if(increase):
			position.x = get_position().x + move_speed
		else:
			position.x = get_position().x - move_speed
	
	
