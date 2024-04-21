extends Node2D
var Diviation = null
var TargetPosition = Vector2(0,0)
var random = RandomNumberGenerator.new()
var t = 0.0
var StartingPosition = Vector2(0,0)
var Attack = 0
@onready var Rock = preload("res://Rock.tscn")
@onready var b = $BATBOSS
func _ready():
	TargetPosition = Vector2(0,0)
	
func _physics_process(delta):
	print(TargetPosition)
	print(StartingPosition)
	print(b.position, "LOCAL")
	print(b.global_position, "GLOBAL")
	t += delta * 0.8
	b.position = StartingPosition.lerp(TargetPosition, t)
	if t > 1:
		t=1
	if TargetPosition == b.position:
		if Attack == 1:
			var RockInstance = Rock.instantiate()
			add_child(RockInstance)
			RockInstance.position = b.position + Vector2(0,40)
			
		if b.position.y <= -150 and global.PlayerPosition.x > 4915 and global.PlayerPosition.x < 6191:
			Attack = 1
			TargetPosition = Vector2(global.PlayerPosition.x -5552,362)
		else:
			Attack = 0
			TargetPosition = Vector2(random.randi_range(-646,646),random.randi_range(-362,100))
		StartingPosition = b.position
		t=0




func _on_damage_body_entered(body):
	if body.is_in_group("Player"):
		pass


func _on_damage_body_exited(body):
	if body.is_in_group("Player"):
		pass
