extends Control

onready var label = $Panel/Label
onready var forrest_map : PackedScene = preload("res://Scenes/main.tscn")

func _ready():
	var rng = RandomNumberGenerator.new()
	rng.seed = (OS.get_unix_time())
	var random_value = rng.randf_range(0, 200)
	
	label.text = "Authentication..."
	yield(NetworkManager.authentificate_async("benzenatixxx" + str(random_value)),"completed")
	
	label.text = "connecting to the server"
	yield(NetworkManager.connect_to_server_async(),"completed")
	
	label.text = "joining the game"
	
	var composite = [rng.randf(0,5),rng.randf(0,5),rng.randf(0,5),rng.randf(0,5),rng.randf(0,5)]
	var nickname =  "PLAYER" + str(rng.randf(0,50))
	yield(NetworkManager.join_map("forrest",composite,nickname),"completed")
	
	label.text = NetworkManager._world_id
	
	get_tree().change_scene_to(forrest_map)
	
	# Runtime RPC function caused an error","id":"join_map",
	#"error":"/nakama/data/modules/world_rpc.lua:20: 
	#attempt to index a non-table object(string) with key 
	#'map_name'\nstack traceback:\n\t/nakama/data/modules/world_rpc.lua:20: 
