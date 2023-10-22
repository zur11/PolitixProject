class_name Inputs extends Node2D

var recibed_messages: Array[Message]

func add_message(message: Message):
	var input_name = GlobalConstants.get_cardinal_name(message.direction)
	recibed_messages.append(message)
	get_node(input_name).get_child(0).visible = true

func get_messages():
	return recibed_messages
