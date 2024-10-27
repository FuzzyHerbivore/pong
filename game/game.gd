extends Node


const ball_scene: PackedScene = preload("res://ball/ball.tscn")


@onready var world: Node2D = %World
@onready var arena: Arena = %Arena
@onready var score_p_1_label: Label = %ScorePlayer1Label
@onready var score_p_2_label: Label = %ScorePlayer2Label
@onready var ball_spawn_point: Marker2D = %BallSpawnPoint

var score_p_1 := 0:
	set(value):
		score_p_1 = value
		_update_score_labels()

var score_p_2 := 0:
	set(value):
		score_p_2 = value
		_update_score_labels()


func _ready() -> void:
	arena.goal_hit_east.connect(
		func () -> void:
			score_p_1 += 1
	)
	arena.goal_hit_west.connect(
		func () -> void:
			score_p_2 += 1
	)


func _physics_process(_delta: float) -> void:
	var ball_in_game := get_children().filter(func (child) -> bool: return child is Ball)

	if Input.is_action_just_pressed("start") and not ball_in_game:
		_spawn_ball(ball_spawn_point.global_position)


func _update_score_labels() -> void:
	score_p_1_label.text = str(score_p_1)
	score_p_2_label.text = str(score_p_2)


func _spawn_ball(position: Vector2) -> void:
	var ball: Ball = ball_scene.instantiate()
	ball.position = position
	add_child(ball)
