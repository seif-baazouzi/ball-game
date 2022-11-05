extends CanvasLayer

onready var animationPlayer = $AnimationPlayer

func playTarntition():
	animationPlayer.play("level-trantition")
