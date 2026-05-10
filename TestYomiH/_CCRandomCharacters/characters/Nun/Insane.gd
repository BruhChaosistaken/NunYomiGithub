extends CharacterState

var debounce = false

func _frame_0():

	if not ( Global.current_game.spectating or Global.current_game.singleplayer ):
		host.CodexIncrementAchievement("Insanity_Total","insanity_ach")

	host.set_vel(fixed.mul("0", str(host.get_facing_int())), "0")

func _tick():
	if debounce == false:
		if host.opponent.hp <= 0 and not ( Global.current_game.spectating or Global.current_game.singleplayer ):
			host.CodexUnlockAchievement("insanitydeath_ach")
			debounce = true
