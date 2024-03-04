extends StaticBody2D



func _process(_delta):
	if global.MemoryCollected >= 1:
		position.y = -9999
		hide()
