extends CharacterState

func _frame_0():
	if host.initiative:
		host.colliding_with_opponent = false

	if not _previous_state_name() == "Sprint":
		host.play_sound("Whoosh")

		spawn_particle_relative(particle_scene)

func _frame_5():
	host.play_sound("step")

func _frame_11():
	host.play_sound("step")

func _tick():
	
	host.Pressure_Left -= 0.25

	if current_tick % 3 == 0:
		host.create_speed_after_image_from_style(1)

	host.set_vel(fixed.mul("16", str(host.get_facing_int())), "0")
