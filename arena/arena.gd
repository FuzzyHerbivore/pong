extends Node2D


enum GoalSide {
	EAST = 1,
	WEST = 2
}

signal goal_hit(side: GoalSide)


func _on_goal_east_body_entered(body):
	if body is Ball:
		goal_hit.emit(GoalSide.EAST)
		body.queue_free()


func _on_goal_west_body_entered(body):
	if body is Ball:
		goal_hit.emit(GoalSide.WEST)
		body.queue_free()
