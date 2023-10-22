extends CharacterBody2D

func _ready():
	var inputs : Inputs = get_node("Inputs") as Inputs
	inputs.set_input(GlobalConstants.cardinal_points.E, Message.new())
