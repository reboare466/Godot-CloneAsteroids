extends Area2D

# Declare member variables here. Examples:
export var speed = 400  # How fast the player will move (pixels/sec).
export var angular_speed = 10
var screen_size  # Size of the game window.

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2() # player velocity vector
	var radial_velocity = 0
	var angular_velocity = 0
	if Input.is_action_pressed("ui_right"):
		angular_velocity += 1
	if Input.is_action_pressed("ui_left"):
		angular_velocity -= 1
	if Input.is_action_pressed("ui_up"):
		radial_velocity += 1
	if Input.is_action_pressed("ui_down"):
		radial_velocity -= 1
	velocity.x = radial_velocity*cos(rotation)
	velocity.y = radial_velocity*sin(rotation)
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	position += velocity * delta
	rotation += angular_velocity*angular_speed*delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
