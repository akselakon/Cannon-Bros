extends Control

var current_level

#instances
onready var enemy_scene = preload("res://SceneObjects/enemyScene/Target1.tscn")

func _ready():
	current_level = 1
	spawnTargets(3)


	
func spawnTargets(count):
	randomize()
	for i in range(count):
		var new_target = enemy_scene.instance()
		add_child(new_target)
		var pos = Vector2()
		pos.x = rand_range(0, get_viewport().size.x)
		pos.y = rand_range(0, get_viewport().size.y)*0.7
		new_target.set_position(pos)
		new_target.init(pos.x, pos.y) # Passing startingpos, overwrite 0,0

	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
