extends StaticBody2D

func _on_killing_collision_body_entered(body):
	if body.is_in_group("Player"):
		global.PlayerDeathCounter += 1
		global.PlayerJustDied = 1
