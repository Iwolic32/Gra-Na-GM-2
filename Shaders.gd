extends Sprite2D

var Value
var WantedValue = 1
func _process(_delta):
	material.set_shader_parameter("GrayScale", WantedValue)
	Value = material.get_shader_parameter("GrayScale")
	print(Value)
