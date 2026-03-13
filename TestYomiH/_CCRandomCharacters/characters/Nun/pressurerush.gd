extends CharacterState

var STALK = false
var UC = 1.25

func _tick():

	if current_tick > 4:
		host.set_vel(fixed.mul("10", str(host.get_facing_int())), "0")
