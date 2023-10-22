class_name TestEmitter extends GameObject

var grid : Grid
var grid_position : Vector2
var player : Player

func request_object_position():
	grid.get_object_in_position(self, Vector2(1,3))
