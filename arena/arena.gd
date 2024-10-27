class_name Arena extends Node2D


signal goal_hit_east
signal goal_hit_west


@onready var goal_east: Area2D = %GoalEast
@onready var goal_west: Area2D = %GoalWest


func _ready() -> void:
	goal_east.body_entered.connect(
		func (body: Node2D) -> void:
			if body is Ball:
				print("ball in east goal")
				goal_hit_east.emit()
	)
	goal_west.body_entered.connect(
		func (body: Node2D) -> void:
			if body is Ball:
				print("ball in west goal")
				goal_hit_west.emit()
	)
