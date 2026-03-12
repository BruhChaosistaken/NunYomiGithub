extends CharacterState

var attack = 0

var TOMB = preload("res://_CCRandomCharacters/characters/Nun/SSEXPUNGECROSS.tscn")
var CRUCIFY = preload("res://_CCRandomCharacters/characters/Nun/SSCRUCIFYprojectile.tscn")

func _enter():
	host.Pressure_Left += 2.5

func _frame_11():

	host.play_sound("FloorStab")


	#	print("die")
		#var obj = host.spawn_object(CRUCIFY, data.Position.x * host.get_facing_int() * 3, data.Position.y - 17)
		#obj.sprite.set_material(host.sprite.get_material())


	print("dick")
	var obj = host.spawn_object(TOMB, data.Distance.x, -17)
	obj.sprite.set_material(host.sprite.get_material())

func is_usable():
	return .is_usable() and host.SSCROSSACTIVE == false
