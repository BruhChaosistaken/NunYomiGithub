extends CharacterState

const EXTRA_FRAME_PER_PIXEL = "0.05"
const MIN_LAG_DIST = "200"
const max_lag_frames = 8

var lag_frames = 0



func _enter():
	
	host.create_speed_after_image_from_style(1)
	
func _frame_0():
	lag_frames = 0

func _frame_3():
	var opp_pos_local = host.obj_local_center(host.opponent)
	var distance = fixed.vec_len(str(opp_pos_local.x), str(opp_pos_local.y))
	if fixed.gt(distance, MIN_LAG_DIST):
		print("procced")
		lag_frames = Utils.int_min(fixed.round(fixed.mul(EXTRA_FRAME_PER_PIXEL, fixed.sub(distance, MIN_LAG_DIST))), max_lag_frames)

func _tick():

	if current_tick >= 4 and current_tick <= 11:
		host.set_pos(host.opponent.get_pos().x, host.opponent.get_pos().y-70)
		host.set_vel(host.opponent.get_vel().x, "0")
	if current_tick >= 8:
		if lag_frames > 0:
			lag_frames -= 1
			current_tick = 8
