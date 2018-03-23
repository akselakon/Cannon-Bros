extends Control



var map_width = 1280
var map_height = 720



func _ready():
	current_level = 1
	init_game()
	

func init_game:
	pass
	
	
func spawTargets(count):
	for i in range(0, count):
		var new_target = load("res://SceneObjects/enemyScene/Target1.tscn")
		var target_instance = new_target.instance()
		target_instance.set_name("target",i)
		add_child(target_instance)

	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
