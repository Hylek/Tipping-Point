extends VBoxContainer

func _ready():
	pass

# Connected to the start button via a signal. Changes scene once pressed signal is sent.
func _on_StartButton_pressed():
	get_tree().change_scene("res://Scenes/Main.tscn")

# Quits the game once the pressed signal is sent.
func _on_QuitButton_pressed():
	get_tree().quit()
