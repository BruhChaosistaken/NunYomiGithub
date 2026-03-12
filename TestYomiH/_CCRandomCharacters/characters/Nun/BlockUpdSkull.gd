extends "res://projectile/DirProjectileDefault.gd"

func _frame_0():

	host.creator.SUFFER_ACTIVE += 1

func fizzle():

	.fizzle()

	host.creator.SUFFER_ACTIVE -= 1
	spawn_particle_relative(particle_scene)


