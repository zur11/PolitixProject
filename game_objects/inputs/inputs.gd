class_name Inputs extends Node2D

func set_input(input_position: GlobalConstants.cardinal_points, message: Message):
	var input_name = GlobalConstants.get_cardinal_name(input_position)
	print("x", input_name)
	get_node(input_name).get_child(0).visible = true
