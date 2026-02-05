extends Node2D

export (String) var color;
var move_tween;

func _ready():
	move_tween = get_node("move_tween");
	
func move(target):
	move_tween.interpolate_property(self, "position", position, target, .3, Tween.TRANS_SINE, Tween.EASE_OUT);
	move_tween.start();
	pass;
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
