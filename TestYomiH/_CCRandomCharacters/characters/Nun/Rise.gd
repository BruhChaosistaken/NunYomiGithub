extends CharacterState

export var UC: float = 4

func _frame_10():

	if host.initiative:
		host.has_hyper_armor = true

func _frame_13():

	if host.initiative:
		host.has_hyper_armor = false

func _tick():
	if current_tick >= 9 and current_tick < 13:
		host.create_speed_after_image_from_style(1)
