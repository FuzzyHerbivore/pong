extends Node


@export var ball_scene: PackedScene


func _physics_process(_delta):
	if Input.is_action_just_pressed("start"):
		if %BallManager.get_child_count() < 1:
			%BallManager.spawn_ball(ball_scene, %BallSpawnPoint.global_position)
