extends Node

var score = 0;

func _ready():
	for child in get_children():
		hook_up_child_arrest_signal(child);

func hook_up_child_arrest_signal(child):
	child.connect("arrest", self, "increment_score");

func _process(delta):
	$GUI/ArrestCount.text = str(score);

func increment_score(count):
	score += count;
