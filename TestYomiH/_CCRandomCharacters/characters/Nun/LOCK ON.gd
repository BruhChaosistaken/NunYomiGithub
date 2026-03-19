extends CharacterState

const EvilCross = preload("res://_CCRandomCharacters/characters/Nun/EvilCross.tscn")
# C.C NAME UR DAMN NODES IN A WAY THAT KEASE SENSE

# No :3

func traumatize():

	host.spawn_object(EvilCross, data.Proj1.x * host.get_facing_int() - 40, data.Proj1.y - 40)
	host.spawn_object(EvilCross, data.Proj2.x * host.get_facing_int() + 40, data.Proj2.y - 40)

func _frame_11():

	host.spawn_particle_effect_relative(particle_scene, host.hurtbox_pos_relative_float(), Vector2.RIGHT * host.get_facing_int())

	traumatize()


func is_usable():
	return .is_usable() and host.SUFFER_ACTIVE <= 0
