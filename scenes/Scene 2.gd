extends "res://objects/Basic.gd"


# GOAL: Adjust your algorithm to navigate around extra bushes.

# This puzzle is similar to the last, but additional shrubs prevent your
# right-hand rule algorithm from working. Sometimes you're blocked on
# the right but you can't move forward because you're also blocked in
# front.

# To fix this, you need to tweak your algorithm.  Here is the original
# algorithm. Think about the situations and how Luigi can overcome each
# one.


# INSTRUCTIONS:
# 1. Modify your algoritm to handle the extra bushes.
# 2. Add commands to navigateAroundHedge
func navigateAroundHedge():
	if isBlockedRight:
		goForward()
	else:
		turnRight()
		goForward()
		
func execute ():
	while isOnClosedSwitch == false:
		navigateAroundHedge()
		if isUnderCoin:
			jump()
	toggleSwitch()
	
	pass


























func _ready():
	var l1 = rng.randi() % 3
	var l2 = rng.randi() % 4 + 1
	var l3 = rng.randi() % 2

	put_hedge_column (13, 10, 13)
	$Stuff.set_cell (14, 10 + l1, 29)
	
	put_hedge_column (18, 8, 13)
	put_hedge_row (8, 18 - l2, 18)
	
	put_hedge_column (22, 10, 13)
	$Stuff.set_cell (21, 11 + l3, 29)
	$Stuff.set_cell (21, 9 + l3, 29)
	$Stuff.set_cell (21, 8 + l3, 29)
	
	put_switch_at_cell (23, 13)
	put_coin_at_cell (14, 13)
	put_coin_at_cell (18, 13)

	$Luigi.face_north()
	put_luigi_at_cell (12, 13)
	proceed.post()

func main(userdata):
	proceed.wait()
	execute()

func put_hedge_column (column, from, to):
	for i in range(from, to):
		$Stuff.set_cell(column, i, 30)
		
func put_hedge_row (row, from, to):
	for i in range(from, to):
		$Stuff.set_cell(i, row, 29)