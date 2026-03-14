extends CharacterState

const Cross = preload("res://_CCRandomCharacters/characters/Nun/CrossProjectile.tscn")
# C.C NAME UR DAMN NODES IN A WAY THAT KEASE SENSE

# No :3

func _frame_11():

	host.spawn_particle_effect_relative(particle_scene, host.hurtbox_pos_relative_float(), Vector2.RIGHT * host.get_facing_int())

	host.traumatize()


func is_usable():
	return .is_usable() and host.SUFFER_ACTIVE <= 0
