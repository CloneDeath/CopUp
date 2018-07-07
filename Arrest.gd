extends Control

signal arrest(count);

func _ready():
	$ArrestCriminal.connect("button_down", self, "onClick");
	pass

func onClick():
	emit_signal("arrest", 1);
