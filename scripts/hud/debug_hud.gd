extends Node

class_name DebugHUD

export(NodePath) var zone_path

onready var x_pos = $Labels/XPOS
onready var y_pos = $Labels/YPOS
onready var x_sp = $Labels/XSP
onready var y_sp = $Labels/YSP
onready var cstate = $Labels/CSTATE
onready var lstate = $Labels/LSTATE
onready var lookup = $Labels/LOOKUP
onready var crouch = $Labels/CROUCH

onready var zone = get_node(zone_path)

const FORMAT = "%.2f"

func _process(_delta):
	var player_position = zone.player.position
	var player_velocity = zone.player.velocity
	var statemachine = zone.player.state_machine
	
	x_pos.text = FORMAT % player_position.x
	y_pos.text = FORMAT % player_position.y
	x_sp.text = FORMAT % player_velocity.x
	y_sp.text = FORMAT % player_velocity.y
	cstate.text = statemachine.current_state
	lstate.text = statemachine.last_state
	lookup.text = str(zone.player.is_looking_up)
	crouch.text = str(zone.player.is_looking_down)
	
	if cstate.text == "SuperPeelOut":
		cstate.text = "PeelOut"
	if lstate.text == "SuperPeelOut":
		lstate.text = "PeelOut"
