extends CharacterState

var STALK = false
export var UC: float = 2
func _enter():

	if host.alleviate and host.is_grounded():
		host.Pressure_Left -= 2
		host.change_state("STALK HIGH")
		return "STALK HIGH"
