extends StaticBody2D


func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		global.MemoryCollected += 1
		global.MemoryJustCollected = 1
		global.PlayerDeathCounter = 0
		position.y = -9999
		hide()
