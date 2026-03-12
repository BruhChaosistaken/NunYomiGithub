extends DefaultFireball

func _frame_0():
	$"%Deez".stop_emitting()
	var pos1 = host.get_pos().x

	var pos2 = host.get_pos().y

	host.spawn_particle_effect(preload("res://_CCRandomCharacters/characters/Nun/VFX/SlashEliminateEnd.tscn"), Vector2(pos1, pos2))

func _tick():

	if not host.creator.current_state().name == "SSWalk":
		host.damages_own_team = true

	if current_tick > lifetime:
		host.disable()
		terminate_hitboxes()


func _on_hit_something(obj, hitbox):
	if obj and obj.is_in_group("Fighter"):
		host.get_fighter().gain_free_cancel()
	._on_hit_something(obj, hitbox)

	host.creator.state_interruptable = true
