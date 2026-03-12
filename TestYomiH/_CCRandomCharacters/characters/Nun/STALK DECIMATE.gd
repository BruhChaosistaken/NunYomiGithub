extends CharacterState

var x = 0
var y = 0



func _enter():
	host.create_speed_after_image_from_style(1)
	host.z_index = 2
	host.reset_momentum()
	host.opponent.reset_momentum()
	x = host.get_pos().x
	y = host.get_pos().y
	
func _tick():
	if current_tick % 2 == 0:
		host.create_speed_after_image_from_style(1)



	


