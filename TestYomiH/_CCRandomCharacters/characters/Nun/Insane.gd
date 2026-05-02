extends CharacterState

func _frame_0():

	spawn_particle_relative(particle_scene)
	host.set_vel(fixed.mul("0", str(host.get_facing_int())), "0")
