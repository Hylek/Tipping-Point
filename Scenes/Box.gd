extends RigidBody

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func destroy():
	print("destroy box")
	get_node("MeshInstance").remove_and_skip()
	get_node("CollisionShape").remove_and_skip()
	set_mode(MODE_STATIC)