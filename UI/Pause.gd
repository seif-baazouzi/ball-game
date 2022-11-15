extends CanvasLayer

onready var popup = $Popup

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		popup.visible = !popup.visible
		get_tree().paused = !get_tree().paused

func _on_Resume_pressed():
	popup.visible = false
	get_tree().paused = false

func _on_Restart_pressed():
	get_tree().reload_current_scene()
	get_tree().paused = false

func _on_Levels_pressed():
	get_tree().change_scene("res://Levels.tscn")
	get_tree().paused = false
