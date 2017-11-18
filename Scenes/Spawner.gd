extends Node
export (PackedScene) var Box
onready var ref = load (Box.get_path())
var box

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

func spawn_obstacle():
	box = ref.instance()
	get_parent().add_child(box)
	box.translate(Vector3((randf() * 8) - 4,3,0))