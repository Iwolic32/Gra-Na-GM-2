extends CharacterBody2D


var InputDirection = Vector2.ZERO
var InputJump = 0
var InputUp = 0
var InputDown = 0
var Speed = 500
var Acc = 100
var Friction = 50
var Facing = 0
var t = 0.0
func _ready():
	Engine.max_fps = 60



func _process(delta):
	t += delta * 0.4
	global.PlayerPosition = position
	PlayerScreenCorruption()
	PlayerInput()
	AddFriction()
	PlayerMovement()
	PlayerDeath()
	PlayerSprite()
	move_and_slide() ##### VERY FUCKING CRUICIAL TO MOVING ||FOR FUTURE YOU||
	BATBOSSCamera()


func PlayerInput():
	InputDirection.x = int(Input.is_action_pressed("Right")) - int(Input.is_action_pressed("Left"))
	InputDirection = InputDirection.normalized()
	InputJump = int(Input.is_action_just_pressed("Jump"))
	InputUp = int(Input.is_action_pressed("Jump"))
	InputDown = int(Input.is_action_pressed("Down"))
	
func PlayerMovement():
	if InputDirection != Vector2.ZERO:
		velocity = velocity.move_toward(Speed * InputDirection, Acc)
	else:
		AddFriction()
	
	if InputJump == 1 and is_on_floor():
		velocity.y = global.PlayerJumpPower
	else:
		velocity.y += global.PlayerGravity
	
	if InputDown == 1 and is_on_floor():
		global.PlayerCrouched = 1
	else:
		global.PlayerCrouched = 0
	
	if global.PlayerIsOnLadder == 1 and InputUp == 1:
		velocity.y = global.PlayerLadderUpMovement
	elif global.PlayerIsOnLadder == 1 and InputDown == 1:
		velocity.y = global.PlayerLadderDownMovement
	
func AddFriction():
	velocity = velocity.move_toward(Vector2.ZERO, Friction)
	
func BATBOSSCamera():
	if position.x > 4915 and position.x < 6194:
		$Camera2D.global_position = position.lerp(Vector2(5552,32), t)
		$Camera2D.zoom = Vector2(0.7,0.7)
		if t >= 1:
			$Camera2D.global_position = Vector2(5552,32)
			t=1
	else:
		$Camera2D.global_position = position
		t=0

		
func PlayerDeath():
	if global.PlayerJustDied == 1:
		position = global.LastCheckpointLocation
		global.PlayerJustDied = 0

func PlayerScreenCorruption():
	if global.PlayerDeathCounter == 0:
		$Camera2D/Death1.hide()
		$Camera2D/Death2.hide()
		$Camera2D/Death3.hide()
		$Camera2D/Death4.hide()
		$Camera2D/Death5.hide()
	if global.PlayerDeathCounter == 1:
		$Camera2D/Death1.show()
		$Camera2D/Death2.hide()
		$Camera2D/Death3.hide()
		$Camera2D/Death4.hide()
		$Camera2D/Death5.hide()
	if global.PlayerDeathCounter == 2:
		$Camera2D/Death1.show()
		$Camera2D/Death2.show()
		$Camera2D/Death3.hide()
		$Camera2D/Death4.hide()
		$Camera2D/Death5.hide()
	if global.PlayerDeathCounter == 3:
		$Camera2D/Death1.show()
		$Camera2D/Death2.show()
		$Camera2D/Death3.show()
		$Camera2D/Death4.hide()
		$Camera2D/Death5.hide()
	if global.PlayerDeathCounter == 4:
		$Camera2D/Death1.show()
		$Camera2D/Death2.show()
		$Camera2D/Death3.show()
		$Camera2D/Death4.show()
		$Camera2D/Death5.hide()
	if global.PlayerDeathCounter == 5:
		$Camera2D/Death1.show()
		$Camera2D/Death2.show()
		$Camera2D/Death3.show()
		$Camera2D/Death4.show()
		$Camera2D/Death5.show()

func PlayerSprite():
	if global.Facing == -1 and velocity.x == 0:
		$Sprite2D.flip_h = true
	if global.Facing == 1:
		$Sprite2D.flip_h = false
