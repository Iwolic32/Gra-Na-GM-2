extends StaticBody2D



func _process(_delta):
	if global.MemoryCollected >= 1:
		position.y = -9999
		hide()




func _on_aa_body_entered(body):
	if body.is_in_group("Player"):
		$AA/Sprite2D.show()


func _on_bb_body_entered(body):
	if body.is_in_group("Player"):
		$BB/Sprite2D.show()


func _on_cc_body_entered(body):
	if body.is_in_group("Player"):
		$CC/Sprite2D.show()


func _on_dd_body_entered(body):
	if body.is_in_group("Player"):
		$DD/Sprite2D.show()


func _on_aa_body_exited(body):
	if body.is_in_group("Player"):
		$AA/Sprite2D.hide()


func _on_bb_body_exited(body):
	if body.is_in_group("Player"):
		$BB/Sprite2D.hide()


func _on_cc_body_exited(body):
	if body.is_in_group("Player"):
		$CC/Sprite2D.hide()


func _on_dd_body_exited(body):
	if body.is_in_group("Player"):
		$DD/Sprite2D.hide()
