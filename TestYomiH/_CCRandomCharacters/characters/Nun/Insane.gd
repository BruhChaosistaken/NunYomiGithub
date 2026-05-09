extends CharacterState

var debounce = false

func _frame_0():

	host.CodexIncrementAchievement("Insanity_Total","insanity_ach")
	host.set_vel(fixed.mul("0", str(host.get_facing_int())), "0")

func _tick():
	if host.opponent.hp <= 0 and debounce == false:
		host.CodexUnlockAchievement("insanitydeath_ach")
		debounce = true
