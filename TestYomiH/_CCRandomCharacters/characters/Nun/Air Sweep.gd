extends CharacterState

export var speed = "7"

func _enter():
	if data:
		if data.y == 0 and data.x == 1 * host.get_facing_int():
			host.apply_force_relative(12,1)
		if data.y == 1 and data.x == 0:
			host.apply_force_relative(2,7)
		if data.y == 1 and data.x == 1 * host.get_facing_int():
			host.apply_force_relative(7,5)
		else:
			host.apply_force_relative(0,2)
