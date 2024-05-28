extends Sprite2D





func _process(_delta):
	if global.MemoryCollected == 0:
		material.set_shader_parameter("GrayScale",0)
	elif global.MemoryCollected == 0:
		material.set_shader_parameter("GrayScale",0.33)
