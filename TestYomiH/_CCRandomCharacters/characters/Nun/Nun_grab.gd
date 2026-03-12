extends ThrowState

func _enter():
	host.start_invulnerability()

	host.opponent.hitlag_ticks = 4
	host.hitlag_ticks = 4



func _frame_13():

	host.spawn_particle_effect(particle_scene,host.opponent.get_center_position_float())

func _frame_19():

	host.Pressure_Left += 1.0
	host.opponent.hitlag_ticks = 2
	host.hitlag_ticks = 2

	host.end_invulnerability()
