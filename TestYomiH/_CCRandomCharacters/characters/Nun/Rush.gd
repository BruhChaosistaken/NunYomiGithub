extends CharacterState

func enter():
	if host.alleviate and host.is_grounded():
		host.pressure_left -= 2
		host.change_state("Pressurerush")
		return "Pressurerush"

