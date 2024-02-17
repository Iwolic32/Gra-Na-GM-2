extends StaticBody2D


func _on_area_2d_body_entered(body):
	if body.is_in_group("Player") and global.PlayerHasRedKey == 1:
		global.PlayerHasRedKey = 0
		position.y = -9999
		hide()
