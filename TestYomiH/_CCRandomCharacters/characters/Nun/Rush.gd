extends CharacterState

var hit = false

func _enter():
	hit = false
	if feinting:
		interrupt_into_string.append_array("Road of Gold Rush")

func _frame_2():
	if host.combo_count == 0:
		host.apply_force_relative(-12, 0)

#func _frame_5():
#	if not feinting:
#		host.start_invulnerability()

#func _frame_9():
#	host.end_invulnerability()

func _frame_6():
#	if host.risk >= 3:
#		host.has_hyper_armor = true
	host.reset_momentum()

func _tick():
	if current_tick >= 8 and current_tick <= 14 and host.risk < 3:
		host.apply_force_relative(75, 0)
	elif current_tick >= 8 and current_tick <= 14 and host.risk >= 3:
		host.apply_force_relative(90, 0)
	
	if hit and current_tick % 2 == 0:
		host.apply_fric()
	
	if current_tick > 18:
		host.apply_grav()

#func _frame_16():
#	host.has_hyper_armor = false
#
#func _exit():
#	host.has_hyper_armor = false

func is_usable():
	return .is_usable() and host.risk >= 2 and not host.twilight and not host.whitenight

func _on_hit_something(_obj, _hitbox):
	._on_hit_something(_obj, _hitbox)
	
	var vel = host.get_vel()
	
	host.set_vel(int(vel.x)/3, int(vel.y)/3)
	hit = true
