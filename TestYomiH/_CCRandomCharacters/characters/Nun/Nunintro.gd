extends "res://characters/states/Idle.gd"

var game_time = 3600
var state_variables = {}

func _enter():

	game_time = Global.current_game.time

func _frame_24():
	if anim_name == "MAX INTRO":

		host.play_sound("MaxSpice 2")
		host.play_sound("MaxSpice 1")
		host.play_sound("MaxRoar")

		host.screen_bump(Vector2(), 20, 20 / 60.0)

		print("hello")
		host.spawn_particle_effect_relative(particle_scene, Vector2(0,-18))
		host.awakened = true
		if host.supers_available < 1 or not host.infinite_resources:
			host.supers_available = 1
			host.Pressure_Left = 5

func _frame_79():
	if anim_name == "MAX INTRO":
		host.play_sound("Movement")

func _frame_0():

	for v in host.opponent.state_variables:
		state_variables[v] = host.opponent.get(v)
#	Global.play_song("bg1")

	if host.opponent.stance != "Intro" and host.getOpponentName() in host.Names or host.opponent.stance == "Intro" and host.opponent.get("charname") in host.Names or host.opponent.get("char_name") in host.Names:
		anim_name = "MAX INTRO"
	if host.opponent.stance != "Intro" and host.specialman == true and not host.getOpponentName() in host.Names:
		anim_name = "intro2"
		sprite_anim_length = 64
		ticks_per_frame = 2
		
	if  host.specialman == true:
		host.Halo.visible = true

func _tick():
	host.penalty = 0
	host.opponent.penalty = 0

	var game = Global.current_game
	if(game.time-game.current_tick<game_time):
		game.time+=1
	if host.opponent.stance != "Intro" and current_tick < anim_length-1:

		for v in state_variables.keys():
			host.opponent.set(v,state_variables[v])
		host.opponent.hitlag_ticks = 1
		host.opponent.state_interruptable = false
	if current_tick == anim_length-1:

		host.opponent.hitlag_ticks = 0
		host.opponent.state_interruptable = true
		host.state_interruptable = true
		host.stance = "Normal"
		return "Wait"

	if anim_name != "intro2":
		 anim_length = 120
	else:
		anim_length = 120
	
		
	if current_tick == 1 and anim_name == "MAX INTRO":
		host.play_sound("MaxStart")
		host.play_sound("MaxStart2")

	if current_tick < 24 and anim_name == "MAX INTRO":
		host.Pressure_Left += 0.166666
