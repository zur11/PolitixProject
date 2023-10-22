@tool
class_name MessagePresenter extends CharacterBody2D

@export var message: Message : set = _set_message

func _set_message(ms: Message):
	message = ms
	if is_inside_tree():
		$PropagationEnergyPresenter.text = str(message.energy)
