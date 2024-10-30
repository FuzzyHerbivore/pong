extends Node


func spawn_ball(ball_scene, position):
	var ball = ball_scene.instantiate()
	ball.position = position
	add_child(ball)
