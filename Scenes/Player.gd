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
var deathEffect = Environment
var isDead

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	isDead = false
	get_parent().get_node("GameOverMenu").visible = false
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
	
	var pos = transform.origin
	if(pos.y <= -2):
		_handle_game_over()
	
func _handle_game_over():
	isDead = true
	get_parent().get_node("Spatial/Spawner").isSpawning = false
	get_parent().get_node("GameOverMenu").visible = true
	get_parent().get_node("Crosshair").visible = false
	#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	
	
	
	
	
	
	
	
	
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
	