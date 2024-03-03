extends StaticBody2D



func _process(_delta):
	MoveTheWall()

func MoveTheWall():
	position.y = -global.WindedUpTimer + 376
