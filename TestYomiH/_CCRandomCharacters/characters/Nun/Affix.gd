extends CharacterState

func _frame_0():
	if host.combo_count <= 0:
		anim_length = 15
		iasa_at = 12
	else:
		anim_length = 8
		iasa_at = 7

func _frame_6():

	host.spawn_particle_effect_relative(particle_scene, host.hurtbox_pos_relative_float(), Vector2.RIGHT * host.get_facing_int())

	host.SWAP1()

func _frame_7():

	host.spawn_particle_effect_relative(particle_scene, host.hurtbox_pos_relative_float(), Vector2.RIGHT * host.get_facing_int())

func is_usable():
	return .is_usable() and host.SUFFER_ACTIVE > 0
