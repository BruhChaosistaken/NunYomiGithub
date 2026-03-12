extends CharacterState

export  var speed_modifier_amount = "100.0"

var speed_modifier

export var UC = 2.0

func _frame_1():
	if data:
		speed_modifier = fixed.round(fixed.mul(fixed.sub(fixed.div(str(data.x), "100"), "0"), speed_modifier_amount))
	host.apply_force_relative(speed_modifier + 7, 0)

func is_usable():
	return .is_usable() and host.current_state().state_name != "CARVE 2"
