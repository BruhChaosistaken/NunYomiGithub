extends DefaultFireball

func _tick():
	$"%Deez".start_emitting()

	if current_tick >= lifetime:
		host.detonate()
