extends ThrowState

const SKULL = preload("res://_CCRandomCharacters/characters/Nun/SKULL.tscn")

var Blunt = preload("res://_CCRandomCharacters/characters/Nun/VFX/BluntLight.tscn")

func _enter():
	host.start_invulnerability()

func _frame_0():

	host.hitlag_ticks = 4
	host.opponent.hitlag_ticks = 4


func _release():
	._release()
	var local_pos = host.opponent.get_center_position_float() - host.get_center_position_float()
	print(local_pos)
	var dir = fixed.normalized_vec(str(local_pos.x), str(local_pos.y+20))
	host.spawn_object(SKULL, -40, -40, true, {"dir": dir})
	host.spawn_object(SKULL, 0, -80,  true, {"dir": dir})

	host.spawn_particle_effect_relative(particle_scene, host.hurtbox_pos_relative_float(), Vector2.RIGHT * host.get_facing_int())

	host.hitlag_ticks = 4
	host.opponent.hitlag_ticks = 4

	host.end_invulnerability()
