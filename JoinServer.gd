extends Button

var peer = PacketPeerUDP.new()
var hosted = false

# Called when the node enters the scene tree for the first time.
func _ready():
	multiplayer.peer_connected.connect(_on_player_connected)
	connect("button_down", _on_press)
	pass # Replace with function body.


func _on_press():
	print("Joining server!")
	if Singletons.hosted:
		var found = (get_node("../LineEdit") as LineEdit).text
		var data = found.split(":")
		var ip = "localhost"
		var port = 50000
		if data.size() == 1:
			ip = data[0]
		else:
			ip = data[0]
			port = int(data[1])
		Singletons.peer.connect_to_host(ip, port)
		Singletons.peer.wait()
		print("Got packet!")
		return
	Singletons.hosted = true
	Singletons.peer.bind(Singletons.public_port)
	
	print("Hosting client on " + Singletons.public_ip + ":" + str(Singletons.public_port))
	
func _on_player_connected(id):
	print("Client Connected to " + id + "!")
