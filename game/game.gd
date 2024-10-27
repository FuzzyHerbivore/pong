extends Node


@onready var arena: Arena = %Arena
@onready var score_p_1_label: Label = %ScorePlayer1Label
@onready var score_p_2_label: Label = %ScorePlayer2Label

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


func _update_score_labels() -> void:
	score_p_1_label.text = str(score_p_1)
	score_p_2_label.text = str(score_p_2)
