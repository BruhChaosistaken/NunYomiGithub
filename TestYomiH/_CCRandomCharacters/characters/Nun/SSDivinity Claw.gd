extends CharacterState

const WIND = preload("res://_CCRandomCharacters/characters/Nun/TransformWind.tscn")

func _frame_9():
	$"%Charge".start_emitting()

func _frame_31():
	$"%Charge".stop_emitting()

func _tick():

	if not host.is_ghost and current_tick < 20:
		Global.current_game.time += 1

	if current_tick < 20:
		host.opponent.hitlag_ticks += 1

		for objs in host.objs_map.values():
			if is_instance_valid(objs):
				if not (objs.is_in_group("Fighter")) and not objs == self:
					if objs is BaseObj or BaseProjectile:
							objs.hitlag_ticks += 1

	if current_tick % 10 == 0 and current_tick < 35:
		spawn_particle_relative(WIND)
