extends StaticBody2D


func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		global.PlayerGravity = 0
		global.PlayerJumpPower = 0
		global.PlayerLadderDownMovement = 200
		global.PlayerLadderUpMovement = -200
		global.PlayerIsOnLadder = 1

func _on_area_2d_body_exited(body):
	if body.is_in_group("Player"):
		global.PlayerGravity = 150
		global.PlayerLadderDownMovement = 0
		global.PlayerLadderUpMovement = 0
		global.PlayerJumpPower = -2000
		global.PlayerIsOnLadder = 0
