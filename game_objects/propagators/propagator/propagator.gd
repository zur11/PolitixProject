class_name Propagator extends GameObject

@onready var inputs: Inputs = get_node("Inputs") as Inputs

func analyze_recibed_messages():
	messages_to_send = inputs.get_messages()
