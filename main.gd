extends Control





var current_level

func _ready():
	current_level = 1
	spawnTargets(2)


	
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
