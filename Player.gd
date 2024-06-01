extends CharacterBody2D


var InputDirection = Vector2.ZERO
var InputJump = 0
var InputUp = 0
var InputDown = 0
var Speed = 250
var Acc = 100
var Friction = 50
var Facing = 0
var t = 0.0

func _ready():
	Engine.max_fps = 60
	global.LastCheckpointLocation = position

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
	Music()
	Ending()
	
func PlayerInput():
	InputDirection.x = int(Input.is_action_pressed("Right")) - int(Input.is_action_pressed("Left"))
	InputDirection = InputDirection.normalized()
	InputJump = int(Input.is_action_just_pressed("Jump"))
	InputUp = int(Input.is_action_pressed("Jump"))
	InputDown = int(Input.is_action_pressed("Down"))
	
func PlayerMovement():
	if InputDirection != Vector2.ZERO and int(Input.is_action_pressed("Down")) == 0:
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
	if position.x > 4910 and position.x < 6194 and position.y <= 459:
		global.BatBlockade = 1
		$Camera2D.global_position = position.lerp(Vector2(5552,32), t)
		$Camera2D.zoom = Vector2(0.7,0.7)
		$Camera2D.scale = Vector2(1.43,1.43)
		if t >= 1:
			$Camera2D.global_position = Vector2(5552,32)
			t=1
	else:
		$Camera2D.zoom = Vector2(1,1)
		$Camera2D.scale = Vector2(1,1)
		$Camera2D.global_position = position
		t=0

		
func PlayerDeath():
	if global.PlayerJustDied == 1:
		position = global.LastCheckpointLocation
		global.PlayerJustDied = 0
		global.BatBlockade = 0
		$DeathAudio.play()
		if global.PlayerDeathCounter >= 5:
			global.suicide = 1
			get_tree().reload_current_scene()

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
	if global.Facing == -1 and int(Input.is_action_pressed("Down")) == 1 and global.PlayerIsOnLadder == 0:
		$PlayerAnimationPlayer.play("LCrouch")
	elif global.Facing == 1 and int(Input.is_action_pressed("Down")) == 1 and global.PlayerIsOnLadder == 0:
		$PlayerAnimationPlayer.play("RCrouch")
	elif int(Input.is_action_pressed("Down")) == 1 and global.PlayerIsOnLadder == 0:
		$PlayerAnimationPlayer.play("RCrouch")
	elif int(Input.is_action_pressed("Down")) == 1 and global.PlayerIsOnLadder == 1 or int(Input.is_action_pressed("Jump")) == 1 and global.PlayerIsOnLadder == 1:
		$PlayerAnimationPlayer.play("Ladder")
		if $Ladder.playing == false:
			$Ladder.play()
	elif !is_on_floor() and global.Facing == -1:
		$PlayerAnimationPlayer.play("LJump")
	elif !is_on_floor() and global.Facing == 1:
		$PlayerAnimationPlayer.play("RJump")
	elif global.Facing == 1 and velocity.x != 0 and global.PlayerIsOnLadder == 0:
		$PlayerAnimationPlayer.play("RWalk")
		if $Footsteps.playing == false:
			$Footsteps.play()
	elif global.Facing == -1 and velocity.x != 0 and global.PlayerIsOnLadder == 0:
		$PlayerAnimationPlayer.play("LWalk")
		if $Footsteps.playing == false:
			$Footsteps.play()
	elif global.Facing == 1 and velocity.x == 0 and global.PlayerIsOnLadder == 0:
		$PlayerAnimationPlayer.play("RIdle")
	elif global.Facing == -1 and velocity.x == 0 and global.PlayerIsOnLadder == 0:
		$PlayerAnimationPlayer.play("LIdle")
	elif global.PlayerIsOnLadder == 1:
		$PlayerAnimationPlayer.pause()



func Music():
	if position.x < 4910 and position.y <= 459 or global.BossMusicOffTrigger == 1 and position.y <= 459:
		if $AmbientAudio.playing == false:
			$AmbientAudio.play()
			$BossAudio.stop()
	if position.x > 4910 and position.y <= 459 and global.BossMusicOffTrigger == 0:
		if $BossAudio.playing == false:
			$AmbientAudio.stop()
			$BossAudio.play()

func Ending():
	if global.Ending == 0:
		$Sprite2D2.visible = false
	if global.Ending == 1:
		$Sprite2D2.visible = true
