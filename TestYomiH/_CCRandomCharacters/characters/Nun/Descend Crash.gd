extends CharacterState

onready var Crash = get_node("Hitbox")

func _enter():
	
	print(host.current_state().state_name)
	
	if _previous_state_name() == "Heavenly Descent":
		Crash.plus_frames = 2
	else:
		Crash.plus_frames = 0

func is_usable():
	return .is_usable() and host.current_state().state_name == "Descend Crash"
