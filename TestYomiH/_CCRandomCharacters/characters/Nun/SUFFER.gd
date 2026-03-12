extends CharacterState

const SPEED = "10.5"


func _frame_11():
	var local_pos = host.hurtbox_pos_relative_float()

	var dir = host.fixed.normalized_vec(str(0), str(0))
	var obj = host.spawn_object(load("res://_CCRandomCharacters/characters/Nun/SKULL.tscn"), local_pos.x, local_pos.y-32, true, {"dir": dir})
	
	host.spawn_particle_effect_relative(particle_scene, host.hurtbox_pos_relative_float(), Vector2.RIGHT * host.get_facing_int())

	var force = xy_to_dir(data.x, data.y, SPEED)
	obj.set_grounded(false)
	obj.apply_force(force.x, force.y)
	
	
	host.Pressure_Left += 2.5



func is_usable():
	return .is_usable() and host.SUFFER_ACTIVE <= 0
