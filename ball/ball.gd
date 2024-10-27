class_name Ball extends RigidBody2D


@export var initial_speed := 100.0
@export_range(0, 120, 1) var start_angle_spread := 60

var _velocity: Vector2


func _ready() -> void:
	var invert_direction := bool(randi_range(0, 1))

	var starting_velocity := Vector2.RIGHT
	if invert_direction:
		starting_velocity *= -1

	var start_angle_deviation_from_x_axis := float(start_angle_spread) / 2.0
	var random_direction_degrees := randf_range(-start_angle_deviation_from_x_axis, start_angle_deviation_from_x_axis)
	starting_velocity = starting_velocity.rotated(deg_to_rad(random_direction_degrees))
	_velocity = starting_velocity * initial_speed


func _physics_process(delta: float) -> void:
	var collision := move_and_collide(_velocity * delta)

	if collision != null:
		_velocity = _velocity.bounce(collision.get_normal())
