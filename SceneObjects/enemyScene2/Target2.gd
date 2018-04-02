extends Area2D
var spawn_chance = 50
var percent = null
var angular_movement = 100
var movement = Vector2(100,0)
var spawn_left_side = Vector2(0, 630)
var spawn_right_side = Vector2(1280 , 630)
onready var effect = get_node("effect")
onready var sprite = get_node("sprite")

func _ready():
	spawn_location()
	set_process(true)
	
	
func _process(delta):
	set_position(get_position() + movement * delta)
	set_rotation_degrees(get_rotation_degrees() + angular_movement * delta)

func spawn_location():
	randomize()
	percent = rand_range(0, 1)
	print(percent * 100)
	if ((percent * 100)<= spawn_chance): 
		set_position(spawn_right_side)
		movement = -movement
		angular_movement = -angular_movement
	else:
		 set_position(spawn_left_side)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Target2_body_entered( body ):
	queue_free()
