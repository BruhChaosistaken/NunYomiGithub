extends CharacterState

var STALK = false
export var UC: float = 4

func _enter():

	if host.combo_count > 0 and host.current_state().name == "Papercuts":
		anim_length = 32

	if host.alleviate and host.is_grounded():
		host.Pressure_Left -= 2
		host.change_state("Pressurerush")
		return "Pressurerush"
		
