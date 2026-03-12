extends CharacterState

func _frame_1():
	host.grab_camera_focus()

	host.opponent.hitlag_ticks = 10
	host.hitlag_ticks = 5

# on frame 20, arbitrary number
func _frame_11():
	# add 3 stacks
	host.damage_buff_stacks += 10

	host.spawn_particle_effect_relative(particle_scene, host.hurtbox_pos_relative_float())

	host.play_sound("GLITCH")

	host.opponent.hitlag_ticks = 4
	host.hitlag_ticks = 4

	host.hp -= 50

func _exit():
	host.release_camera_focus()

func is_usable():
	return .is_usable() and host.supers_available >= 2 and host.damage_buff_stacks <= 0
