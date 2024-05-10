extends StaticBody2D

var PlayerEnteredInteractionHitbox = 0

func _process(_delta):
	CrankTheCrank()


func CrankTheCrank():
	if PlayerEnteredInteractionHitbox == 1 and Input.is_action_pressed("Interact") and global.WindedUpTimer <= 140:
		global.WindedUpTimer += 1
	elif global.WindedUpTimer != 0:
		global.WindedUpTimer -= 0.5
	else:
		pass
	if PlayerEnteredInteractionHitbox == 1 and Input.is_action_pressed("Interact"):
		$CrankAnimation.play("Cranking")
	else:
		$CrankAnimation.pause()

func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		PlayerEnteredInteractionHitbox = 1


func _on_area_2d_body_exited(body):
	if body.is_in_group("Player"):
		PlayerEnteredInteractionHitbox = 0
