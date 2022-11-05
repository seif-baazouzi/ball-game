extends KinematicBody2D

class_name Player

const MOVE: int = 400
const JUMP: int = 500
const GRAVITY: int = 600
const ROTATION: int = MOVE / 60

onready var sprite = $Sprite

var initPostion: Vector2

var coins: int = 0
var velocity: Vector2 = Vector2()

func _ready():
	initPostion = position
	VisualServer.set_default_clear_color(Color.lightskyblue)
	
func _physics_process(delta):
	velocity.y += GRAVITY * delta
	
	if Input.is_action_pressed("ui_up") and is_on_floor():
		velocity.y = -JUMP
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = MOVE
		sprite.rotation_degrees += ROTATION
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -MOVE
		sprite.rotation_degrees -= ROTATION
	else:
		velocity.x = 0
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
func _on_Area2D_body_entered(body):
	if body.is_in_group("enemy"):
		get_tree().reload_current_scene()
