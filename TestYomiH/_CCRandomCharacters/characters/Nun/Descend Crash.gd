extends CharacterState

onready var Crash = get_node("Hitbox")

onready var SKULL = preload("res://_CCRandomCharacters/characters/Nun/SKULL.tscn")

func _enter():
	
	print(host.current_state().state_name)
	
	if _previous_state_name() == "Heavenly Descent":
		Crash.plus_frames = 2


		
		

	

func is_usable():
	return .is_usable() and host.current_state().state_name == "Descend Crash"

func on_got_blocked():
	if host.Pressure_Left > 5 and host.SUFFER_ACTIVE == 0:
		host.terrify_opponent(host.get_center_position_float())


