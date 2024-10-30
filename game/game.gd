extends Node


const BALL_SCENE = preload("res://ball/ball.tscn")


var score_p_1 = 0:
	set(value):
		score_p_1 = value
		_update_score_labels()

var score_p_2 = 0:
	set(value):
		score_p_2 = value
		_update_score_labels()


func _physics_process(_delta):
	if Input.is_action_just_pressed("start"):
		if %BallManager.get_child_count() < 1:
			%BallManager.spawn_ball(BALL_SCENE, %BallSpawnPoint.global_position)


func _update_score_labels():
	%ScorePlayer1Label.text = str(score_p_1)
	%ScorePlayer2Label.text = str(score_p_2)


func _on_arena_goal_hit_east():
	score_p_1 += 1


func _on_arena_goal_hit_west():
	score_p_2 += 1
