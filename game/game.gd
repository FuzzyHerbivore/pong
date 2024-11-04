extends Node


@export var _ball_scene: PackedScene


func _physics_process(_delta):
	if Input.is_action_just_pressed("start"):
		if %BallManager.get_child_count() < 1:
			%BallManager.spawn_ball(_ball_scene, %BallSpawnPoint.global_position)
