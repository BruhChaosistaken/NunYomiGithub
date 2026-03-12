extends CharacterState

export var start_music = true

export var di_amount = "1.0"

onready var main = get_tree().get_root().get_node("Main")
onready var m_b = main.get_node("UILayer/OptionsContainer/VBoxContainer/Contents/VBoxContainer/VBoxContainer/MusicButton")

var STALK



func _enter():

	var di_force = xy_to_dir(host.current_di.x * host.get_facing_int(), host.current_di.y, di_amount)

	host.apply_force_relative(di_force.x, "0")

	STALK = data
	if STALK == true:
		fallback_state = "STALK"
		host.stance = "Stalk"

	else:
		fallback_state = "Wait"

func _frame_0():
	

	host.play_sound("AwakSpice1")



# on frame 20, arbitrary number
func _frame_13():
	# add 3 stacks
	host.damage_buff_stacks += INF

	host.play_sound("AwakSpice2")

	

	if host.hp < 900:
		host.hp += 100

	if not host.is_ghost and start_music == true:
		Global.play_song("Awakened")

		m_b.pressed = true
		m_b.disabled = false

	
func _exit():
	host.release_camera_focus()
	host.awakened = true
	host.awakentimer += 100
func is_usable():
	return .is_usable() and host.damage_buff_stacks >= 0 and host.awakened == false


