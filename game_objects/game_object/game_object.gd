class_name GameObject extends CharacterBody2D

signal request_neighbors(grid_position: Vector2)

var neighbors: Array[Neighbor]
var grid_position: Vector2

var messages_to_send: Array[Message]

func _ready():
	add_to_group("game_objects")

func send_message():
	for message in messages_to_send:
		for neighbor in neighbors:
			if message.direction == neighbor.direction:
				neighbor.game_object.recibe_message(message)

func recibe_message(message: Message):
	pass


func analyze_recibed_messages():
	pass

func set_neigbors(n:Array[Neighbor]):
	neighbors = n

