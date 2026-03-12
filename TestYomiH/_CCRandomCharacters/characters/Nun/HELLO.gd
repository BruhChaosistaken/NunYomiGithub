extends CharacterState

func _frame_0():

	host.apply_force_relative(data.x * 5, 0)

func _tick():
	host.apply_forces_no_limit()

func is_usable():
	return .is_usable() and host.SUFFER_ACTIVE <= 0
