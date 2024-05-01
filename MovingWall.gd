extends StaticBody2D



func _process(_delta):
	MoveTheWall()

func MoveTheWall():
	position.y = -global.WindedUpTimer + 376


func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		global.PlayerDeathCounter += 1
		global.PlayerJustDied = 1

