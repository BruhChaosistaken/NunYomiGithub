extends SuperMove

onready var SKULL = preload("res://_CCRandomCharacters/characters/Nun/SKULL.tscn")

var STALK

var UC = 4.0

func _enter():

	if host.awakened == true:
		current_tick = 2
	
	STALK = data
	if STALK == true:
		fallback_state = "STALK"
		host.stance = "Stalk"

	else:
		fallback_state = "Wait"

func _tick():

	var My_Position = host.get_pos()

	if current_tick == 9:
		host.set_pos( My_Position.x + 150 * host.get_facing_int(), My_Position.y)

	host.colliding_with_opponent = false

func _frame_9():
	host.spawn_particle_effect_relative(particle_scene, host.hurtbox_pos_relative_float(), Vector2.RIGHT * host.get_facing_int())

func _frame_13():
	host.play_sound("shing")

func on_got_blocked():
	if host.Pressure_Left > 5 and host.SUFFER_ACTIVE == 0:
		host.terrify_opponent(host.get_center_position_float())


