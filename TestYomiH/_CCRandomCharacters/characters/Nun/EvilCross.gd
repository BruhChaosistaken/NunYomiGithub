extends BaseProjectile

var startup = 0

func tick():
	.tick()
	
	
	startup += 1
	
	var di_x = self.creator.current_di.x
	var di_y = self.creator.current_di.y

	for objs in objs_map.values():
		if is_instance_valid(objs):

			if objs.is_in_group("Fighter") and objs == self.creator:
				var overlaps = hurtbox.overlaps(objs.hurtbox)
				if overlaps and startup >= 10 and not di_y == 0 or overlaps and startup >= 10 and not di_x == 0:
					play_sound("Woosh")
					#placeholder for now
					spawn_particle_effect_relative(preload("res://_CCRandomCharacters/characters/Nun/VFX/BluntLight.tscn"), Vector2(0,0))
					if objs == self.creator:
						objs.apply_force(int(di_x) / 10, int(di_y) / 10)
						creator.Pressure_Left += 2.5
						disable()
			elif objs.is_in_group("Skull"):
				print("sees skull")
				var overlaps = hurtbox.overlaps(objs.hurtbox)
				if overlaps and startup >= 10:
					print("overlaps")
					play_sound("Woosh")
					#placeholder for now
					spawn_particle_effect_relative(preload("res://_CCRandomCharacters/characters/Nun/VFX/BluntLight.tscn"), Vector2(0,0))
					objs.apply_force(int(di_x) / 10, int(di_y) / 10)
					disable()
