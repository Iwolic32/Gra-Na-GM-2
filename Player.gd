extends CharacterBody2D


var InputDirection = Vector2.ZERO
var InputJump = 0
var InputUp = 0
var InputDown = 0
var Speed = 500
var Acc = 100
var Friction = 50
var Facing = 0
func _ready():
	Engine.max_fps = 60



func _process(_delta):
	global.PlayerPosition = position
	PlayerScreenCorruption()
	PlayerInput()
	AddFriction()
	PlayerMovement()
	PlayerDeath()
	move_and_slide() ##### VERY FUCKING CRUICIAL TO MOVING ||FOR FUTURE YOU||


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
	
	if global.PlayerIsOnLadder == 1 and InputUp == 1:
		velocity.y = global.PlayerLadderUpMovement
	elif global.PlayerIsOnLadder == 1 and InputDown == 1:
		velocity.y = global.PlayerLadderDownMovement
	
func AddFriction():
	velocity = velocity.move_toward(Vector2.ZERO, Friction)
		
		
func PlayerDeath():
	if global.PlayerJustDied == 1:
		position = global.LastCheckpointLocation
		global.PlayerJustDied = 0

func PlayerScreenCorruption():
	if global.PlayerDied == 0:
		$Camera2D/Death1.hide()
	if global.PlayerDied == 1:
		$Camera2D/Death1.show()

