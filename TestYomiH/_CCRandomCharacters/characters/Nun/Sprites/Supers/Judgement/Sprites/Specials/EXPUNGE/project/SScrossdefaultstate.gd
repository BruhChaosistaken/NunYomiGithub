extends DefaultFireball

func tick():
	$"%Deez".start_emitting()

	if current_tick > 120:
		host.change_state("explode")

func _on_hit_something(obj, hitbox):
	if obj and obj.is_in_group("Fighter"):
		host.get_fighter().gain_free_cancel()
	._on_hit_something(obj, hitbox)

	host.creator.state_interruptable = true
