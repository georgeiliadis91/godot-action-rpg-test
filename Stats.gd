extends Node

export var max_heath = 1
onready var health = max_heath setget set_health

signal no_health


func set_health(val):
	health=val
	if health<=0:
		emit_signal("no_health")
