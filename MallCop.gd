extends Control

export var cops = 0;
export var arrest_cost = 5;
export var arrests_per_second = 1;
signal arrest(count);
var money_provider;

func _ready():
	$ArrestPeriod.connect("timeout", self, "make_arrest");
	$BuyCop.connect("button_down", self, "add_cop");

func _process(delta):
	$CopCount.text = str(cops);

func make_arrest():
	emit_signal("arrest", cops * arrests_per_second);

func add_cop():
	if money_provider != null && money_provider.score >= arrest_cost:
		money_provider.score -= arrest_cost;
		cops += 1;
