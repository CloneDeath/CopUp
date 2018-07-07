extends Control

export var cops = 0;
export var arrest_cost = 5;
export var enabled = true;
signal arrest(count);

func _ready():
	$ArrestPeriod.connect("timeout", self, "make_arrest");
	$BuyCop.connect("button_down", self, "add_cop");

func _process(delta):
	$CopCount.text = str(cops);

func make_arrest():
	emit_signal("arrest", cops);

func add_cop():
	if (enabled):
		cops += 1;
