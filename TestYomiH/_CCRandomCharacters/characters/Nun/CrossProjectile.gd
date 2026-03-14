extends BaseProjectile

var startup = 0

func on_got_blocked():
	.on_got_blocked()

	creator.Pressure_Left += 0.07 * creator.opponent.blocked_hitbox_plus_frames + 0.30


