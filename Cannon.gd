extends Node
export (PackedScene) var Ball
onready var ref = load (Ball.get_path())
var ball
var impulse = Vector3(0,0,-25)
var pos = Vector3(0,0,0)
var cooldown = false;
var timer = Timer.new()

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	timer.connect("timeout",self,"cooldown_end")
	timer.set_one_shot(true)
	timer.set_wait_time(0.3)
	add_child(timer)

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		if !cooldown:
			fire()
			cooldown = true
			timer.start()

func fire():
	print("fire cannon")
	ball = ref.instance()
	get_parent().add_child(ball)
	var mousePos = get_viewport().get_mouse_position()
	
	ball.translate(Vector3((mousePos.x - (get_viewport().size.x/2)) / (get_viewport().size.x/10), (get_viewport().size.y/177) - ((mousePos.y + (get_viewport().size.y/2)) / (get_viewport().size.y/5.6)), -5))
	
	ball.apply_impulse(pos, impulse)

func cooldown_end():
	cooldown = false