extends CharacterState

func _frame_0():

	host.set_vel(fixed.mul("0", str(host.get_facing_int())), "0")
