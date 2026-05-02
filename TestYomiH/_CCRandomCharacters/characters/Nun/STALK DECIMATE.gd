extends CharacterState

func _enter():
	host.apply_forces_no_limit()

func _frame_7():
	host.start_projectile_invulnerability()

func _frame_13():
	host.end_projectile_invulnerability()

func _tick():
	if current_tick % 2 == 0:
		host.create_speed_after_image_from_style(1)



	


