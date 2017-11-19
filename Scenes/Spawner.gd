extends Node
export (PackedScene) var Box
#onready var ref = load (Box.get_path())
onready var boxRef = load(Box.get_path())
var box
var isSpawning
var timer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	isSpawning = true
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(global.spawn_delay)
	timer.connect("timeout", self, "spawn_obstacle")
	add_child(timer)
	timer.start()
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func spawn_obstacle():
	if global.gameMode != 3:
		global.spawn_delay -= 0.02 * (global.spawn_delay/2)
		timer.set_wait_time(global.spawn_delay)
	
		if(isSpawning):
			box = boxRef.instance()
			get_parent().add_child(box)
			box.translate(Vector3((randf() * 8) - 4,3,0.5))
			#var mat = SpatialMaterial
			#box.get_node("MeshInstance").set_surface_material(1, mat)
	else:
		global.spawn_delay -= 0.09 * (global.spawn_delay/2)
		timer.set_wait_time(global.spawn_delay)
	
		if(isSpawning):
			box = boxRef.instance()
			get_parent().add_child(box)
			box.translate(Vector3((randf() * 8) - 4,3,0.5))
			#var mat = SpatialMaterial
			#box.get_node("MeshInstance").set_surface_material(1, mat)
	
	timer.start()