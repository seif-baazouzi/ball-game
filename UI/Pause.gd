extends CanvasLayer

onready var popup = $Popup

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		popup.visible = true
		get_tree().paused = true

func _on_Resume_pressed():
	popup.visible = false
	get_tree().paused = false

func _on_Restart_pressed():
	get_tree().reload_current_scene()
	get_tree().paused = false

func _on_Levels_pressed():
	get_tree().change_scene("res://Levels.tscn")
	get_tree().paused = false
