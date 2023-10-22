class_name TestCell extends TextureButton

signal empty_cell_pressed

var is_empty : bool

var cell_occupant : Node

func _ready():
	pass


func _on_pressed():
	if not is_empty: return
	
	empty_cell_pressed.emit()
