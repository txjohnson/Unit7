extends "res://objects/Basic.gd"

# GOAL: Use the right-hand rule to navigate around a maze.

# An algorithm that follows the right-hand rule works well for solving
# simple puzzle, but did you know you can also use it to move through
# more complicated paths?

# For this puzzle, walk through the maze in your mind. If you always
# keep your right hand on the wall, you'll eventually reach the coin.

# INSTRUCTIONS:
# 1. Start with the code from the previous scene.
# 2. Cut and paste the code here.
# 3. Adjust your code until Luigi can rech the coin.
func execute ():
	pass


























func _ready():
	put_coin_at_cell(21, 4)

	$Luigi.face_east()
	put_luigi_at_cell (9, 16)
	proceed.post()
	
func main(userdata):
	proceed.wait()
	execute()
