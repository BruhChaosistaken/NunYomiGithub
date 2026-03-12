extends SuperMove

func _tick():

	var opp_pos = host.opponent.get_pos()
	var opp_speed = host.opponent.get_vel()

	if current_tick == 6:

		host.set_pos( opp_pos.x + 40 * host.get_facing_int(), 0 )
		host.set_vel( opp_speed.x, "0" )
