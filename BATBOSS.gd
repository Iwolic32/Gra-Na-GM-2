extends StaticBody2D
var Diviation = null
var TargetPosition = Vector2(0,0)
var random = RandomNumberGenerator.new()
var x = 0
var y = 0
func _process(_delta):
	Movement()
	print(TargetPosition)
	print(position,Vector2(int(position.x + x),int(position.y + y)))
	print(int(Diviation.x))
	print(int(Diviation.y))
func Movement():
	if TargetPosition == Vector2(int(position.x + x),int(position.y + y)):
		TargetPosition = Vector2(random.randi_range(-646,646),random.randi_range(-400,400)) #656 - 416
	Diviation = TargetPosition - Vector2(int(position.x + x),int(position.y + y))
	
	if int(Diviation.x) == 1:
		x = -1
	elif int(Diviation.x) == 1:
		x = 1
	else:
		x = 0
	if int(Diviation.y) == 1:
		y = -1
	elif int(Diviation.y) == 1:
		y = 1
	else:
		y = 0
	move_and_collide(Diviation)
