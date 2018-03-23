extends Control

var current_level

#instances
onready var enemy_scene = preload("res://SceneObjects/enemyScene/Target1.tscn")

func _ready():
	current_level = 1
	spawnTargets(2)


	
func spawnTargets(count):
	randomize()
	for i in range(count):
		var new_target = enemy_scene.instance()
		add_child(new_target)
		new_target.position.x = rand_range(0, get_viewport().size.x)
		new_target.position.y = rand_range(0, get_viewport().size.y)/2
	
		

	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
