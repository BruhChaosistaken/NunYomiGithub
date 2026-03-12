extends CharacterState

export var UC = 2.0

func _frame_0():


	host.start_projectile_invulnerability()

func _frame_6():
	host.end_projectile_invulnerability()

func _tick():

	apply_forces_no_limit = true

	if current_tick >= 4 and current_tick < 10 and current_tick % 2 == 0:
		host.spawn_particle_effect_relative(particle_scene, host.hurtbox_pos_relative_float(), Vector2.RIGHT * host.get_facing_int())

	if current_tick > 9:
		host.set_vel(fixed.div(str(host.get_vel().x), "2"), "0")
