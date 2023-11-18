extends Node

var public_ip
var public_port

var peer = PacketPeerUDP.new()
var hosted = false

const StunClient = preload("res://StunClient.gd")
var stun_client: StunClient

# Called when the node enters the scene tree for the first time.
func _ready():
	stun_client = StunClient.new('69.164.203.66', 443)
	
	stun_client.connect("message_received", _on_stun_client_message_received)
	stun_client.send_binding_request()

func _on_stun_client_message_received(response: StunClient.Message, request: StunClient.Message):
	var data = str(response.attributes[0]).split(":")
	public_ip = data[1].erase(0)
	public_port = int(data[2].split(" ")[0])
	
func _process(delta: float) -> void:
	stun_client.poll()
