extends Marker2D


@export var ball_scene: PackedScene


func spawn_ball():
	if get_child_count() > 0:
		return

	var ball = ball_scene.instantiate()
	ball.position = position
	add_child(ball)
