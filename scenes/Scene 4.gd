extends "res://objects/Basic.gd"

# GOAL: Write your own algorithm to solve the meze.

# It's time to practice what you've learned and write your own algorithm 
# from scratch.

# To complete this puzzle, you'll need to follow the path. Move to each 
# switch and then decide whether to turn left or right. Try to identify
# a pattern in the puzzle that let's you know which way to turn.

# INSTRUCTIONS:
# Figure out a pattern and use loops to help Luigi toggle the switches
# and reach the coin
func execute ():
	pass


























func _ready():
	put_coin_at_cell(15, 2)
	put_switch_at_cell(13, 12)
	put_switch_at_cell(13, 16)
	put_switch_at_cell(21, 16)
	put_switch_at_cell(21, 8)
	put_switch_at_cell(25, 8)
	put_switch_at_cell(25, 2)
	
	$Luigi.face_east()
	put_luigi_at_cell (8, 12)
	proceed.post()
	
func main(userdata):
	proceed.wait()
	execute()

	

