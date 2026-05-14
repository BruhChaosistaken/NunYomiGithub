extends CharacterState

onready var hitbox = $Hitbox

onready var SKULL = preload("res://_CCRandomCharacters/characters/Nun/SKULL.tscn")

func _enter():
	host.Claw.show()
	host.Claw.frame = 0

	hitbox.chip_damage_modifier =  str(host.Pressure_Left + 2)

func _tick():
	host.Claw.frame = current_tick / ticks_per_frame

	if current_tick == 13:
		host.set_vel(fixed.mul("1", str(host.get_facing_int())), "0")

func _exit():
	host.Claw.hide()
