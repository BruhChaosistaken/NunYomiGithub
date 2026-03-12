extends CharacterState


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _frame_0():
	
	host.set_vel(fixed.mul("0", str(host.get_facing_int())), "0")
	
	 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
