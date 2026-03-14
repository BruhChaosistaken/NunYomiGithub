extends CharacterState

const SKULL = preload("res://_CCRandomCharacters/characters/Nun/SKULL.tscn")


func _frame_5():

	host.spawn_particle_effect_relative(particle_scene, host.hurtbox_pos_relative_float(), Vector2.RIGHT * host.get_facing_int())

	host.spook(host.get_center_position_float())
	


