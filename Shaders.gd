extends Sprite2D

var Value
var WantedValue = 0
var ShaderValue = material.get_shader_parameter("Gray Scale")


func _process(_delta):
	if global.MemoryCollected == 0:
		WantedValue = 0
	if global.MemoryCollected == 1:
		WantedValue = 0.20
	
	material.set_shader_parameter("Gray Scale", WantedValue)
	Value = material.get_shader_parameter("GrayScale")
