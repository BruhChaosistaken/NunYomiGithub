extends ThrowState

func _enter():
	damage = damage * host.Pressure_Left

func _release():
	._release()

	host.spawn_particle_effect(particle_scene,host.opponent.get_center_position_float())
	host.play_sound("DeathImminent")

	host.global_hitlag(host.hitlag_ticks)
	host.hitlag_ticks = 10
