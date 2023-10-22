extends Node

enum cardinal_points { NW= 1, N= 2, NE= 3, W= 4, E= 6, SW= 7, S=8, SE=9 }

func get_cardinal_name(point: cardinal_points):
	return cardinal_points.find_key(point)
