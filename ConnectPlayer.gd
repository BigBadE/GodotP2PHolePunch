extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_press():
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
	Singletons.peer.put_packet("Test!".to_ascii_buffer())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
