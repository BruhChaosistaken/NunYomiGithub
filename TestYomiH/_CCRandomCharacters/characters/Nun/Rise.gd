extends CharacterState

export var UC = 2.0

var STALK = false

func _enter():

	STALK = data
	if STALK == true:
		fallback_state = "STALK"
		host.stance = "Stalk"

	else:
		fallback_state = "Wait"

func _frame_10():

	if host.initiative:
		host.has_hyper_armor = true

func _frame_13():

	if host.initiative:
		host.has_hyper_armor = false

func _tick():
	if current_tick >= 9 and current_tick < 13:
		host.create_speed_after_image_from_style(1)

func on_got_blocked():
	if host.Pressure_Left > 5 and host.SUFFER_ACTIVE == 0:
		host.terrify_opponent()
