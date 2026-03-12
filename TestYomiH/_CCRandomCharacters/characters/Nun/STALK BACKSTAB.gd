extends CharacterState

onready var SKULL = preload("res://_CCRandomCharacters/characters/Nun/SKULL.tscn")
onready var h = $Hitbox

var STALK

func _enter():


	STALK = data
	if STALK == true:
		fallback_state = "STALK"
		host.stance = "Stalk"

	else:
		fallback_state = "Wait"

func _frame_0():
	host.create_speed_after_image_from_style(1)

func _tick():

	var opp_pos = host.opponent.get_pos()
	var opp_speed = host.opponent.get_vel()

	host.colliding_with_opponent = false

	if current_tick < 5:
		host.set_vel(fixed.mul("2", str(host.get_facing_int())), "0")

	if current_tick > 5:

		host.set_pos( opp_pos.x - 40 * host.get_facing_int(), 0 )

	if current_tick >= 9 and current_tick < 12:
		host.set_vel(host.opponent.get_vel().x, "0")

func on_got_blocked():
	if host.Pressure_Left > 5 and host.SUFFER_ACTIVE == 0:
		host.terrify_opponent()
