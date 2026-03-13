extends DefaultFireball

onready var h = $Hitbox

func _tick():
	var creator_pos = host.creator.get_pos()
	host.set_pos(str(creator_pos.x + 90 * host.get_facing_int()), str(creator_pos.y - 18))
	if current_tick > lifetime:
		host.disable()
		terminate_hitboxes()

func _on_hit_something(opponent, hitbox):
	if host.creator.opponent.hp <= 0:
		host.creator.opponent.sprite.hide()
		h.victim_hitlag = 500
		host.creator.opponent.hitlag_ticks = 500
