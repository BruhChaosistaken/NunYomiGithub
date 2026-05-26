extends CharacterState

onready var hitbox = $Hitbox

func _enter():
#	if data.x == 3:
#		beats_backdash = true

	if host.combo_count > 0:
		hitbox.grounded_hit_state = "HurtAerial"
		hitbox.knockdown = true
		hitbox.cancellable = false
		hitbox.knockback = 4
	else:
		hitbox.grounded_hit_state = "HurtGrounded"
		hitbox.knockdown = false
		hitbox.cancellable = true
		hitbox.knockback = 4

func _tick():

	if current_tick % 2 == 0:
		host.create_speed_after_image_from_style(1)

	if current_tick in [4,8,12]:
		spawn_particle_relative(preload("res://_CCRandomCharacters/characters/Nun/VFX/chargeeffexct.tscn"))

#	if current_tick < 13 and data.x == 1 or current_tick < 13 and data.x == 2:
#		host.set_vel(fixed.mul("10", str(host.get_facing_int())), "0")

	#elif current_tick < 13:
			#host.set_vel(fixed.mul("15", str(host.get_facing_int())), "0")
	
	#elif current_tick == 13:
		#host.set_vel(fixed.mul("1", str(host.get_facing_int())), "0")
#		host.colliding_with_opponent = true

	if current_tick >= 3 and current_tick < 11:
		host.start_projectile_invulnerability()


#	if data.x == 1 and current_tick == 6:
#		current_tick = 11
#		hitbox.plus_frames = 1
#
#	elif data.x == 2 and current_tick == 8:
#		current_tick = 11
#		hitbox.plus_frames = 2

	else:
		pass
