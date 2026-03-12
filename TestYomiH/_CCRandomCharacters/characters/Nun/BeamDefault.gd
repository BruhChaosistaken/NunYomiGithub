extends DefaultFireball

onready var h = $Hitbox


onready var Beam = $Sprite

func _tick():
	var creator_pos = host.creator.get_pos()
	host.set_pos(str(creator_pos.x + 90 * host.get_facing_int()), str(creator_pos.y - 18))

	host.FrontBeam.set_material(host.creator.sprite.get_material())

	host.FrontBeam.frame = current_tick / 2

	if current_tick > lifetime:
		host.FrontBeam.hide()
		host.disable()
		terminate_hitboxes()

func _on_hit_something(opponent, hitbox):
	if host.creator.opponent.hp <= 0:
		host.creator.opponent.sprite.hide()
		h.victim_hitlag = 500
		host.creator.opponent.hitlag_ticks = 500
