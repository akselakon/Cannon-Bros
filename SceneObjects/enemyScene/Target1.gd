extends KinematicBody2D

export (int) var edge_offset = 25

# Initial values
var x_init = 0
var y_init
var movement = Vector2()

# Random Values
var move_speed = 1
var vertical_direction = true

# Controller
var increase = true
var move_area = 100

func init(pos_x,pos_y):
	x_init = pos_x
	y_init = pos_y
	
func _ready():
	set_process(true)
	randomize()
	move_speed = randi()%6+2
	move_area = randi()%250+100
	if(randi()%2+0 == 1):
		vertical_direction = false


func _on_collision(value):
	pass
	

func _process(delta):
	var max_x = global_declarations.map_width - edge_offset
	var max_y = global_declarations.map_height - edge_offset
	
	var coliding = move_and_collide(movement)
	if coliding:
		queue_free()
			
	if(vertical_direction):
		if(get_position().y > y_init + move_area or get_position().y > max_y and increase):
			increase = false
		if(get_position().y < y_init - move_area or get_position().y < edge_offset and !increase):
			increase = true
			
		if(increase):
			position.y = get_position().y + move_speed
		else:
			position.y = get_position().y - move_speed
	else:
		if(get_position().x > x_init + move_area or get_position().x > max_x and increase):
			increase = false
		if(get_position().x < x_init - move_area or get_position().x < edge_offset and !increase):
			increase = true
			
		if(increase):
			position.x = get_position().x + move_speed
		else:
			position.x = get_position().x - move_speed
	
	
