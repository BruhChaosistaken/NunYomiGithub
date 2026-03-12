extends CharacterState

const WIND = preload("res://_CCRandomCharacters/characters/Nun/TransformWind.tscn")

export var start_music = false

onready var main = get_tree().get_root().get_node("Main")
onready var m_b = main.get_node("UILayer/OptionsContainer/VBoxContainer/Contents/VBoxContainer/VBoxContainer/MusicButton")


func _enter():
	host.grab_camera_focus()

	host.play_sound("Judgement chargeup")
	host.Judgement = true

func _tick():

	if not host.is_ghost:
		Global.current_game.time += 1

	host.opponent.hitlag_ticks += 1

	for objs in host.objs_map.values():
		if is_instance_valid(objs):
			if not (objs.is_in_group("Fighter")) and not objs == self:
				if objs is BaseObj or BaseProjectile:
						objs.hitlag_ticks += 1

	if current_tick % 10 == 0 and current_tick < 69:
		spawn_particle_relative(WIND)

func _frame_9():
	#//sword swish

	host.play_sound("Sword swish")

func _frame_33():
	#//electricity sound

	host.play_sound("Electricity2")


func _frame_45():
	#//Elec

	host.play_sound("Electricity3")

func _frame_53():
	#//Elec

	host.play_sound("Electricity")

func _frame_61():
	#//Elec

	host.play_sound("Electricity2")

func _frame_69():
	#//Scythe appears

	host.play_sound("Scythe Appears")
	host.play_sound("AwakSpice1")

	host.play_sound("Scythe Appears2")

	spawn_particle_relative(particle_scene)

	if not host.is_ghost and start_music == true:
		Global.play_song("Awakened")

		m_b.pressed = false
		m_b.disabled = false

	if not host.is_ghost:
		$"%BG".show()

func _frame_77():
	#//Holds Scythe

	host.play_sound("Sycthe Grab")

func _frame_97():
	#//Scythe spin

	host.play_sound("Scythe Spin")

func _frame_105():
	#//Scythe Spn

	host.play_sound("Scythe Spin")

func _frame_113():
	#//Scythe gets in place

	host.play_sound("Scythe Ready")

#func is_usable():
#	return .is_usable() and host.awakened != false and host.Pressure_Left >= 5

func _exit():
	host.release_camera_focus()

#func is_usable():
#	return .is_usable() and host.Corruption_ticks <= 0 and host.awakened == true and host.TS_Cooldown <= 0

