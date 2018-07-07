extends Node

var score = 0;

func _ready():
	$Arrest.connect("arrest", self, "increment_score");

func _process(delta):
	$GUI/ArrestCount.text = str(score);

func increment_score(count):
	score += count;
