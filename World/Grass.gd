extends Node2D

#How to replace node with node animations 
# Load scene
# Get instance of new scene
# add scene as child of node
# set position 


func create_grass_effect():
	var GrassEffect = load("res://Effects/GrassEffect.tscn")
	var grassEffect = GrassEffect.instance()
	var world = get_tree().current_scene
	world.add_child(grassEffect)
	grassEffect.global_position = global_position


func _on_Hurtbox_area_entered(area):
	create_grass_effect()
	queue_free()
