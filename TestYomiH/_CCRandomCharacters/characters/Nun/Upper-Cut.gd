extends CharacterState

var hit = false

export var UC: float = 6
func _enter():
	if host.initiative:
		current_tick = 3

	hit = false

