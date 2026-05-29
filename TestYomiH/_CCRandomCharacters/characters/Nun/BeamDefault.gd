extends DefaultFireball

onready var h = $Hitbox

func _frame_0():
	._frame_0()
	host.FrontBeam.frame = host.sprite.frame

func _tick():
	var creator_pos = host.creator.get_pos()
	host.set_pos(str(creator_pos.x + 90 * host.get_facing_int()), str(creator_pos.y - 18))
	if current_tick > lifetime:
		host.FrontBeam.hide()
		host.disable()
		terminate_hitboxes()

	host.FrontBeam.set_material(host.creator.sprite.get_material())

	host.FrontBeam.frame = current_tick / 2

func _on_hit_something(opponent, hitbox):
	._on_hit_something(opponent, hitbox)
	if host.creator.Pressure_Left >= 5.0:
		host.creator.Pressure_Left -= abs(clamp(0.5, 0,  host.creator.Pressure_Left - host.creator.Pressure_Amount / 2 ))

	if host.creator.opponent.hp <= 0:
		host.creator.opponent.sprite.hide()
		h.victim_hitlag = 500
		host.creator.opponent.hitlag_ticks = 500
		host.creator.CodexUnlockAchievement("SinRelease_ach", true)
