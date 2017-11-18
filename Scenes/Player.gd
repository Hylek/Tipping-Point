extends RigidBody

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var direction = 0
var impulse = Vector3(0,0,0)
var postest = Vector3(1,1,0)
var input_direction = 0
var velocity = Vector2(0, 0)
var grounded = false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_axis_lock(3)
	set_process(true)

func _process(delta):
	if Input.is_action_pressed("ui_left"):
		impulse = Vector3(-1, 0, 0)
	elif Input.is_action_pressed("ui_right"):
		impulse = Vector3(1, 0, 0)
	else:
		impulse = Vector3(0,0,0)
		
	apply_impulse(postest, impulse)
	
	
	
	
	
	
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
	