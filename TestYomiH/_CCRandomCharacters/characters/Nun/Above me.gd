extends CharacterState

func _tick():

	if current_tick >= 3 && not host.opponent.is_grounded():
		host.start_invulnerability()

	if current_tick == 5:
		host.end_invulnerability()
