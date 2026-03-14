extends DefaultFireball

func _frame_0():
	print(host.position)

func fizzle():

	.fizzle()

	spawn_particle_relative(particle_scene)
