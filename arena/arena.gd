extends Node2D


signal goal_hit_east
signal goal_hit_west


func _on_goal_east_body_entered(body):
	if body is Ball:
		goal_hit_east.emit()
		body.queue_free()


func _on_goal_west_body_entered(body):
	if body is Ball:
		goal_hit_west.emit()
		body.queue_free()
