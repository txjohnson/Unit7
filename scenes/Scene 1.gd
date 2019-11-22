extends "res://objects/Basic.gd"


# GOAL: Use the Right-Hand Rule algorithm to navigate around the hedges.

# Run this challenge and notice how the character stops after the first coin.
# To solve this puzzle you will need to adjust the algorithm.

# Here is the pseudocode for a partial solution. Rewrite this pseudocode 
# into prper GDSCript.
#
#navigate around the hedge:
#	if blocked to the right:
#		go forward
#	else:
#		turn right
#		go forward
#
#while not on closed switch:
#	navigate around hedge
#	if under coin:
#		collect coin
#		turn around
#
#finally toggle switch


# INSTRUCTIONS:
# 1. Read the pseudocode above
# 2. Convert the algorithm into proper code

func execute ():
	
	pass


























func _ready():
	var l1 = rng.randi() % 6
	var l2 = rng.randi() % 6
	var l3 = rng.randi() % 6

	put_hedge_column (13, 12 - l1, 13)
	put_hedge_column (17, 12 - l2, 13)
	put_hedge_column (18, 12 - l2, 13)
	put_hedge_column (22, 12 - l3, 13)
	
	put_coin_at_cell (14, 13)
	put_coin_at_cell (19, 13)
	put_switch_at_cell (23, 13)

	$Luigi.face_north()
	put_luigi_at_cell (12, 13)
	proceed.post()

func main(userdata):
	proceed.wait()
	execute()

func put_hedge_column (column, from, to):
	for i in range(from, to):
		$Stuff.set_cell(column, i, 30)