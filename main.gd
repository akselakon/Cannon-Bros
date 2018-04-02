extends Control

var current_level = 0
var number = 0
var spawn_chance = 50
var percent = null #setter verdi i timeout funksjonen

signal double_shoot
#instances
onready var enemy_scene1 = preload("res://SceneObjects/enemyScene/Target1.tscn")
onready var enemy_scene2 = preload("res://SceneObjects/enemyScene2/Target2.tscn")
onready var child_container1 = get_node("child_container1")
onready var child_container2 = get_node("child_container2")

onready var level_label = get_node("HUD/level_label")
onready var shoot_timer = get_node("shoot_timer")
onready var shoot_timer_label = get_node("HUD/shoot_timer_label")
onready var enemy_spawn_timer = get_node("enemy_spawn_timer")
onready var enemy_label = get_node("HUD/enemy_label")
onready var start_button = get_node("HUD/start_button")

func _ready():
	set_process(false)

func _on_start_button_pressed():
	start_game()
	start_button.hide()
	
func start_game():
	set_process(true)
	enemy_spawn_timer.start()
func enemy2(number):
	for i in range(number):
		var new_target2 = enemy_scene2.instance()
		child_container2.add_child(new_target2)
		
func enemy1(count):
	randomize()
	for i in range(count):
		var new_target1 = enemy_scene1.instance()
		child_container1.add_child(new_target1)
		var pos = Vector2()
		pos.x = rand_range(0, get_viewport().size.x)
		pos.y = rand_range(0, get_viewport().size.y)*0.7
		new_target1.set_position(pos)
		new_target1.init(pos.x, pos.y) 
		level_label.set_text("Level " +  str(current_level))
	
	
func _process(delta):
	enemy_label.set_text(str(int(enemy_spawn_timer.get_time_left())))
	shoot_timer_label.set_text(str(int(shoot_timer.get_time_left())))
	if child_container1.get_child_count() == 0:
		on_level_up()
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
func on_level_up():
	current_level = current_level + 1
	enemy1(current_level)
	
	if current_level > 5:
		beastmode()
#func _on_shoot_timer_timeout():
#	get_node("cannon").set_process(false)

func beastmode():
	emit_signal("double_shoot")


func _on_enemy_spawn_timer_timeout():
	randomize()
	percent = rand_range(0, 1)
	print(percent * 100)
	if ((percent * 100)<= spawn_chance): 
		enemy2(1)