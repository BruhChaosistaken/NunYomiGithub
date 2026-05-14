extends CharacterState

var hit = false

export var UC: float = 6
func _enter():
	if host.initiative:
		current_tick = 3

	if host.alleviate and current_tick < 8:
		host.start_invulnerability()
	elif host.alleviate and current_tick > 8:
		host.end_invulnerability()

