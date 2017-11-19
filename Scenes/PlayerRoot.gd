extends Spatial

func _ready():
	set_process(true)
	pass

func _process(delta):
	var pos = transform.origin
	print(pos)