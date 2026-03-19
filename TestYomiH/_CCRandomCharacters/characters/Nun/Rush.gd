extends CharacterState

func _tick():
	if current_tick in [9, 15]:
		host.apply_force_relative("5", "0")

func enter():
	if host.alleviate and host.is_grounded():
		host.pressure_left -= 2
		host.change_state("Pressurerush")
		return "Pressurerush"

