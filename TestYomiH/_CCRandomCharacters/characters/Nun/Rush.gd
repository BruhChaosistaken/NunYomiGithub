extends CharacterState

var HitRush = false

const nudgeamount = "0.1"

func _tick():

	var pos = host.get_pos()
	var vel = host.get_vel()

	var enemypos = host.opponent.get_pos()
	var enemyvel = host.opponent.get_vel()

	var nudgeposx = fixed.round(fixed.lerp_string(str(pos.x),str(enemypos.x), nudgeamount))
	var nudgevelx = fixed.round(fixed.lerp_string(str(vel.x), str(enemyvel.x), nudgeamount))

	var nudgeposy = fixed.round(fixed.lerp_string(str(pos.y),str(enemypos.y), nudgeamount))
	var nudgevely = fixed.round(fixed.lerp_string(str(vel.y), str(enemyvel.y), nudgeamount))

	if current_tick in [3, 8, 13]:
		host.apply_force_relative("9", "0")

	if HitRush and current_tick < 10:
		host.opponent.set_pos(nudgeposx + 40 * host.get_facing_int(), nudgeposy)
		host.opponent.set_vel(nudgevelx, nudgevely)

func _enter():

	HitRush = false

	if host.alleviate and host.is_grounded():
		host.pressure_left -= 2
		host.change_state("Pressurerush")
		return "Pressurerush"

func _on_hit_something(obj, hitbox):
	._on_hit_something(obj, hitbox)
	if obj.is_in_group("Fighter"):
		HitRush = true

func on_got_blocked():
	HitRush = true
