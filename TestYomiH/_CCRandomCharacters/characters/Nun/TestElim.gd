extends CharacterState

func _on_hit_something(opponent, hitbox):
	print("Entered Eliminate Range")
	pass

func detect(obj):
	if obj == host.opponent:
		print("Entered Eliminate Range")
		host.change_state("Eliminate2")
