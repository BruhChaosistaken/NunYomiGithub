extends CharacterState

var attack = 0

var TOMB = preload("res://_CCRandomCharacters/characters/Nun/SSEXPUNGECROSS.tscn")
var CRUCIFY = preload("res://_CCRandomCharacters/characters/Nun/SSCRUCIFYprojectile.tscn")

func _enter():
	attack = data.Attack.id
	host.opponent.hitlag_ticks += 4

func _frame_11():

	host.play_sound("FloorStab")

	host.opponent.hitlag_ticks += 4
	host.global_hitlag(host.opponent.hitlag_ticks)

	if attack ==  0:
		print("die")
		host.spawn_object(CRUCIFY, data.Position.x * host.get_facing_int() * 3, data.Position.y - 17)
		

	elif attack == 1:
		print("dick")
		host.spawn_object(TOMB, data.Distance.x, -17)

func is_usable():
	return .is_usable() and host.SSCROSSACTIVE == false
