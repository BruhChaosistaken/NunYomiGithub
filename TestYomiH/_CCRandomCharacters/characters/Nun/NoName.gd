extends CharacterState

func _enter():
	host.Pressure_Left += 2

	if host.Pressure_Left >= 5:
		host.CodexUnlockAchievement("test_cheivo")
