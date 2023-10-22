class_name GameScreen extends Control

var first_turn_performed : bool
var second_turn_performed : bool

var player_in_turn : Player

var players : Array[Player] = [load("res://data/player/player_1.tres"), load("res://data/player/player_2.tres")]

@onready var grid : Grid = $Grid

func _ready():
	grid.emitter_placed_in_grid.connect(_on_emitter_placed_in_grid)
	player_in_turn = players[0]

func _process(_delta):
	if first_turn_performed and second_turn_performed:
		first_turn_performed = false
		second_turn_performed = false
		_make_turn_calculations()
		
func _on_emitter_placed_in_grid():
	if not first_turn_performed:
		first_turn_performed = true
	else:
		second_turn_performed = true

func _make_turn_calculations():
	get_tree().call_group("game_objects", "analyze_recibed_messages")

func execute_player_turn():
	pass
