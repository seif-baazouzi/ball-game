extends KinematicBody2D

const MOVE: int = 400
const JUMP: int = 500
const GRAVITY: int = 600
const ROTATION: int = MOVE / 60

onready var sprite = $Sprite

var initPostion

var coins: int = 0
var velocity: Vector2 = Vector2()

func _ready():
	initPostion = position
	VisualServer.set_default_clear_color(Color.lightskyblue)

func _physics_process(delta):
	handleMovment(delta)
	handleCollision()
	
func handleMovment(delta):
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

func handleCollision():
	for i in get_slide_count():
		var collider = get_slide_collision(i).collider
		
		if collider.is_in_group("enemy"):
			get_tree().reload_current_scene()
		
		if collider.is_in_group("door"):
			collider.goToNextLevel()
