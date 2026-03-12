extends CharacterState

var UC = 1.1
var pressureframe = 10
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _enter():
	print("pressed")
	if host.alleviate == true:
		print("toggled in low cut")
	else:
		print("not toggled in low cut")
	
	if host.alleviate and host.is_grounded():
		print("pressure triggered")
		host.Pressure_Left -= 2
		host.change_state("STALK LOW")
		return "STALK LOW"

# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
