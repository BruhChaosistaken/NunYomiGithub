extends CharacterState

var hit = false

export var UC: float = 2.0

func _enter():
	if host.initiative:
		current_tick = 3

	hit = false

