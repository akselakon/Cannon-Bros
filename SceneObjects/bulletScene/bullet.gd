extends KinematicBody2D

export (PackedScene) var explosion_scene = preload("res://SceneObjects/explosionScene/explosion.tscn")
var gravity = 15
var bounce = 0.6
var movement = Vector2()


func shoot(directional_force, bullet_gravity):
	gravity = bullet_gravity
	movement=directional_force
	set_process(true)
	
func _process(delta):
	movement.y = movement.y + gravity * delta
	var coliding = move_and_collide(movement)
#	if coliding:
#		var normal_motion = coliding.get_normal()
##	movement = (movement - 2 * movement.dot(normal_motion)) *  bounce
#		movement = movement.bounce(coliding.normal)
	
	

func _on_visibility_notifier_screen_exited():
	queue_free()
