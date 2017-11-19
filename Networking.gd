extends Node

func _ready():
	_create_server()
	pass
	
func _create_server():
	var host = NetworkedMultiplayerENet.new()
	host.create_server(4321, 4)
	get_tree().set_network_peer(host)
	