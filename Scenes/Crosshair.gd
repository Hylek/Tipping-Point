extends Node2D



func _ready():
	set_process(true)
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	pass

func _process(delta):
	var mousePos = get_global_mouse_position()
	print(mousePos)
	var passedVar = get_parent().get("isMenuVisible")
	if(passedVar):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_node("sprite").visible = false
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		get_node("sprite").visible = true
	
	position = mousePos