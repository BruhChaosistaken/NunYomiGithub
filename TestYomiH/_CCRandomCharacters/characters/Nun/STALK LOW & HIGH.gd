extends CharacterState

#Note to self: Give this more oomph

func _frame_0():
	
	host.create_speed_after_image_from_style(1)


func _frame_3():
	host.apply_force(fixed.mul("12", str(host.get_facing_int())),"0")

