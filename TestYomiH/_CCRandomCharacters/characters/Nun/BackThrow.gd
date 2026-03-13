extends ThrowState

func _enter():
	# gonna call this a cashout option
	# keeps skd oki but stacks on more pressure to make continuing more risky
	damage = damage + (10*host.Pressure_Left) 

func _release():
	._release()

	host.spawn_particle_effect(particle_scene,host.opponent.get_center_position_float())
	host.play_sound("DeathImminent")

	#host.global_hitlag(host.hitlag_ticks)
	#host.hitlag_ticks = 10
