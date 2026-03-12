extends CharacterState

export var speed = "15"

func _frame_7():
	var dir = host.xy_to_dir(data.x, data.y, speed)

	host.apply_force(dir.x , fixed.div(dir.y, "2"))

func _frame_11():
	host.set_vel(fixed.mul(str(host.get_facing_int()), "1"), "0")

func _tick():
	host.apply_forces_no_limit()

#	if current_tick >= 11:
#		host.apply_grav()
