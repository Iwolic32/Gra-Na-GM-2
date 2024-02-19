extends Area2D


func _on_body_entered(body):
	if body.is_in_group("Player"):
		global.PlayerDied += 1
		global.PlayerJustDied = 1
