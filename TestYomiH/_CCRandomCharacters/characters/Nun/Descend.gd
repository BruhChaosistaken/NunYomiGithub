extends CharacterState

const charge = preload("res://_CCRandomCharacters/characters/Nun/VFX/chargeeffexct.tscn")

export var DESCEND_SPEED = "1.0"

export var UC = 0.1

var alleviate = false

var falltime = 9

func _enter():
	if host.alleviate:

		alleviate = true
		print(alleviate)
		falltime = 13

func _frame_3():
	if host.is_grounded() and not alleviate:
		host.apply_force("0.5", "-7")
		host.set_vel(host.get_vel().x, "-14")

func _frame_5():
	if not alleviate:
		host.apply_force_relative( 2 * 2 , 0 )
		host.set_vel(host.get_vel().x, "-2")

func _frame_7():
	if alleviate:
		if host.opponent.hurtbox_pos_relative_float().x >= 55:
			host.apply_force_relative("10", "-7")
			host.set_vel(host.get_vel().x, "-14")
		else:
			host.apply_force_relative("3", "-7")
			host.set_vel(host.get_vel().x, "-14")
		
func _frame_9():
	if alleviate:
		host.play_sound("death2")
		host.spawn_particle_effect(charge,host.get_center_position_float())
		
		host.apply_force_relative( 2 * 2 , 0 )
		host.set_vel(host.get_vel().x, "-2")
		
func _tick():

	host.apply_forces_no_limit()
	host.create_speed_after_image_from_style(1)

	if current_tick >= falltime:

#		host.set_vel(fixed.mul(host.get_vel().x, "0"), DESCEND_SPEED)

		host.apply_force(0, 15)

	#if host.is_grounded() and current_tick >= 4:
	#	return "Landing"
	# why was this here?

	if host.is_grounded() and current_tick > 7 and host.alleviate:
		host.change_state("DescendCrash") 
		
	elif host.is_grounded() and current_tick > 7 and not host.alleviate:
		host.change_state("DescendDP")
		
#alright, sure, this varient works. I'll take it at this point. 
