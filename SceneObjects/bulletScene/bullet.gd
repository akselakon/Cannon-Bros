extends KinematicBody2D

export (PackedScene) var explosion_scene = preload("res://SceneObjects/explosionScene/explosion.tscn")
var gravity = 0
var bounce = 0.6
var movement = Vector2()


func shoot(directional_force, bullet_gravity):
	gravity = bullet_gravity
	movement=directional_force
	set_physics_process(true)
#	var explosion = explosion_scene.instance()
#	add_child(explosion)
#	var anim_explosion = get_node("explosion/animation")
	
func _physics_process(delta):
	movement.y = movement.y + gravity * delta
	var coliding = move_and_collide(movement)
	if coliding:
#		explosion.set_global_position(get_global_position())
#		anim_explosion.play()
		#get_node("AnimationPlayer").play("explosion")
		queue_free()
		#var normal_motion = coliding.get_normal()
		#movement = (movement - 2 * movement.dot(normal_motion)
		 #* normal_motion) * bounce
		
		
	
	

func _on_visibility_notifier_screen_exited():
	queue_free()
