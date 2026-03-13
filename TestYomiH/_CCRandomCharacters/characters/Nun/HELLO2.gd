extends ThrowState



var Blunt = preload("res://_CCRandomCharacters/characters/Nun/VFX/BluntLight.tscn")

func _enter():
	host.start_invulnerability()

func _frame_0():

	host.hitlag_ticks = 4
	host.opponent.hitlag_ticks = 4


func _release():
	._release()
	

	host.spawn_particle_effect_relative(particle_scene, host.hurtbox_pos_relative_float(), Vector2.RIGHT * host.get_facing_int())

	host.hitlag_ticks = 4
	host.opponent.hitlag_ticks = 4

	host.end_invulnerability()
