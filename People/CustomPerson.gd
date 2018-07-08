tool
extends Node2D

enum top_colors {
	Blue, Green, Grey, Navy, Pine, Red
}
const top_name = {
	top_colors.Blue: "blue",
	top_colors.Green: "green",
	top_colors.Grey: "grey",
	top_colors.Navy: "navy",
	top_colors.Pine: "pine",
	top_colors.Red: "red"
};

export(int, 1, 8) var shirt_type = 1;
export(top_colors) var shirt_color = top_colors.Red;
export(int, 1, 8) var skin_color = 1;

func updateAnimations():
	$Chest.animation = "%s%s"%[top_name[shirt_color], shirt_type];
	$Chest/RightSleeve/Arm.animation = "tint%s"%skin_color;
	$Chest/RightSleeve/Hand.animation = "tint%s"%skin_color;
	$Chest/LeftSleeve/Arm.animation = "tint%s"%skin_color;
	$Chest/LeftSleeve/Hand.animation = "tint%s"%skin_color;

func _ready():
	updateAnimations();

func _process(delta):
	updateAnimations();
