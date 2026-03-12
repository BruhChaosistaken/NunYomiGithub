extends CharacterState

const WIND = preload("res://_CCRandomCharacters/characters/Nun/TransformWind.tscn")
const HEHEHAHA = preload("res://_CCRandomCharacters/characters/Nun/VFX/HelloVFX.tscn")

func _enter():
	host.grab_camera_focus()

	host.play_sound("Judgement chargeup")

func _frame_11():
	host.play_sound("Movement")

func _frame_29():
	host.play_sound("MaxStart")

func _frame_33():
	spawn_particle_relative(HEHEHAHA, Vector2(40 * host.get_facing_int(), -18))
	host.release_camera_focus()
	var obj = host.spawn_object(preload("res://_CCRandomCharacters/characters/Nun/Beam.tscn"), 90, -18)
	obj.sprite.set_material(host.sprite.get_material())
	obj.set_facing(host.get_facing_int())

func _tick():

#	if not host.is_ghost:
#		Global.current_game.time += 1
#
#	host.opponent.hitlag_ticks += 1
#
#	for objs in host.objs_map.values():
#		if is_instance_valid(objs):
#			if not (objs.is_in_group("Fighter")) and not objs == self:
#				if objs is BaseObj or BaseProjectile:
#						objs.hitlag_ticks += 1

	if current_tick < 30:
		interruptible_on_opponent_turn = true
	elif current_tick >= 30:
		interruptible_on_opponent_turn = false

	if current_tick % 10 == 0 and current_tick < 69:
		spawn_particle_relative(WIND)

func _exit():

	if host.opponent.hp <= 0:
			host.grab_camera_focus()
	else:
		host.release_camera_focus()
