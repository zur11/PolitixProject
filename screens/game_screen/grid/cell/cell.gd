class_name Cell extends TextureButton

signal empty_cell_pressed

@export_enum("emptyableCell", "bussinessManCell", "bussinessWomanCell", "malePropagatorCell","femalePropagatorCell", "vegetableCell") var cell_type : String = "emptyableCell"

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
#	print(grid_position)
	match cell_type:
		"emptyableCell":
			is_empty = true
#		"bussinessManCell":
#			cell_occupant = 

func _set_cell_occupant(occupant : Node):
	cell_occupant = occupant
	
	is_empty = false
	add_cell_ocupant()

func add_cell_ocupant():
	cell_occupant.grid_position = grid_position
	self.add_child(cell_occupant)
	cell_occupant.position += Vector2(29, 41)

func _on_pressed():
	if not is_empty: return
	
	empty_cell_pressed.emit()

