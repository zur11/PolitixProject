@tool
class_name Grid extends GridContainer

signal emitter_placed_in_grid

func send_neighbors(requested_grid_position:Vector2):
	var neigbors : Array[Neighbor]
	var requester_object: GameObject
	for ii in range(requested_grid_position.x- 1, requested_grid_position.x + 1):
		for jj in range(requested_grid_position.y- 1, requested_grid_position.y + 1):
			var new_neigbor = Neighbor.new()
			if ii == -1 and jj == -1: new_neigbor.direction = GlobalConstants.cardinal_points.NW
			if ii == -1 and jj == 0: new_neigbor.direction = GlobalConstants.cardinal_points.N
			if ii == -1 and jj == 1: new_neigbor.direction = GlobalConstants.cardinal_points.NE
			if ii == 0 and jj == -1: new_neigbor.direction = GlobalConstants.cardinal_points.W
			if ii == 0 and jj == 0: requester_object = get_element_by_position(Vector2(ii,jj))
			if ii == 0 and jj == 1: new_neigbor.direction = GlobalConstants.cardinal_points.E
			if ii == 1 and jj == -1: new_neigbor.direction = GlobalConstants.cardinal_points.SW
			if ii == 1 and jj == 0: new_neigbor.direction = GlobalConstants.cardinal_points.S
			if ii == 1 and jj == 1: new_neigbor.direction = GlobalConstants.cardinal_points.W
			
			new_neigbor.game_object = get_element_by_position(Vector2(ii,jj))
			neigbors.append(new_neigbor)
	requester_object.set_neigbors(neigbors)

func get_element_by_position(requested_object_position) -> GameObject:
	var requested_object
	for cell in self.get_children() as Array[Cell]:
		if cell.cell.cell_occupant == null:
			requested_object = null
		if cell.cell_occupant.grid_position == requested_object_position:
			requested_object = cell.cell_occupant
			break
	return requested_object
func _ready():
	for cell in self.get_children() as Array[Cell]:
		cell.empty_cell_pressed.connect(_on_empty_cell_pressed.bind(cell))
		if cell.cell_occupant:
			cell.cell_occupant.request_neighbors.connect(send_neighbors)
	get_child(0).is_empty = true

func _on_empty_cell_pressed(cell : Cell):
	var test_emitter : CharacterBody2D = load("res://game_objects/test_emitter/test_emitter.tscn").instantiate()
	cell.cell_occupant = test_emitter
#	cell.cell_occupant.request_neigbors.connect(send_neighbors)
	emitter_placed_in_grid.emit()
