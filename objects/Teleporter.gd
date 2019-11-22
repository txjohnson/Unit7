extends Area2D

func get_class(): return "Teleporter"

export var listener :NodePath
onready var target = get_node(listener)

# export var connected :Teleporter
# onready var destpad = get_node (connected)
var destpad = null

var sending :bool

func _ready():
	pass # Replace with function body.


func _on_Node2D_area_entered(area):
	target .on_pad (self)

func _on_Node2D_area_exited(area):
	target .off_pad (self)


func teleport_send ():
	sending = true
	$Fx.visible = true
	$Fx/Animator.play("Operate")
	
func teleport_receive ():
	sending = false
	$Fx.visible = true
	$Fx/Animator.play("Operate")


func _on_Animator_animation_finished(anim_name):
	$Fx.visible = false
	if sending:
		destpad .teleport_receive()
	else:
		target .pad_worked(self)

func invoke_client_action ():
	target .pad_transit(self)
