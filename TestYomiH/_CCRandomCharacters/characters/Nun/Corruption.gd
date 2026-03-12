extends CharacterState

export var di_amount = "1.0"

func _frame_3():

	var di_force = xy_to_dir(host.current_di.x * host.get_facing_int(), host.get_vel().y, di_amount)

	host.apply_force_relative(di_force.x, di_force.y)

func _tick():
	if current_tick % 10 == 0 and current_tick < 21:
		host.play_sound("Timestop Charge")

func _frame_21():
	host.Corruption_ticks += 150
	host.TS_Cooldown += 500


	host.play_sound("Timestop Bass")

	host.global_hitlag(host.hitlag_ticks)
	host.hitlag_ticks = 10

	host.set_vel("0","0")

func is_usable():
	return .is_usable() and host.Corruption_ticks <= 0 and host.awakened == true and host.TS_Cooldown <= 0

