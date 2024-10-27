class_name Player extends CharacterBody2D


@export var move_up_action: String
@export var move_down_action: String
@export_range(50.0, 200.0) var movement_speed: float = 100.0


func _physics_process(_delta: float) -> void:
	var input_vector := Vector2.ZERO

	if Input.is_action_pressed(move_up_action):
		input_vector.y = -1.0
	if Input.is_action_pressed(move_down_action):
		input_vector.y = 1.0

	velocity = input_vector.normalized() * movement_speed

	move_and_slide()
