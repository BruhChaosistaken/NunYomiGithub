extends ThrowState

const particle_scene_2 = preload("res://_CCRandomCharacters/characters/Nun/VFX/Slash.tscn")

func _frame_0():

	host.start_invulnerability()

	host.hitlag_ticks = 8
	host.opponent.hitlag_ticks = 8

	host.spawn_particle_effect(particle_scene,host.opponent.get_center_position_float())

func _release():
	._release()

	host.hitlag_ticks = 8
	host.opponent.hitlag_ticks = 8

	host.spawn_particle_effect(particle_scene_2,host.opponent.get_center_position_float())

	host.end_invulnerability()
