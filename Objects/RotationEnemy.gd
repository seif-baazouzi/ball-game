extends StaticBody2D

onready var sprite = $Sprite

func _process(_delta):
	sprite.rotation_degrees -= 5
