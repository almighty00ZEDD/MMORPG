extends Control

onready var label = $Panel/Label
onready var forrest_map : PackedScene = preload("res://Scenes/forrest.tscn")

#tests
var nicks :  Array  = ["marocaine","tandori","bruce lee","yaourt10","gaymer","al kaida girl","turkish whale", "im az satan"]

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

