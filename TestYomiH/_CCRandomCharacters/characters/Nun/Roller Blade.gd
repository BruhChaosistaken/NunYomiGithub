extends CharacterState


var hit_move = false

func _frame_0():
	hit_move = false

func _frame_5():
	if host.initiative:
		host.start_invulnerability()

	if host.is_grounded():
		host.start_throw_invulnerability()

func _frame_6():
	host.end_invulnerability()

	host.end_throw_invulnerability()
func _tick():

	var player_pos = host.get_pos()
	var player_vel = host.get_vel()

	if hit_move == true and current_tick < 13 :
		host.opponent.set_pos(player_pos.x + 19 * host.get_facing_int(), player_pos.y)
		host.opponent.set_vel(player_vel.x, player_vel.y)

func _on_hit_something(opponent,hitbox):
	hit_move = true

func _exit():
	hit_move = false
