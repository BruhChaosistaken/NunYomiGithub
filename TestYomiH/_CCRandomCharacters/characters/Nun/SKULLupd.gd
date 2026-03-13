extends BaseProjectile

class_name Skull


func _ready():
	add_to_group("Skull")
	
	

func on_got_blocked():
	.on_got_blocked()

	creator.Pressure_Left += 0.07 * creator.opponent.blocked_hitbox_plus_frames + 0.30

func hit_by(hitbox):
	.hit_by(hitbox)
	var host = obj_from_name(hitbox.host)
	if host:
		if not host.is_in_group("Opponent"):
			print("is player")
			
		if host.is_in_group("Fighter"):
			disable()



func tick():
	.tick()

	
	if current_tick == 1:
		creator.SKULL = obj_name
