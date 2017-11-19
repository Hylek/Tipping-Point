extends VBoxContainer

func _ready():
	global.spawn_delay = 2
	pass

func _on_StartButton_pressed():
	get_tree().change_scene("res://Scenes/Main.tscn")
	global.gameMode = 1

func _on_QuitButton_pressed():
	get_tree().quit()

func _on_StartServerButton_pressed():
	pass # replace with function body

func _on_ConnectButton_pressed():
	pass # replace with function body


func _on_SlipButton_pressed():
	get_tree().change_scene("res://Scenes/SlipnSlide.tscn")
	global.gameMode = 2


func _on_RapidButton_pressed():
	get_tree().change_scene("res://Scenes/RapidFire.tscn")
	global.gameMode = 3
