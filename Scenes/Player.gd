extends RigidBody

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

const GRAVITY = 3500
const ACCELERATION = 5000
const DECELERATION = 4000
const FRICTION = 5
const MAX_SPEED = 800
const JUMP_FORCE = 1150

var direction = 0
var input_direction = 0
var velocity = Vector2(0, 0)
var grounded = false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)

func _process(delta):
	if Input.is_action_pressed("ui_left"):
		input_direction = -1
	elif Input.is_action_pressed("ui_right"):
		input_direction = 1
	else:
		input_direction = 0
	
	if input_direction != 0: # If there is x-axis input
		# Increase x-speed up to a maximum for both directions
		velocity.x += ACCELERATION * direction * delta
		velocity.x = clamp(velocity.x, -MAX_SPEED, MAX_SPEED)
		

	
	
	
	
	
	
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
	