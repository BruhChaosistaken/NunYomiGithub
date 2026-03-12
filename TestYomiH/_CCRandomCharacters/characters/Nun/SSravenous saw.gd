extends CharacterState

var hit_move = false

func _frame_0():
	hit_move = false

func _tick():

	var force = xy_to_dir(data.x * 6 , 0 , "55")

	if current_tick >= 5 and current_tick < 25 :
		host.set_vel(fixed.mul(str(force.x), str(host.get_facing_int())), "0")

	elif current_tick == 25:
		host.set_vel(fixed.mul("1", str(host.get_facing_int())), "0")

	var player_pos = host.get_pos()
	var player_vel = host.get_vel()

	if hit_move == true and current_tick < 25 :
		host.opponent.set_pos(player_pos.x + 40 * host.get_facing_int(), player_pos.y)
		host.opponent.set_vel(player_vel.x, player_vel.y)
		host.colliding_with_opponent = false

func _on_hit_something(opponent,hitbox):
	hit_move = true

func _exit():
	hit_move = false
