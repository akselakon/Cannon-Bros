extends KinematicBody2D

# Bullet properties
  #setget set_bullet_angle  func set_bullet_anlge(value)    bullet_angle =clamp(value, min, max)
var bullet_speed = 8
var max_bullet_speed = 20
var increase_rate = 0.05
var bullet_gravity = 15
var shooting = false #shooting?

var bullet_delay = 1
var waited = 0

#Cannon properties
var bevegelse = Vector2()
var velocity = 100
var angular_speed = 10*(PI/180)
var angle = 0
#bullet scene
export (PackedScene) var bullet_scene = preload("res://SceneObjects/bulletScene/bullet.tscn")

#bullet spawn
onready var bullet_spawn = get_node("bullet_spawn")
onready var center_position = get_node("center_position")
onready var audio_explosion = get_node("audio_explosion")
onready var shooting_bar = get_node("shooting_bar")
onready var bar = get_node("bar")

var bar_initial_x = 0

var directional_force = Vector2()
var direction = Vector2()
#func update_directional_force():
	#randomize()
	#var bullet_angle = rand_range(-70*(PI/180), 0)
	#directional_force = Vector2(cos(bullet_angle), sin(bullet_angle)) * bullet_speed
	
	
	
	
func _ready():
	set_process_input(true)
	set_process(true)
	bar.hide()
	shooting_bar.hide()
	
func _input(event):
	if (event.is_action_released("ui_select")):
		shooting = true
	if (event.is_action_pressed("ui_select")):
		bar_initial_x = bar.get_position().x
		
func _process(delta):
	print(bullet_speed)
	if (Input.is_action_pressed("ui_select")):
		bar.show()
		shooting_bar.show()
	
		if(bullet_speed<max_bullet_speed):
			bullet_speed += increase_rate
			var scale_rate = 0.06
			bar.scale.x += scale_rate
			bar.position.x += scale_rate * 4
			
			
			
	if Input.is_action_pressed("ui_up"):
		bevegelse.y = -1
	elif Input.is_action_pressed("ui_down"):
		bevegelse.y = 1
	else: bevegelse.y = 0
	
	move_and_collide(bevegelse*velocity*delta)
	
	if Input.is_action_pressed("ui_left"):
		set_rotation_degrees(get_rotation_degrees() - angular_speed)
	elif Input.is_action_pressed("ui_right"):
		set_rotation_degrees(get_rotation_degrees() + angular_speed)
	
	#print(bullet_spawn.get_global_position())
	
	
	if (shooting && waited>bullet_delay):
		fire_once()
		
		waited = 0
	elif(waited <= bullet_delay):
		waited = waited + delta

func fire_once(): 
	direction = (bullet_spawn.get_global_position() - center_position.get_global_position())
	directional_force = direction.normalized() * bullet_speed
	#update_directional_force()
	shoot()
	audio_explosion.play()
	shooting = false


func shoot():
	var bullet = bullet_scene.instance()
	bullet.set_global_position(bullet_spawn.get_global_position())
	bullet.shoot(directional_force, bullet_gravity)
	get_parent().add_child(bullet) # adder bullet til main
	bullet_speed = 8
	bar.scale.x = 0
	bar.hide()
	shooting_bar.hide()
	bar.position.x = bar_initial_x
	
	