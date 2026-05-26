extends CharacterState

# apparently this had forces no limit lmao

func is_usable():
	return .is_usable() and host.Pressure_Left >= 5.0
