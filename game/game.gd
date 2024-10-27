extends Node


const BALL_SCENE: PackedScene = preload("res://ball/ball.tscn")


@onready var _arena: Arena = %Arena
@onready var _score_p_1_label: Label = %ScorePlayer1Label
@onready var _score_p_2_label: Label = %ScorePlayer2Label
@onready var _ball_spawn_point: Marker2D = %BallSpawnPoint

var score_p_1 := 0:
	set(value):
		score_p_1 = value
		_update_score_labels()

var score_p_2 := 0:
	set(value):
		score_p_2 = value
		_update_score_labels()


func _ready() -> void:
	_arena.goal_hit_east.connect(
		func () -> void:
			score_p_1 += 1
	)
	_arena.goal_hit_west.connect(
		func () -> void:
			score_p_2 += 1
	)


func _physics_process(_delta: float) -> void:
	var check_for_balls = func (child) -> bool: return child is Ball
	var no_ball_in_game := get_children().filter(check_for_balls).is_empty()

	if Input.is_action_just_pressed("start") and no_ball_in_game:
		_spawn_ball(_ball_spawn_point.global_position)


func _update_score_labels() -> void:
	_score_p_1_label.text = str(score_p_1)
	_score_p_2_label.text = str(score_p_2)


func _spawn_ball(position: Vector2) -> void:
	var ball: Ball = BALL_SCENE.instantiate()
	ball.position = position
	add_child(ball)
