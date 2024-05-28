extends TileMap


func _process(_delta):
	if global.MemoryCollected == 0:
		material.set_shader_parameter("GrayScale",1)
	elif global.MemoryCollected == 1:
		material.set_shader_parameter("GrayScale",0.33)
