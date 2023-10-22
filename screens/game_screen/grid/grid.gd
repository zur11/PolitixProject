class_name Grid extends GridContainer

signal emitter_placed_in_grid

func get_object_in_position(requester_object: GameObject, requested_object_position: Vector2):
	var requested_object : GameObject 
	
	for cell in self.get_children() as Array[Cell]:
		if cell.cell_occupant.grid_position == requested_object_position:
			requested_object = cell.cell_occupant
			break
	
	printt(requested_object.grid_position)

func _ready():
	for cell in self.get_children() as Array[Cell]:
		cell.empty_cell_pressed.connect(_on_empty_cell_pressed.bind(cell))
		cell.cell_occupant.request_object_in_position.connect(get_object_in_position)
	get_child(0).is_empty = true

func _on_empty_cell_pressed(cell : Cell):
	var test_emitter : CharacterBody2D = load("res://game_objects/test_emitter/test_emitter.tscn").instantiate()
	cell.cell_occupant = test_emitter
	cell.cell_occupant.request_object_in_position.connect(get_object_in_position)
	emitter_placed_in_grid.emit()
