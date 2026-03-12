extends CharacterState

var idle_anim = 0;

func _enter():
	if host.previous_state().state_name != "SSWalk":
		idle_anim = 0

func update_sprite_frame():
	.update_sprite_frame()
	host.sprite.frame = int(idle_anim/5)%5

func _tick():
	host.set_vel(fixed.mul("2", str(host.get_facing_int())), "0")

	host.Pressure_Left += 0.01

	idle_anim += 1
