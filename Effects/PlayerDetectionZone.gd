extends Area2D

var player = null


func can_see_player():
	return player != null

#on enter
func _on_PlayerDetectionZone_body_entered(body):
	player =  body
	
#on exit
func _on_PlayerDetectionZone_body_exited(body):
	player = null
