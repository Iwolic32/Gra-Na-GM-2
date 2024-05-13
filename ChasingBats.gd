extends StaticBody2D

var PlayerIsSafe = 0



func _on_trigger_body_entered(body):
	if body.is_in_group("Player"):
		$InnitialTimer.start()



func _on_innitial_timer_timeout():
	$Killzone.position = Vector2(0,0)
	$MovementTickTimer.start()


func _on_movement_tick_timer_timeout():
	if $Killzone.position.x <= 887:
		$Killzone.position.x += 4
	else:
		$Killzone.position = Vector2(0,-999)
		$MovementTickTimer.stop()


func _on_safe_body_entered(body):
	if body.is_in_group("Player"):
		PlayerIsSafe = 1


func _on_safe_body_exited(body):
	if body.is_in_group("Player"):
		PlayerIsSafe = 0


func _on_killzone_body_entered(body):
	if body.is_in_group("Player"):
		if PlayerIsSafe == 1 and global.PlayerCrouched == 1:
			pass
		else:
			global.PlayerJustDied = 1
			global.PlayerDeathCounter += 1
			$Killzone.position = Vector2(0,-999)
			$MovementTickTimer.stop()
