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

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	global.isDead = false
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
	
	if !global.isDead && !global.paused:
		global.score += 1
		
	#if get_colliding_bodies().size():
		#_handle_collisions()
		
func _handle_game_over():
	global.isDead = true
	get_parent().get_node("Spatial/Spawner").isSpawning = false
	get_parent().get_node("GameOverMenu").visible = true
	get_parent().get_node("Crosshair").visible = false
	
func _handle_collisions():
	var collisions = get_colliding_bodies()
	#print("Get collision events for player")
	for i in collisions:
		if i.is_in_group("hazard"):
			#print("Box hit player!")
			#get_node("MeshInstance").transform.scaled(Vector3(0.4, 0.2, 0.4))
			pass