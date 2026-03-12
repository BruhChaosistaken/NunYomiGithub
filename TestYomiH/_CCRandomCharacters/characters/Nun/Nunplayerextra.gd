extends PlayerExtra

onready var Detonate = $"%Explode"

onready var Alleviate = $"%Alleviate"

onready var Crucify = $"%Crucify"



func _ready():
	Detonate.connect("toggled", self, "_on_detonate_toggled")
	Alleviate.connect("toggled", self, "_on_alleviate_toggled")
	Crucify.connect("toggled", self, "_on_alleviate_toggled")
func _on_detonate_toggled(_on):
	emit_signal("data_changed")
func _on_alleviate_toggled(_on):
	emit_signal("data_changed")
func _on_crucify_toggled(_on):
	emit_signal("data_changed")
func show_options():
	Detonate.hide()
	Detonate.set_pressed_no_signal(false)
	
	Crucify.hide()
	Crucify.set_pressed_no_signal(false)

	#/// remove Alleviate.hide() to show upgrade toggle again.

	Alleviate.hide()
	Alleviate.set_pressed_no_signal(fighter.alleviate)

	if fighter.SSCROSSACTIVE:
		Detonate.show()
	if fighter.crucified:
		Crucify.show()
#	if fighter.awakened != false:
#		Alleviate.show()

func get_extra():
	var extra = {
		"explode":Detonate.pressed,
		"alleviate":Alleviate.pressed,
		"Crucify":Crucify.pressed, 
		 }
	return extra
	
func update_selected_move(move_state):
	.update_selected_move(move_state)

	if move_state is CharacterState:
		if move_state.name == "":
			pass

	if fighter.Pressure_Left <= 0:
		Alleviate.disabled = true
	else:
		Alleviate.disabled = false
	
	if move_state:
		if "UC" in move_state:
			print("UC dectected")
			Alleviate.show()
			if move_state.get("UC") > fighter.Pressure_Left:
				Alleviate.disabled = true
				Alleviate.pressed = false
		else:
			Alleviate.hide()
			Alleviate.disabled = true




func reset():

	Detonate.set_pressed_no_signal(false)
	Alleviate.set_pressed_no_signal(false)
	Crucify.set_pressed_no_signal(false)
