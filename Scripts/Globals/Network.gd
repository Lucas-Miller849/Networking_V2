extends Node

var port:int = 29000
var ip_address:String = "127.0.0.1"
var max_players:int = 4

var server:NetworkedMultiplayerENet = null
var client:NetworkedMultiplayerENet = null

func _ready():
	print(OS.get_name())
	get_tree().connect("connected_to_server", self, "_connected_to_server")
	get_tree().connect("server_disconnected", self, "_server_disconnected")
	

func _connected_to_server():
	print("Server: Connected")

func _server_disconnected():
	print("Server: Disconnected")

func create_server():
	server = NetworkedMultiplayerENet.new()
	server.create_server(port, max_players)
	get_tree().set_network_peer(server)

func join_server():
	client = NetworkedMultiplayerENet.new()
	client.create_client(ip_address, port)
	get_tree().set_network_peer(client)
