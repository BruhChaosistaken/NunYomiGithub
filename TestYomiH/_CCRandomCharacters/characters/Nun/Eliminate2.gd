extends ThrowState

const END = preload("res://_CCRandomCharacters/characters/Nun/VFX/SlashEliminateEnd.tscn")

func _tick():

	if current_tick % 6 == 0 and current_tick < 60 and host.damage_buff_stacks > 0:
		host.damage_buff_stacks += 1

	if current_tick % 6 == 0 and current_tick < 60: 
		host.spawn_particle_effect(particle_scene,host.opponent.get_center_position_float())
		host.play_sound("GRAHHH")

		host.visible_combo_count += 1

		host.opponent.take_damage(10)


func _exit():
	
	._exit()
	._release()

	host.spawn_particle_effect(END,host.opponent.get_center_position_float())
