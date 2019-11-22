extends Node2D

signal did_operation
signal grabbing

enum Direction { North, East, South, West }

var walk_anims = ["WalkUp", "WalkRight", "WalkDown", "WalkLeft"]
var jump_anims = ["JumpUp", "JumpRight", "JumpDown", "JumpLeft"]
var move_vecs  = [Vector2(0, -1), Vector2(1, 0), Vector2(0, 1), Vector2(-1, 0)]

var dir_base_offsets = [192, 324, 480, 612]

var direction :int
var going_to_face :int

export var walk_distance :int = 32
var to_go :int = 0
var was_moving :bool
var was_jumping :bool

func _ready():
	pass

func _process(delta):
	if to_go > 0:
		position += move_vecs [direction]
		to_go -= 1
	elif was_moving:
		was_moving = false
		face (direction)

func position_on_left():
	var left = direction - 1
	if left < 0: left = 3
	var vec = move_vecs [left]
	return position + Vector2(vec.x * walk_distance, vec.y * walk_distance)
	
func position_on_right():
	var right = direction + 1
	if right > 3: right = 0
	var vec = move_vecs [right]
	return position + Vector2(vec.x * walk_distance, vec.y * walk_distance)
	
func next_forward_position ():
	var vec = move_vecs [direction]
	return position + Vector2(vec.x * walk_distance, vec.y * walk_distance)

func face (adirection):
	$Sprite/AnimationPlayer.stop()
#	yield (get_tree().create_timer(0.5), "timeout")
	var base = dir_base_offsets [adirection]
	$Sprite.frame = base  # + 1
	direction = adirection
	emit_signal("did_operation")

#	going_to_face = adirection
#	$Timer.start(0.5)
		
func face_north ():
	face (Direction.North)
	
func face_south ():
	face (Direction.South)
	
func face_east ():
	face (Direction.East)
	
func face_west ():
	face (Direction.West)

func turn_left():
	direction -= 1
	if direction < 0:
		direction = 3
		
	face (direction)
	
func turn_right ():
	direction += 1
	if direction > 3:
		direction = 0
		
	face (direction)
	
func walk ():
	was_moving = true
	to_go =  walk_distance 
	$Sprite/AnimationPlayer.play(walk_anims [direction])
	
func jump ():
	was_jumping = true
	$Sprite/AnimationPlayer.play(jump_anims [direction])

func make_grab ():
	emit_signal("grabbing")
	
func _on_AnimationPlayer_animation_finished(anim_name):
	if was_jumping:
		emit_signal("did_operation")
		was_jumping = false


func _on_Timer_timeout():
	var base = dir_base_offsets [going_to_face]
	$Sprite.frame = base # + 1
	direction = going_to_face
	emit_signal("did_operation")
