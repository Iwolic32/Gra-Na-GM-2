extends StaticBody2D

var PlayerEnteredInteractionHitbox = 0


func _on_area_2d_body_entered(body):
	if body.is_in_group("Rock"):
		position.y = -9999
		hide()
