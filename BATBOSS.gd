extends Node2D

var Diviation = null
var TargetPosition = Vector2(0,0)
var random = RandomNumberGenerator.new()
var t = 0.0
var StartingPosition = Vector2(0,0)
var Attack = 0
var Damaged = 0
@onready var Rock = preload("res://Rock.tscn")
@onready var b = $BATBOSS
func _ready():
	TargetPosition = Vector2(0,0)
	
func _physics_process(delta):
#	print(TargetPosition)
#	print(StartingPosition)
#	print(b.position, "LOCAL")
#	print(b.global_position, "GLOBAL")
#	print(Damaged)
	t += delta * 0.8
	b.position = StartingPosition.lerp(TargetPosition, t)
	if Attack == 1 and StartingPosition.x - TargetPosition.x < 0 and global.BatBossExecution == 0:
		$BATBOSS/BatAnimation.play("Right")
	elif Attack == 1 and StartingPosition.x - TargetPosition.x > 0 and global.BatBossExecution == 0:
		$BATBOSS/BatAnimation.play("Left")
	elif Attack == 0 and $AnimationTimer.is_stopped() == true and global.BatBossExecution == 0:
		$BATBOSS/BatAnimation.play("Flying")
	if t > 1:
		t=1
	if TargetPosition == b.position:
		if Damaged >= 5:
			global.BatBossExecution = 1
			$BATBOSS/BatAnimation.stop()
			$BATBOSS/BatAnimation.play("Scream")
			$Scream.play()
			return
		if Attack == 1:
			$BATBOSS/Damage/DamageCollision.disabled = true
			var RockInstance = Rock.instantiate()
			add_child(RockInstance)
			RockInstance.position = b.position + Vector2(0,40)
			$Timer.start()
			$GroundHit.play()
			
		if b.position.y <= -150 and global.PlayerPosition.x > 4915 and global.PlayerPosition.x < 6191:
			if $AnimationTimer.is_stopped() == true:
				$AnimationTimer.start()
				$BATBOSS/ForeshadowingAttack.play("AttackForeshadowing")
		else:
			Attack = 0
			TargetPosition = Vector2(random.randi_range(-646,646),random.randi_range(-274,100))
		StartingPosition = b.position
		t=0
	
func _process(_delta):
	if Damaged >= 5 and global.BossMusicOffTrigger == 0:
		TargetPosition = Vector2(0,0)



func _on_damage_body_entered(body):
	if body.is_in_group("Player"):
		global.PlayerDeathCounter += 1
		global.PlayerJustDied = 1
	if body.is_in_group("Rock"):
		Damaged += 1
		$GettingHit.play()
	if body.is_in_group("BatKillingSpike") and Damaged >= 5:
		global.BossMusicOffTrigger = 1
		b.position.y = -9999
		TargetPosition.y = -9999
		b.hide()
		$TileMap.position.y -= 9999
		$TileMap.hide()


func _on_damage_body_exited(body):
	if body.is_in_group("Player"):
		pass


func _on_timer_timeout():
	$BATBOSS/Damage/DamageCollision.disabled = false


func _on_animation_timer_timeout():
	TargetPosition = Vector2(global.PlayerPosition.x -5552,362)
	Attack = 1
