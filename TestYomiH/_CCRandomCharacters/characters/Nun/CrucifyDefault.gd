extends DefaultFireball


const ATTACH_DISTANCE = "16"

const Spawn_Particle = preload("res://_CCRandomCharacters/characters/Nun/VFX/Afterimage.tscn")


var attach_frames = 0
var explode_ticks = 10

func _frame_0():
	attach_frames = 0
	host.play_sound("Spawn")

	host.spawn_particle_effect(Spawn_Particle,host.creator.opponent.get_center_position_float())

func _tick():
	if host.attached:
		host.set_facing(host.creator.opponent.get_facing_int())
		var pos = host.creator.opponent.get_hurtbox_center()
		host.set_pos(pos.x, pos.y)
	else:
		host.update_grounded()
		var pos = host.get_pos()
		var opp_pos = host.creator.opponent.get_hurtbox_center()
		var opp: Fighter = host.creator.opponent
		if fixed.lt(fixed.vec_dist(str(pos.x), str(pos.y), str(opp_pos.x), str(opp_pos.y)), ATTACH_DISTANCE):
			attach_frames += 1
		else:
			attach_frames = 0
		if attach_frames > 2:
			if not opp.invulnerable and not opp.projectile_invulnerable:
				host.attached = true
	if current_tick > 120:
		host.change_state("BigExplode")
	elif host.detonating:
		explode_ticks -= 1
		if explode_ticks == 0:
			host.change_state("Explode") 
			host.creator.crucified = false
			host.creator.crucify_proj = null



