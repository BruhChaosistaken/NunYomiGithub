extends CharacterState

var hit_enemy = false
var hit_count = 0

const SPEED = "15.0"
const HITBOX_OFFSET = "0"

onready var hitbox = $Hitbox

func _enter():

	if host.awakened == true:
		uses_air_movement = false 

	else:
		uses_air_movement  = true

func _frame_0():

	hit_enemy = false

	land_cancel = false

	host.sprite.hide()
	host.speen.show()

func _frame_5():

	host.start_projectile_invulnerability()

	host.reset_momentum()

	var dir = xy_to_dir(data.x, data.y, SPEED)

	if host.combo_count <= 0 and fixed.sign(dir.x) != host.get_facing_int():
		host.add_penalty(20, true)
	var hitbox_offs = fixed.normalized_vec_times(dir.x, dir.y, HITBOX_OFFSET)
	var center = host.get_hurtbox_center()
	hitbox.dir_x = fixed.mul(hitbox_offs.x, str(host.get_facing_int()))
	hitbox.dir_y = hitbox_offs.y

	hitbox.x = fixed.round(hitbox_offs.x) * host.get_facing_int()
	hitbox.y = fixed.round(hitbox_offs.y) - 16
	host.apply_force(dir.x, dir.y)

	land_cancel = true


	host.speen.rotation = float(fixed.vec_to_angle(fixed.mul(dir.x, str(host.get_facing_int())), dir.y)) + TAU / 4

func _frame_22():
	host.end_projectile_invulnerability()

func _on_hit_something(opponent, hitbox):
	._on_hit_something(opponent, hitbox)

	hit_enemy = true
	hit_count += 1

func _tick():

	var player_speed = host.get_vel()
	var player_position = host.get_pos()



	host.sprite.hide()
	host.speen.show()

	host.apply_forces_no_limit()

func _exit():
	host.speen.hide()
	host.sprite.show()

func update_sprite_frame():
	.update_sprite_frame()

	if not host.speen.frames.has_animation(anim_name):
		return 
	if host.speen.animation != anim_name:
		host.speen.animation = anim_name
		host.speen.frame = 0
	var sprite_tick = current_tick / ticks_per_frame

	if loop_animation and absolute_loop:
		sprite_tick = host.current_tick / ticks_per_frame
	var frame = (sprite_tick % (sprite_anim_length - animation_loop_start) + animation_loop_start) if (loop_animation and sprite_tick > animation_loop_start) else Utils.int_min(sprite_tick, sprite_anim_length)
	host.speen.frame = frame
