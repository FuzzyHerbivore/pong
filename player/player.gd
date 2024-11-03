extends CharacterBody2D


@export var _move_up_action = ""
@export var _move_down_action = ""
@export_range(50.0, 200.0) var _movement_speed = 100.0
@export var _score_label: Label

var _score = 0:
	set(new_value):
		_score = new_value
		_score_label.text = str(_score)


func _physics_process(_delta):
	var input_vector = Vector2.ZERO

	if Input.is_action_pressed(_move_up_action):
		input_vector.y = -1.0
	if Input.is_action_pressed(_move_down_action):
		input_vector.y = 1.0

	velocity = input_vector.normalized() * _movement_speed

	move_and_slide()


func award_goal():
	_score += 1
