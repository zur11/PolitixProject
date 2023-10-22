class_name Grid extends GridContainer

func _ready():
	for test_cell in self.get_children():
		test_cell.empty_cell_pressed.connect(_on_empty_cell_pressed.bind(test_cell))
	get_child(0).is_empty = true
	

func _on_empty_cell_pressed(test_cell : TestCell):
	var test_object : TestObject = load("res://game_objects/game_object/test object/test_object.tscn").instantiate() as TestObject
	test_cell.add_child(test_object)
