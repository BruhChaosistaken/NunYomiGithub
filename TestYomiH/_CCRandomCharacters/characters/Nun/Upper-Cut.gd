extends CharacterState

var hit = false

export var UC = 2.0

func _enter():
	if host.initiative:
		current_tick = 3

	hit = false

