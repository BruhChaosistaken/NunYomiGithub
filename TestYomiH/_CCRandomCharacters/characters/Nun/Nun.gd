extends Fighter

var specialman = false
var charname =  "Messiah"

var Timestopped = false
var TS_Cooldown = 0
var Corruption_ticks = 0

var awakened = false
var awakentimer = 0
var SUFFER_ACTIVE = 0
var alleviate = false

var crucified = false 
var crucify_proj = null

var spriteframes
var Judgement = false

var Pressure_Left = 0
var Pressure_Amount = 10
var Pressure_MinAmount = 0

var insane = false

var insanity = 0
var insanity_Amount = 100
var insanity_MinAmount = 0

var dcheck = 0
#huh?
#What she checking

onready var speen = $"%speen"
onready var Claw =  $"%Claw"
onready var Halo =  $"%Halo"

const Glass_Shatter = preload("res://_CCRandomCharacters/characters/Nun/VFX/TimeStopGlassShatter.tscn")
const Insanity_Effect = preload("res://_CCRandomCharacters/characters/Nun/VFX/Insanity.tscn")

# amount of buffed hits
onready var damage_buff_stacks = 0
# previous hp amount, for checking the difference
onready var enemy_last_hp = null
# ignore damage buff option, for like projectiles or anything u want
onready var ignore_damage_buff = false




#for the sticky bomba



# function to check if damage was taken and if we should apply extra damage or not
func apply_damage_buff():
	# check if last_hp is updated
	if enemy_last_hp == null:
		# set last hp to current hp
		enemy_last_hp = opponent.hp
	# check if current hp is less than previously
	if opponent.hp < enemy_last_hp:
		# check if I have any stacks 
		if damage_buff_stacks > 0:
			#check if damage does not come from projectile
			if !ignore_damage_buff:
				# calculate the diff, aka the damage taken, 
				var hp_diff = enemy_last_hp - opponent.hp
				#multiply with 0.2 which is 20%
				hp_diff *= 0.3
				# apply damage to enemy
				opponent.take_damage(hp_diff)
				# remove one stack
				damage_buff_stacks -= 1
			else:
				#ignore damage and enable to take damage for next time taking damage
				ignore_damage_buff = false
		# update last hp for next tick
		enemy_last_hp = opponent.hp

func init(pos = null):
	.init(pos)

	spriteframes = sprite.frames

#	if infinite_resources:
#		Pressure_Left = Pressure_Amount

func tick():
	.tick()
	# execute function every tick, since we check for hp difference
	apply_damage_buff()

	if damage_buff_stacks > 10 and (Global.current_game.real_tick / 1) % 4 == 0:

		create_speed_after_image_from_style(1)

	if damage_buff_stacks > 10:
		damage_taken_modifier = "1.2"

	if awakened == true:
		Pressure_Left = Pressure_Amount+1
		$"%STACK10".start_emitting()
	else:
		$"%STACK10".stop_emitting()

		$"%Corruption".stop_emitting()
		
		if Pressure_Left > Pressure_Amount:
			Pressure_Left = Pressure_Amount

# and damage_buff_stacks <= 10:      <---- used if i return the Pain Super

	if damage_buff_stacks > 0:
		$"%STACK".start_emitting()

		damage_taken_modifier = "1.2"

	if damage_buff_stacks <= 0:
		$"%STACK".stop_emitting()

		damage_taken_modifier = "1.0"
		awakened = false

	if Corruption_ticks > 0:

		Timestopped = true

		if not is_ghost:
			Global.current_game.time += 1

		Corruption_ticks -= 1
		$"%Corruption".start_emitting()
		$"%ColorRect".show()
		hp -= 1
		trail_hp = hp
		opponent.trail_hp = opponent.trail_hp

		var opp_hitboxes = opponent.get_active_hitboxes()
		for hitbox in opp_hitboxes:
			hitbox.deactivate()

		var player_hitboxes = get_active_hitboxes()
		for hitbox in player_hitboxes:
			hitbox.damage = hitbox.damage / 2
			hitbox.sdi_modifier = "0.0"

		opponent.feinting = false
		opponent.hitlag_ticks += 1
		opponent.end_invulnerability()
		opponent.got_parried = true
		#// opponent.current_state().iasa_at = Corruption_ticks
		opponent.current_state().interruptible_on_opponent_turn = false

		for objs in objs_map.values():
			if is_instance_valid(objs):
				if not (objs.is_in_group("Fighter")) and not objs == self:
					if objs is BaseObj or BaseProjectile:
							objs.hitlag_ticks += 1

	if Corruption_ticks <= 0:
		$"%Corruption".stop_emitting()
		$"%ColorRect".hide()

	if Corruption_ticks % 20:
		play_sound("Tick")

	if Corruption_ticks == 1:
		play_sound("Za Warudo End")
		play_sound("Za Warudo End 2")

		Timestopped = false

		spawn_particle_effect_relative(Glass_Shatter, hurtbox_pos_relative_float())

	if TS_Cooldown > 0:
		TS_Cooldown -= 1

	if opponent.get("usingTS") == true and Corruption_ticks > 0:
		Corruption_ticks = 1

	if Judgement == true:
		sprite.frames = preload("res://_CCRandomCharacters/characters/Nun/NunJudgement.tres")
		stance = "judge"

	else:
		sprite.frames = spriteframes
		$"%BG".hide()


	if opponent.was_moving_backward():
		Pressure_Left += 0.05

	if was_moving_forward():
		Pressure_Left += 0.025

	if Pressure_Left >= 5:
		$"%Pressure".start_emitting()
	else:
		$"%Pressure".stop_emitting()

	if opponent.on_the_ground == true or opponent.current_state().name == "Getup":
		Pressure_Left += 0.020

	if opponent.current_state().name == "DefensiveBurst":
		Pressure_Left += 0.01

	if stance == "Stalk":
		Pressure_Left += 0.01
	
	if Pressure_Left < Pressure_MinAmount:
		Pressure_Left = Pressure_MinAmount

		
		
	if awakentimer > 0:
		awakentimer -= 1 
		print(awakentimer)
	if awakentimer == 1:
		print("triggered")
		awakened = false
		print(awakened)
		Pressure_Left = 1

#/// return this for insanity mechanic

	if Pressure_Left >= 10 and insanity <= 100 and awakened == false:
		insanity += 10

	if Pressure_Left < 10 and insanity > 0:
		insanity -= 0.5

	if insanity >= 100:
		insane = true
		change_state("Insane")

	else:
		insane = false

	if insanity == 99:
		play_sound("MaxStart")
		spawn_particle_effect_relative(Insanity_Effect, hurtbox_pos_relative_float())

	var time_in_insane = 0

	if insane == true:
		time_in_insane += 1
		
		if time_in_insane == 100:
			pass

		if time_in_insane == 200:
			pass

		if time_in_insane == 300:
			pass

#	print(specialman)



func on_got_blocked():
	.on_got_blocked()

	Pressure_Left += 0.07 * opponent.blocked_hitbox_plus_frames + 0.30

#	Global.songs = {"Awakened":preload("res://_CCRandomCharacters/characters/Nun/SFX/Judgement/Icefield White Knight II  Under Night In-Birth II [SYS_Celes] Londrekia Theme.mp3"),
#		"bg1":preload("res://sound/music/bg1.mp3")
#	}
# Nun hits a her own projectile, spawns skull code
func _on_hit_something(obj,hitbox):
	._on_hit_something(obj,hitbox)
	
	Pressure_Left += 0.1
	
	if not obj.is_in_group("Fighter") and obj.id == id:
		
		
		var final_di_y =  0

		if current_di.y > 0:
			final_di_y = 0
		else:
			final_di_y = current_di.y

		var test = Vector2(0,0) + Vector2(current_di.x, final_di_y)
		
		var dir = fixed.normalized_vec(str(test.x), str(test.y))

		var pos = obj.get_pos()

		var skull = spawn_object(preload("res://_CCRandomCharacters/characters/Nun/CrossProjectile.tscn"), pos.x, pos.y, true, {"dir": dir},false)
		skull.set_facing(get_facing_int())
		if get_facing_int() == 1:
			
			 var force = fixed.normalized_vec_times(str(hitbox.x),str(hitbox.y+25),fixed.mul(hitbox.knockback, "1"))
			 skull.apply_force(force.x,force.y)
		
		if get_facing_int() == -1:
			 var force = fixed.normalized_vec_times(str(-hitbox.x),str(-(hitbox.y+25)),fixed.mul(hitbox.knockback, "1"))
			 skull.apply_force(force.x,force.y)
func getOpponentName():
	var name = find_parent("Main").match_data.selected_characters[opponent.id]["name"]
	var filter = name.rfind("__") 
	if filter != -1:
		filter += 2
		name = name.right(filter)
	return name

#// intro stuff //#

var Names = [
	"ShadowRose",
	"Messiah",
	"Glidedguy",
	"Jade",
	"Yupia",
	"Yoyo",
	"Oxob",
	"Mr.Pix",
	"John Yomi",
	"Torment",
	"Lunatic",
	"Colossus",
	"Royalty",
	"Bunbun",
	"Robot",
	"Chimamire",
	"Bog",
	"Steel",
	"Miko",
	"Fumiko",
	"Hellsaint",
	"Sister",
	"Shika",
	"Goober",
	"Eminence",
	"Saitama",
	"Yandere",
	"Animosity",
	"Gojo",
	"Todo",
	"Choso",
	"Miwa",
	"Sukuna",
	"Yharim",
	#ESPECIALLY EMINENCE, BRO IS DOWN BAD
]

#Judgment / Projectile Shenanigans

var SSCROSSACTIVE = false
var SSCROSS = null

func CRY():
	if SSCROSSACTIVE and obj_from_name(SSCROSS):
		objs_map[SSCROSS].detonate()

func crucify():
	if crucified and obj_from_name(crucify_proj):
		objs_map[crucify_proj].explode()

func process_extra(extra):

	.process_extra(extra)
	if extra.has("explode"):
		if extra["explode"]:
			CRY()
	if extra.has("Crucify"):
		if extra["Crucify"]:
			crucify()
			
	if extra["alleviate"]: alleviate = true
	else: alleviate = false
	

onready var SKULL = null
onready var SKULL2 = null

func terrify(player):
		var local_pos = opponent.get_center_position_float() - player

		var dir = fixed.normalized_vec(str(local_pos.x), str(local_pos.y+20))
		spawn_object(load("res://_CCRandomCharacters/characters/Nun/SKULL.tscn"), -40, -40, true, {"dir": dir})
		spawn_object(load("res://_CCRandomCharacters/characters/Nun/SKULL.tscn"), 40, -40, true, {"dir": dir})

func spook(player):
		var local_pos = opponent.get_center_position_float() - player
		print(local_pos)
		var dir = fixed.normalized_vec(str(local_pos.x), str(local_pos.y+20))
		spawn_object(load("res://_CCRandomCharacters/characters/Nun/SKULL.tscn"), 60, -10, true, {"dir": dir})


func terrify_opponent(player):
		var local_pos = opponent.get_center_position_float() - player
		print(local_pos)
		var dir = fixed.normalized_vec(str(local_pos.x), str(local_pos.y+20))
		spawn_object(load("res://_CCRandomCharacters/characters/Nun/SKULL.tscn"), -40, -40, true, {"dir": dir})
		spawn_object(load("res://_CCRandomCharacters/characters/Nun/SKULL.tscn"), 0, -80, true, {"dir": dir})

func traumatize():
		spawn_object(load("res://_CCRandomCharacters/characters/Nun/EvilCross.tscn"), -40, -40)
		spawn_object(load("res://_CCRandomCharacters/characters/Nun/EvilCross.tscn"), 40, -40)

#func ACTIVE_SKULL_1():
#	if is_instance_valid(obj_from_name(SKULL)):
#		return obj_from_name(SKULL)
#
#func ACTIVE_SKULL_2():
#	if is_instance_valid(obj_from_name(SKULL2)):
#		return obj_from_name(SKULL2)


func SWAP1():
	if is_instance_valid(obj_from_name(SKULL)):
		objs_map[SKULL].set_pos(get_pos().x, get_pos().y)
		set_pos(objs_map[SKULL].get_pos().x, objs_map[SKULL].get_pos().y)
		print("hi")

func SWAP2():

	if is_instance_valid(obj_from_name(SKULL2)):
		objs_map[SKULL2].set_pos(get_pos().x, get_pos().y)
		set_pos(objs_map[SKULL2].get_pos().x, objs_map[SKULL2].get_pos().y)
		print("hi")

func _ready():

	speen.set_material(sprite.get_material())
	Claw.set_material(sprite.get_material())
	Halo.set_material(sprite.get_material())

	var namearray = [ 	"musicofdeawea", "C.C", "Pres", "Chaos", "sdfgsdjfk" ]

	for username in namearray:
		if username == Network.pid_to_username(id) :
			specialman = true

