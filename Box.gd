extends RigidBody2D

var PlayerIsInLeft = 0
var PlayerIsInRight = 0
var AxisVelocity = Vector2(2,0)
var Gravity = Vector2(0,10)
func _process(_delta):
	MoveCube()


func MoveCube():
	if PlayerIsInLeft == 1:
		move_and_collide(AxisVelocity)
	if PlayerIsInRight == 1:
		move_and_collide(-AxisVelocity)
	move_and_collide(Gravity)


func _on_left_body_entered(body):
	if body.is_in_group("Player"):
		PlayerIsInLeft = 1
		if $BoxSound.playing == false:
			$BoxSound.play()
		return PlayerIsInLeft

func _on_right_body_entered(body):
	if body.is_in_group("Player"):
		PlayerIsInRight = 1
		if $BoxSound.playing == false:
			$BoxSound.play()
		return PlayerIsInRight


func _on_left_body_exited(body):
	if body.is_in_group("Player"):
		PlayerIsInLeft = 0
		return PlayerIsInLeft


func _on_right_body_exited(body):
	if body.is_in_group("Player"):
		PlayerIsInRight = 0
		return PlayerIsInRight

