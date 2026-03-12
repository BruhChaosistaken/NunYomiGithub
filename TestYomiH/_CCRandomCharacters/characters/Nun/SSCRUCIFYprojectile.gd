extends BaseProjectile



var detonating = false
var attached = false

func explode():
	detonating = true
	creator.crucified = false
	creator.crucify_proj = null

func big_explode():
	change_state("BigExplode")
	creator.crucified = false
	creator.crucify_proj = null


func on_got_blocked():
	.on_got_blocked()

	creator.state_interruptable = true
	creator.Pressure_Left += 0.07 * creator.opponent.blocked_hitbox_plus_frames + 0.30

