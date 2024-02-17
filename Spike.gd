extends RigidBody2D
var Gravity = Vector2(0,0)


func _process(_delta):
	move_and_collide(Gravity)

func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		Gravity = Vector2(0,10)

func _on_killing_collision_body_entered(body):
	if body.is_in_group("Player"):
		global.PlayerDied += 1
		global.PlayerJustDied = 1
