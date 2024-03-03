extends RigidBody2D

var PlayerEnteredInteractionHitbox = 0

func _process(_delta):
	MoveTheRock()
	PickUp()

func MoveTheRock():
	if int(Input.is_action_pressed("Jump")):
		global.Facing = 2
	if int(Input.is_action_pressed("Right")):
		global.Facing = 1
	if int(Input.is_action_pressed("Left")):
		global.Facing = -1
	if global.SharpRockEquipped == 1 and int(Input.is_action_pressed("Attack")):
		if global.Facing == 1:
			apply_impulse(Vector2(500,-250))
		if global.Facing == -1:
			apply_impulse(Vector2(-500,-250))
		if global.Facing == 2:
			apply_impulse(Vector2(0,-500))
		global.SharpRockEquipped = 0
	elif global.SharpRockEquipped == 0:
		if $Timer.is_stopped() == true:
			$Timer.start()
	elif global.SharpRockEquipped == 1:
		$CollisionShape2D.disabled = true
		move_and_collide(Vector2(1,1))
		position = global.PlayerPosition + Vector2(0,-10)
		angular_velocity = 0
		linear_velocity = Vector2(0,0)
	global.RockLVelocity = linear_velocity

func PickUp():
	if PlayerEnteredInteractionHitbox == 1 and int(Input.is_action_pressed("Interact")) == 1:
		global.SharpRockEquipped = 1


func _on_timer_timeout():
	$CollisionShape2D.disabled = false


func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		PlayerEnteredInteractionHitbox = 1


func _on_area_2d_body_exited(body):
	if body.is_in_group("Player"):
		PlayerEnteredInteractionHitbox = 0
