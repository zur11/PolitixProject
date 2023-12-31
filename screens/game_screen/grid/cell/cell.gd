@tool
class_name Cell extends TextureButton

signal empty_cell_pressed

@export_enum("emptyable", "citycen", "bussinessMan", "decoration") var cell_type : String = "emptyable"

var is_empty : bool

var cell_occupant : Node : set = _set_cell_occupant

var bussinessMan 

var grid_child_number: int: set = _set_grid_child_number
var grid_position: Vector2

func _set_grid_child_number(new_value: int):
	grid_child_number = new_value
	var number_in_row : int
	var number_in_column : int = 1
	
	if grid_child_number > 23:
		while grid_child_number > 23:
			number_in_column += 1
			grid_child_number -= 24

	number_in_row = grid_child_number + 1
	
	grid_position = Vector2(number_in_column, number_in_row)

func _ready():
	grid_child_number = self.get_index()
	match cell_type:
		"emptyable":
			is_empty = true
		"citycen":
			cell_occupant = load("res://game_objects/propagators/citizen/citizen.tscn").instantiate()

func _set_cell_occupant(occupant : Node):
	cell_occupant = occupant
	
	is_empty = false
	add_cell_ocupant()

func add_cell_ocupant():
	cell_occupant.grid_position = grid_position
	self.add_child(cell_occupant)
	cell_occupant.position += Vector2(29, 41)

func _on_pressed():
	print(grid_child_number, is_empty, cell_type)
	if not is_empty: return
	
	empty_cell_pressed.emit()

