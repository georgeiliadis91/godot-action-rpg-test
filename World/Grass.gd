extends Node2D

#How to replace node with node animations 
# Load scene
# Get instance of new scene
# add scene as child of node
# set position 

func _process(delta):
	if Input.is_action_just_pressed("attack"):
		var GrassEffect = load("res://Effects/GrassEffect.tscn")
		var grassEffect = GrassEffect.instance()
		var world = get_tree().current_scene
		world.add_child(grassEffect)
		grassEffect.global_position = global_position
		queue_free()
