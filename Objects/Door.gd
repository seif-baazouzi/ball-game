extends StaticBody2D

export var level = ""

func goToNextLevel():
	get_tree().change_scene("res://Levels/" + level + ".tscn")
