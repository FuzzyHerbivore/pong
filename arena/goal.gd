extends Area2D


@export var _opposing_player: CharacterBody2D


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("collision_with_goal"):
		body.collision_with_goal()
		_opposing_player.award_goal()
