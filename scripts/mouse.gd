extends RigidBody2D

var currentRotation := 0.0
@onready var animated_sprite_2d = $AnimatedSprite2D

var windowSize = DisplayServer.window_get_size()

func _physics_process(delta):
	if global_position.y < 0 || global_position.x < 0 || global_position.y > windowSize.y ||  global_position.x > windowSize.x:
		global_position.y = 321
		global_position.x = 577
		linear_velocity.x = 0
		linear_velocity.y = 0

		
func _on_body_entered(body):
	animated_sprite_2d.play("default")
	await get_tree().create_timer(3.0).timeout
	animated_sprite_2d.stop()


func _on_goal_left_area_2d_2_body_entered(body):
	if body.is_in_group("ball"):
		EventManager.GOAL.emit("red")
		await get_tree().create_timer(1.0).timeout
		global_position.y = 321
		global_position.x = 577
		linear_velocity.x = 0
		linear_velocity.y = 0


func _on_goal_right_area_2d_2_body_entered(body):
	if body.is_in_group("ball"):
		EventManager.GOAL.emit("blue")
		await get_tree().create_timer(1.0).timeout
		global_position.y = 321
		global_position.x = 577
		linear_velocity.x = 0
		linear_velocity.y = 0
