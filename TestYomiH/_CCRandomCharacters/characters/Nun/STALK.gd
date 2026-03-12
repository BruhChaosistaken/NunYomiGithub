extends CharacterState

var Stance_Changes = 1

func _enter():
	host.Pressure_Left += 0.05 * Stance_Changes
	Stance_Changes += 1

func _frame_8():
	if host.initiative:

		host.create_speed_after_image_from_style(1)
