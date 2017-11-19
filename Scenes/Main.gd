extends WorldEnvironment

const SERVER_PORT = 4321
var ip = "127.0.0.1"
var isMenuVisible = false
onready var menu = $Menu
onready var overlay = $Overlay
onready var crosshair = get_node("Crosshair")
onready var deathCheck = get_node("Spawner")

func _ready():
	overlay.visible = true
	#get_node("Spatial/Player").translate(Vector3(5,1,1))
	
	set_process(true)
	pass
	
func _process(delta):
	_handle_menu()
	#_handle_crosshair()
		
		
func _handle_menu():
	if !global.isDead:
		if(Input.is_action_just_released("ui_page_up")):
			isMenuVisible = !isMenuVisible
			print(isMenuVisible)
		if(isMenuVisible):
			menu.visible = true
			get_tree().set_pause(true)
			global.paused = true
		else:
			menu.visible = false
			get_tree().set_pause(false)
			global.paused = false

	
func _create_server():
	var host = NetworkedMultiplayerENet.new()
	if(host.create_server(SERVER_PORT, 4) != OK):
		print("Cannot connect to server: ", SERVER_PORT)
		
	set_network_master(true)
	host.create_server(SERVER_PORT, 4)
	get_tree().set_network_peer(host)

func _on_Button2_button_down():
	_connect_client()

func _connect_client():
	var host = NetworkedMultiplayerENet.new()
	host.create_client(ip, SERVER_PORT)
	get_tree().set_network_peer(host)

func _peer_connected(id):
	if(!get_tree().is_network_server()):
		return

func _on_RestartButton_pressed():
	get_tree().change_scene("res://Scenes/Main.tscn")

func _on_ContButton_pressed():
	menu.visible = false
	get_tree().set_pause(false)
	global.paused = false
	isMenuVisible = !isMenuVisible

func _on_PauseQuitbutton_pressed():
	print("Pressed Button")


func _on_GOQuitButton_pressed():
	get_tree().quit()