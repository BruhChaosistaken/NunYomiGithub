extends CharacterState


const Cross = preload("res://_CCRandomCharacters/characters/Nun/CrossProjectile.tscn")

func _enter():

	host.opponent.hitlag_ticks = 6
	host.hitlag_ticks = 2

func _frame_11():

	host.spawn_particle_effect_relative(particle_scene, host.hurtbox_pos_relative_float(), Vector2.RIGHT * host.get_facing_int())

	host.spawn_object(Cross, -40, -40)
	host.spawn_object(Cross, 40, -40)

	for objs in host.objs_map.values():
		if is_instance_valid(objs):
			if objs.is_in_group("Fighter"):
				if objs is BaseObj or BaseProjectile:
					objs.hitlag_ticks += 5

func is_usable():
	return .is_usable() and host.SUFFER_ACTIVE <= 0
