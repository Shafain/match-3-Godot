extends Node2D

export (int) var width;
export (int) var height;
export (int) var x_start;
export (int) var y_start;
export (int) var offset;

var possible_pieces = [
	preload("res://Scenes/BluePiece.tscn"),
	preload("res://Scenes/GreenPiece.tscn"),
	preload("res://Scenes/OrangePiece.tscn"),
	preload("res://Scenes/YellowPiece.tscn"),
	preload("res://Scenes/LightGreen.tscn"),
	preload("res://Scenes/Pink.tscn")
];


var all_pieces = [];

func _ready():
	randomize();
	all_pieces = make_2d_array();
	spawn_pieces();
	

func make_2d_array():
	var array = [];
	for i in width:
		array.append([]);
		for j in height:
			array[i].append(null);
	return array;
			
func spawn_pieces():
	for i in width:
		for j in height:
			var rand = floor(rand_range(0, possible_pieces.size()));
			var piece = possible_pieces[rand].instance();
			add_child(piece);
			piece.position = grid_to_pixel(i, j);
	
func grid_to_pixel(column, row):
	var new_x = x_start + offset * column;
	var new_y = y_start + -offset * row;
	return Vector2(new_x, new_y);
	
