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
var cycle = 0
var mesh
var shape
var crunch = 0
var crunch_cooldown = false
var timer

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	global.isDead = false
	get_parent().get_node("GameOverMenu").visible = false
	set_axis_lock(3)
	mesh = get_node("MeshInstance")
	shape = get_node("CollisionShape")
	timer = get_node("Timer")
	global.score = 0
	set_process(true)

func _process(delta):
	if Input.is_action_pressed("ui_left"):
		impulse = Vector3(-mass/8, 0, 0)
		if cycle > 4:
			global.score += 1
			cycle = 0
		else:
			cycle += 1
	elif Input.is_action_pressed("ui_right"):
		impulse = Vector3(mass/8, 0, 0)
		if cycle > 10:
			global.score += 1
			cycle = 0
		else:
			cycle += 1
	else:
		impulse = Vector3(0,0,0)
	apply_impulse(postest, impulse)
	
	var pos = transform.origin
	if(pos.y <= -2):
		_handle_game_over()
	
	if cycle > 8:
		if !global.isDead && !global.paused:
			global.score += 1
		cycle = 0
	else:
		cycle += 1
		
	if get_colliding_bodies().size() > 0:
		_handle_collisions()

func _handle_game_over():
	global.isDead = true
	get_parent().get_node("Spatial/Spawner").isSpawning = false
	get_parent().get_node("GameOverMenu").visible = true
	get_parent().get_node("Crosshair").visible = false
	
	if global.score >= global.highscore:
		global.highscore = global.score
	
func _handle_collisions():
	var collisions = get_colliding_bodies()
	#print("Get collision events for player")
	for i in collisions:
		if i.is_in_group("hazard"):
			if crunch < 18:
				if !crunch_cooldown:
					print("c r u n c h")
					mesh.set_scale(Vector3(mesh.get_scale().x, mesh.get_scale().y - 0.02, mesh.get_scale().z))
					shape.set_scale(Vector3(shape.get_scale().x, shape.get_scale().y - 0.02, shape.get_scale().z))
					crunch += 1
					crunch_cooldown = true
					timer.start()
			else:
				global.isDead = true

func enable_crunch():
	crunch_cooldown = false