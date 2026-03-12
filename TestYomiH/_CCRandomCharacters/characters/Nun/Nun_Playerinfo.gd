extends PlayerInfo

onready var pressure_bar = $"%TextureProgress"

onready var sanity = $"%Sanity"

onready var MAX = $"%Maximum"
onready var Intensity = $"%Intensity"
onready var Pressure_Label = $"%Label"


func set_fighter(fighter):
	.set_fighter(fighter)
	if player_id == 2:
#		$"%TextureProgress".fill_mode = TextureProgress.FILL_RIGHT_TO_LEFT
		$HBoxContainer.alignment = BoxContainer.ALIGN_END

func _process(delta):
	if is_instance_valid(fighter):
		pressure_bar.value = fighter.Pressure_Left / float(fighter.Pressure_Amount)
		pressure_bar.modulate.a = 0.25 if fighter.Pressure_Left <= fighter.Pressure_MinAmount else 1.0

		sanity.value = fighter.insanity / float(fighter.insanity_Amount)
		sanity.modulate.a = 0.25 if fighter.insanity <= fighter.insanity_MinAmount else 1.0

		MAX.show() if fighter.Pressure_Left >= 5 else MAX.hide()
		Intensity.show() if fighter.Pressure_Left >= 7 else Intensity.hide()  

		Pressure_Label.text = " Pressure " + str(pressure_bar.value)

		if fighter.Pressure_Left == fighter.Pressure_MinAmount:
			pressure_bar.texture_over = preload("res://_CCRandomCharacters/characters/Nun/Pressure Bar/Pressure Bar Calm.png")

		elif fighter.Pressure_Left > fighter.Pressure_MinAmount:
			pressure_bar.texture_over = preload("res://_CCRandomCharacters/characters/Nun/Pressure Bar/Pressure Bar.png")

		if pressure_bar.value == 1:
			Pressure_Label.text = " Pressure MAX "

		elif pressure_bar.value > 1:
			Pressure_Label.text = " Pressure OVERLOAD "
			pressure_bar.texture_over = preload("res://_CCRandomCharacters/characters/Nun/Pressure Bar/Pressure Bar OVERLOAD.png")
			pressure_bar.material = preload("res://_CCRandomCharacters/characters/Nun/Shader/Rainbow.material")

		if fighter.awakened == true:
			pressure_bar.allow_greater = true
		else:
			pressure_bar.allow_greater = false
