extends Control

export var cops = 0;
export var order = 0;
#export var arrest_cost = 5;
var arrest_cost;
export var arrests_per_second = 1;
export var name_singular = "FORCE";
export var name_plural = "FORCES";
signal arrest(count);
var money_provider;

func _ready():
	$ArrestPeriod.connect("timeout", self, "make_arrest");
	$Buy.connect("button_down", self, "add_cop");
	arrest_cost = pow(5, order);
	$Total.text = "Total " + name_plural; 
	$Buy.text = "Buy " + name_singular;

func _process(delta):
	$Total/Count.text = str(cops);
	$Buy/Cost.text = str(arrest_cost);

func make_arrest():
	emit_signal("arrest", cops * arrests_per_second);

func add_cop():
	if money_provider != null && money_provider.score >= arrest_cost:
		money_provider.score -= arrest_cost;
		cops += 1;
