extends "res://characters/states/Taunt.gd"

func _enter():
	if host.opponent.blocked_hitbox_plus_frames != 0:
		host.opponent.blockstun_ticks =+ 19

func _frame_5():
	host.play_sound("Swoosh")

	pass

func _frame_9():
	host.play_sound("Swoosh")

	pass

func _frame_19():
	#play_sound() - point

	if host.Pressure_Left > host.Pressure_MinAmount:
		host.Pressure_Left -= clamp(0.5, 0, host.Pressure_Amount - host.Pressure_MinAmount) 

	#host.spawn_particle_effect(particle_scene, host.get_pos_visual() + Vector2(18 * host.get_facing_int(), -29))

	pass

func _frame_30():
	host.play_sound("Movement")

	pass

func _on_hit_something(obj,hitbox):
	._on_hit_something(obj, hitbox)
	host.spawn_particle_effect(particle_scene,host.opponent.get_center_position_float())

#func on_got_blocked():
#	if host.Pressure_Left > 5 and host.SUFFER_ACTIVE == 0:
#		host.terrify_opponent()
