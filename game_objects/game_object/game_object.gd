class_name GameObject extends CharacterBody2D

var neigbors: Array[Neigbor]

func send_message():
	pass
	
func analyze_recibed_messages():
	pass

func get_neigors():
	pass

class Neigbor:
	var direction: GlobalConstants.cardinal_points
	var game_object: GameObject
