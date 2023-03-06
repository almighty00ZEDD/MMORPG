extends Control

onready var label = $Panel/Label
onready var characterCreation : PackedScene = preload("res://Scenes/CharacterCreation.tscn")
onready var httprequester : HTTPRequest = get_node("HTTPRequest")
#tests
var nicks :  Array  = ["marocaine","tandori","bruce lee","yaourt10","gaymer","al kaida girl","turkish whale", "im az satan"]

"""
func _ready():
	
	NetworkManager.connect("previous_presences",self,"on_previous_presences_received")
	var rng = RandomNumberGenerator.new()
	rng.seed = (OS.get_unix_time())
	var random_value = rng.randf_range(0, 200)
	
	label.text = "Authentication..."
	yield(NetworkManager.authentificate_async("benzenatixxx" + str(random_value)),"completed")
	
	label.text = "connecting to the server"
	yield(NetworkManager.connect_to_server_async(),"completed")
	
	label.text = "joining the game"
	
	rng.seed = (OS.get_unix_time() % 6)
	var num = floor( 1 + rng.randf_range(0,5) )
	var composite = [num,num,num,num,num]
	rng.seed = (OS.get_unix_time() % 6)
	var nickname =  nicks[int(rng.randf_range(0,5))]
	yield(NetworkManager.join_map("forrest"),"completed")
	NetworkManager.send_previous_joined_presences()
	NetworkManager.send_my_presence_info(composite,nickname)
	
	label.text = NetworkManager._world_id


	#get_tree().change_scene_to(forrest_map)
	
	# Runtime RPC function caused an error","id":"join_map",
	#"error":"/nakama/data/modules/world_rpc.lua:20: 
	#attempt to index a non-table object(string) with key 
	#'map_name'\nstack traceback:\n\t/nakama/data/modules/world_rpc.lua:20: 
func _input(event):
	if not event is InputEventMouseButton :
		return
	if event.button_index !=  BUTTON_RIGHT or not event.pressed:
		return
	print("my composite : ", NetworkManager._composite)
	print("\nOTHERS : ", NetworkManager._composites)
	
func on_previous_presences_received() -> void :
	get_tree().change_scene_to(forrest_map)
"""

func _ready():
	label.text = "Authentication..."
	
	$HTTPRequest.connect("request_completed", self, "_on_request_completed")
	#$HTTPRequest.request('http://localhost:3000/users/sessionID')
	$HTTPRequest.request("https://jsonplaceholder.typicode.com/todos/1")
	
func _on_request_completed(result, response_code, headers, body):
	if result == HTTPRequest.RESULT_SUCCESS:
		print("Request completed successfully!")
		print("Response code: ", response_code)
		print("Headers: ", headers)
	
		var response_dict = parse_json(body.get_string_from_utf8())
		print("Response body: ", response_dict)
		
		# Access the _id and userName members in the response_dict object
		#var _id = response_dict["_id"]
		#var username = response_dict["userName"]
		
		NetworkManager._user_name = "ZEDD" #replace with username
		
		label.text = "authentication"
		yield(NetworkManager.authentificate_async("abracadabra"),"completed") #replace with id
		
		label.text = "Connection to the server..."
		yield(NetworkManager.connect_to_server_async(),"completed")
		
		get_tree().change_scene_to(characterCreation)
		
	else:
		label.text = "Request failed!"
