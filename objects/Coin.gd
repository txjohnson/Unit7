extends Area2D

func get_class(): return "Coin"

export var listener :NodePath
onready var target = get_node(listener)

func _ready():
	pass # Replace with function body.


func _on_Coin_area_entered(area):
	target.collected (self)
