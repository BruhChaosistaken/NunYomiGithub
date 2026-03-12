extends CharacterState

export var FORWARD_SPEED = "1.0"

export var DESCEND_SPEED = "1.0"

var drag = false

func _enter():

	drag = false

	host.set_vel(fixed.mul( str(data.x + 1) ,str(host.get_facing_int())), "-7")

func _frame_4():

	host.set_vel(str(float(host.get_vel().x) / 2), "0")
	host.start_invulnerability()


func _tick():

	host.apply_forces_no_limit()
	host.create_speed_after_image_from_style(1)

	if current_tick >= 8:

		host.set_vel(fixed.mul(FORWARD_SPEED, str(host.get_facing_int())), DESCEND_SPEED)
		host.colliding_with_opponent = false

	if current_tick >= 8 && drag == true:
		host.opponent.set_vel(host.get_vel().x, host.get_vel().y)
		host.opponent.set_pos(host.get_pos().x, host.get_pos().y)

	if host.is_grounded() and current_tick <= 2:
		return "Landing"

	if host.is_grounded() and current_tick > 2:
		host.change_state("DescendCrash")

func _on_hit_something(opponent, hitbox):
	._on_hit_something(opponent, hitbox)

	drag = true

func _exit():
	host.end_invulnerability()
