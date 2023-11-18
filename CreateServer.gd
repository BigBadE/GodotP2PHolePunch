extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("button_down", _on_press)
	pass # Replace with function body.

func _on_press():
	if Singletons.hosted:
		print("Tried to host already-hosted server!")
	Singletons.hosted = true
	print("Started server on " + Singletons.public_ip + ":" + str(Singletons.public_port))
	Singletons.peer.bind(Singletons.public_port)
