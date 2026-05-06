extends ThrowState

var x = 0
var y = 0

var Overflow_Loop = 0

func _enter():

	Overflow_Loop = 0

	host.grab_camera_focus()
	host.z_index = 2
	host.opponent.reset_momentum()
	x = host.get_pos().x
	y = host.get_pos().y

func _tick():

	if host.Pressure_Left > 5 and current_tick == 60 or host.opponent.hp <= 0 and current_tick == 60 or host.awakened == true and Overflow_Loop <= 3 and current_tick == 60:

		if host.awakened == true:
			Overflow_Loop += 1

		host.play_sound("DeathImminent")
		host.play_sound("death2")
		host.change_state("STALK DECIMATE 2")
		host.spawn_particle_effect(particle_scene,host.get_center_position_float())

		if host.awakened == false:
			host.Pressure_Left -= clamp( 1 , 0, round(host.Pressure_Left - (host.Pressure_Amount/2.5)) )
			$"%STOP".modulate.a += 0.1
			host.create_speed_after_image_from_style(1)


	if host.current_state().name == "STALK DECIMATE 2" and current_tick < 72:
		host.opponent.current_state().anim_name = "Knockdown"

	host.colliding_with_opponent = false

	var pos = host.get_global_throw_pos()
	host.opponent.set_pos(pos.x + 10 * host.get_facing_int(), pos.y)

	host.opponent.z_index = - 2

	if _previous_state().name == "STALK DECIMATE 2" and current_tick <= 5:
		host.sprite.frame = 10

	if current_tick >= 72:
		host.opponent.current_state().anim_name = "Grabbed"

func Spawn_CrucifyProj(pos_x: int, pos_y: int, crucified: bool, attached: bool):
		var obj = host.spawn_object(preload("res://_CCRandomCharacters/characters/Nun/SSCRUCIFYprojectile2.tscn"), pos_x, pos_y)
		host.crucified = crucified
		host.crucify_proj = obj.obj_name
		obj.attached = attached


func _exit():

	if _previous_state().name != "STALK DECIMATE 2":
		Spawn_CrucifyProj(0, -16, true, true)
	if host.awakened == true and Overflow_Loop == 3:
		Spawn_CrucifyProj(0, -16, true, true)

		Overflow_Loop = 0

	host.release_camera_focus()
	if _previous_state().name == "STALK DECIMATE 2" and current_tick > 60:
		$"%STOP".modulate.a = 0

