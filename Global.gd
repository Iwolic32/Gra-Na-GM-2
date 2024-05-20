extends RichTextLabel


var WindedUpTimer = 0
var PlayerGravity = 150
var PlayerJumpPower = -1750
var PlayerLadderUpMovement = 0
var PlayerLadderDownMovement = 0
var PlayerIsOnLadder = 0
var PlayerHasRedKey = 0
var SharpRockEquipped = 0
var PlayerDeathCounter = 0
var PlayerJustDied = 0
var LastCheckpointLocation = Vector2(333,180)
var PlayerPosition = Vector2(5552,32)
var Facing = 0
var RockLVelocity = null
var MemoryCollected = 0
var MemoryJustCollected = 0
var PlayerCrouched = 0
var BatBlockade = 0
var BatBossExecution = 0
var BossMusicOffTrigger = 0
var suicide = 0
func _process(_delta):
	if suicide == 1:
		WindedUpTimer = 0
		PlayerGravity = 150
		PlayerJumpPower = -1750
		PlayerLadderUpMovement = 0
		PlayerLadderDownMovement = 0
		PlayerIsOnLadder = 0
		PlayerHasRedKey = 0
		SharpRockEquipped = 0
		PlayerDeathCounter = 0
		PlayerJustDied = 0
		LastCheckpointLocation = Vector2(333,180)
		PlayerPosition = Vector2(5552,32)
		Facing = 0
		RockLVelocity = null
		MemoryCollected = 0
		MemoryJustCollected = 0
		PlayerCrouched = 0
		BatBlockade = 0
		BatBossExecution = 0
		BossMusicOffTrigger = 0
		suicide = 0
#	text = ""
#	text += str("WindedUpTimer: ", global.WindedUpTimer)
#	text += str("\nFPS: ", Engine.get_frames_per_second())
#	text += str("\nRedKey: ", global.PlayerHasRedKey)
#	text += str("\nDeaths: ", global.PlayerDeathCounter)
#	text += str("\nHoldingRock: ", global.SharpRockEquipped)
#	text += str("\nPlayerPos: ", global.PlayerPosition)
#	text += str("\nFacing: ", global.Facing)
#	text += str("\nLVelocity: ", global.RockLVelocity)
#	text += str("\nPlayerCrouched:  ", global.PlayerCrouched)
