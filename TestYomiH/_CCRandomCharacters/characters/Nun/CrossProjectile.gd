extends BaseProjectile

var startup = 0

func tick():
	.tick()
	
	
	startup += 1
	
	var di_x = self.creator.current_di.x
	var di_y = self.creator.current_di.y

	for objs in objs_map.values():
		if is_instance_valid(objs):
			if objs.is_in_group("Fighter"):
				var overlaps = hurtbox.overlaps(objs.hurtbox)
				if overlaps and startup >= 10:
					play_sound("Woosh")
					#placeholder for now
					spawn_particle_effect_relative(preload("res://_CCRandomCharacters/characters/Nun/VFX/BluntLight.tscn"), Vector2(0,0))
					if objs == self.creator:
						objs.apply_force(int(di_x) / 10, int(di_y) / 10)
					elif objs == self.creator.opponent and self.creator.opponent.combo_count == 0:
						objs.apply_force(int(di_x) / 20, int(di_y) / 20)
#					creator.bless_count -= 1
					disable()
