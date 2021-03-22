extends Spatial

var player_prefab = preload("res://Scenes/PlayerKB.tscn")

onready var spawn1 = $SpawnOne
onready var spawn2 = $SpawnTwo

func _ready():
	get_tree().connect("network_peer_connected", self, "_player_connected")
	get_tree().connect("network_peer_disconnected", self, "_player_disconnected")
	get_tree().connect("connected_to_server", self, "_connected_to_server")
	$LobbyUI.show()

func _player_connected(id):
	print("Player " + str(id) + " has connected")
	#instance player

func _player_disconnected(id):
	print("Player " + str(id) + " has disconnected")
	#remove from player list 

func _connected_to_server():
	pass

func _on_BtnHost_button_down():
	Network.create_server()
	$LobbyUI.hide()
	print(Network.ip_address)
	Global.instance_node(player_prefab, $SpawnOne)
	Global.instance_node_at(player_prefab, $SpawnOne, $SpawnOne.translation)


func _on_BtnJoin_button_down():
	if $LobbyUI/LineEdit.text != "":
		Network.join_server()
		$LobbyUI.hide()
		print(Network.ip_address)
	else:
		pass
