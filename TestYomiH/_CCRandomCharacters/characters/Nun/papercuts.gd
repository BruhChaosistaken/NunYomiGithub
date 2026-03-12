extends CharacterState

var STALK = false
var UC = 1.25
func _enter():

	if host.alleviate and host.is_grounded():
		host.Pressure_Left -= 2
		host.change_state("Pressurerush")
		return "Pressurerush"
		
