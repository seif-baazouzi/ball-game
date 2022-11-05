extends Area2D

export(String, FILE) var level = ""
export(bool) var tarntition = true

func _on_Door_body_entered(body):
	if body is Player:
		if tarntition:
			LevelTrantition.playTarntition()
			yield(get_tree().create_timer(.5), "timeout")
		get_tree().change_scene(level)
