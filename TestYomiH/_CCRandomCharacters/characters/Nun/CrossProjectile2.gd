extends BaseProjectile

func on_got_blocked():
	.on_got_blocked()

	creator.Pressure_Left += 0.07 * creator.opponent.blocked_hitbox_plus_frames + 0.30

func tick():
	.tick()

	
	if current_tick == 1:
		creator.SKULL2 = obj_name
