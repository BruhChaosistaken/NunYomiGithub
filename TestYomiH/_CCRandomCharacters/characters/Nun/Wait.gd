extends "res://characters/states/Idle.gd"

var idle_anim = 0;

#func _enter():
#	._enter()

#	if host.stance == "Judge":
#		host.current_state().anim_name = "Judge"

func _frame_0():

	if host.insane == true:
		host.current_state().anim_name = "insanity"

	else: host.current_state().anim_name = "Wait"

	if host.previous_state().state_name != "Wait":
		idle_anim = 0

func update_sprite_frame():
	.update_sprite_frame()
	host.sprite.frame = int(idle_anim/4)%32

func _tick():

	idle_anim += 1
