extends StaticBody2D

export(String, FILE) var level = ""

func goToNextLevel():
	get_tree().change_scene(level)
