extends "res://objects/Basic.gd"

# GOAL: Implement the most efficient algorithm to collect coins and activate
#       switches.

# Test your algorithm design skills. There are many different algorithms to
# use. There is no right answer, but try to be as efficient as you can.

# If you're not able to find a solution right away. That's okay. Coding
# requires trying different solutions to a problem until you find one that
# works.

# INSTRUCTIONS:
# Try to help Luigi gather the coins and toggle the switches.
func execute ():
	
	pass


























func _ready():
	put_coin_at_cell(9, 6)
	put_coin_at_cell(9, 8)
	put_coin_at_cell(13, 4)
	put_coin_at_cell(13, 6)

	put_coin_at_cell(17, 6)
	put_coin_at_cell(17, 8)
	put_coin_at_cell(21, 4)
	put_coin_at_cell(21, 6)

	put_switch_at_cell(11, 14)
	put_switch_at_cell(11, 16)
	put_switch_at_cell(15, 10)
	put_switch_at_cell(15, 12)
	put_switch_at_cell(19, 12)
	put_switch_at_cell(19, 14)
	
	put_open_switch_at_cell(23, 12)

	$Luigi.face_east()
	put_luigi_at_cell (7, 6)
	proceed.post()
	

func put_random_switch (cx, cy):
	if rng.randi() % 2:
		put_switch_at_cell(cx, cy)
	else:
		put_open_switch_at_cell (cx, cy)

func main(userdata):
	proceed.wait()
	execute()
