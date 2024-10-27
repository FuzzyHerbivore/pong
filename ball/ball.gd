extends RigidBody2D


var velocity: Vector2


func _ready() -> void:
	velocity = Vector2(100.0, 0.0)

func _physics_process(delta: float) -> void:
	var collision := move_and_collide(velocity * delta)

	if collision != null:
		velocity = velocity.bounce(collision.get_normal())
