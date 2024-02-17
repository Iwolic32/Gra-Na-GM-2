extends StaticBody2D

func _on_area_2d_body_entered(body):
	if body.is_in_group("ButtonPushingEntity"):
		print("BUTTON PRESSED")


func _on_area_2d_area_entered(area):
	if area.is_in_group("ButtonPushingEntity"):
		print("BUTTON PRESSED")
