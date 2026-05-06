extends "res://characters/states/Dash.gd"

func _frame_4():
	if _previous_state_name() != "AirDashForward":
		if data:
			if data.get("x") == 100:
				host.Pressure_Left += 1
