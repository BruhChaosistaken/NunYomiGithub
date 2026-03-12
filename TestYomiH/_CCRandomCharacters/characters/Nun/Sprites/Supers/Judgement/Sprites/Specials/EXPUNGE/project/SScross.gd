extends BaseProjectile

var detonating = false



func on_got_blocked():
	.on_got_blocked()

	creator.Pressure_Left += 0.07 * creator.opponent.blocked_hitbox_plus_frames + 0.30
	creator.state_interruptable = true

	if current_state().name == "explode":
		disable()


func detonate():
	detonating = true
	.change_state("explode")
	creator.SSCROSSACTIVE = false
	creator.SSCROSS = null

func fizzle():
	.fizzle()

	creator.SSCROSSACTIVE = false

func tick():
	.tick()

	
	if current_tick == 1:
		creator.SSCROSSACTIVE = true
		creator.SSCROSS = obj_name

func hit_by(hitbox):
	.hit_by(hitbox)

	detonate()
