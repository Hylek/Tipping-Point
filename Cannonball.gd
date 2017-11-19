extends RigidBody

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func destroy():
	print("destroy ball")
	get_node("MeshInstance").remove_and_skip()
	get_node("CollisionShape").remove_and_skip()
	set_mode(MODE_STATIC)
	
func _process(delta):
	if get_colliding_bodies().size():
		handle_collision()

func handle_collision():
	var colliders = get_colliding_bodies()
	print("handling collision events")
	for i in colliders:
		if i.is_in_group("hazard"):
			print("hit a box!")
			global.score += 100