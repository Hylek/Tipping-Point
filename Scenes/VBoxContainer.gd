extends VBoxContainer

func _ready():
	
	pass

func _on_StartButton_pressed():
	get_tree().change_scene("res://Scenes/Main.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()

func _on_StartServerButton_pressed():
	pass # replace with function body

func _on_ConnectButton_pressed():
	pass # replace with function body

func _on_GOQuitButton_pressed():
	get_tree().quit()
	pass # replace with function body
