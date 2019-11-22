extends Area2D

func get_class(): return "Switch"

export var listener :NodePath
onready var target = get_node(listener)

var soff = preload("res://assets/switch up.png")
var son  = preload("res://assets/switch down.png")

var toggled :bool = false

func _ready():
	pass # Replace with function body.


func _on_Switch_area_entered(area):
	print("switch touched.")
	target.at_switch (self)


func _on_Switch_area_exited(area):
	target.not_at_switch (self)


func toggle ():
	print("toggling")
	if toggled:
		$Sprite.set_texture (soff)
		toggled = false
	else:
		$Sprite.set_texture (son)
		toggled = true