class_name GameObject extends CharacterBody2D

signal request_object_in_position(position: Vector2)

var neigbors: Array[Neigbor]
var grid_position: Vector2

func send_message():
	pass
	
func analyze_recibed_messages():
	pass

func set_neigbors():
	pass

class Neigbor:
	var direction: GlobalConstants.cardinal_points
	var game_object: GameObject
