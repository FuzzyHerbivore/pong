extends RigidBody2D


@export var _initial_speed = 100.0
@export_range(0, 120, 1) var _start_angle_spread = 60

var _velocity


func _ready():
	var invert_direction = bool(randi_range(0, 1))

	var starting_velocity = Vector2.RIGHT
	if invert_direction:
		starting_velocity *= -1

	var start_angle_deviation_from_x_axis = float(_start_angle_spread) / 2.0
	var random_direction_degrees = randf_range(
		-start_angle_deviation_from_x_axis,
		start_angle_deviation_from_x_axis
	)
	var random_direction_radians = deg_to_rad(random_direction_degrees)
	starting_velocity = starting_velocity.rotated(random_direction_radians)
	_velocity = starting_velocity * _initial_speed


func _physics_process(delta):
	var collision = move_and_collide(_velocity * delta)

	if collision != null:
		_velocity = _velocity.bounce(collision.get_normal())


func collision_with_goal():
	queue_free()
