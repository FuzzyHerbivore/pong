extends Node2D


enum GoalSide {
	EAST = 1,
	WEST = 2
}

signal goal_hit(side: GoalSide)


func _on_goal_east_body_entered(body):
	if body.has_method("collision_with_goal"):
		goal_hit.emit(GoalSide.EAST)
		body.collision_with_goal()


func _on_goal_west_body_entered(body):
	if body.has_method("collision_with_goal"):
		goal_hit.emit(GoalSide.WEST)
		body.collision_with_goal()
