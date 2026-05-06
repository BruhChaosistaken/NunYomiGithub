extends CharacterState

# apparently this had forces no limit lmao

func is_usable():
	return .is_usable() and host.SUFFER_ACTIVE <= 0

func _enter():
	if host.alleviate == false:
		host.Pressure_Left += 0.5
