extends Node2D

@onready var ChasingBats = $ChasingBats/Killzone/CollisionShape2D/Sprite2D
@onready var Player = $CharacterBody2D/Sprite2D

func _process(_delta):
	print(global.MemoryCollected)
	Player.material.set_shader_parameter("GrayScale",0)
	if global.MemoryCollected == 0:
		$Actualbck.material.set_shader_parameter("GrayScale", 0.0)
		ChasingBats.material.set_shader_parameter
		$ChasingBats/Killzone/CollisionShape2D/Sprite2D2.material.set_shader_parameter("GrayScale",0.0)
		$ChasingBats/Killzone/CollisionShape2D/Sprite2D3.material.set_shader_parameter("GrayScale",0.0)
