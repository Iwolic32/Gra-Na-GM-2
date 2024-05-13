extends StaticBody2D


func _ready():
	$SwarmAnimation.play("Swarm")
	
func _process(_delta):
	if global.BatBlockade == 0:
		position.y = -9999
	elif global.BatBlockade == 1:
		position.y = 384
