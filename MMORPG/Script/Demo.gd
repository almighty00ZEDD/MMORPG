extends Node2D

onready var nav2D  : Navigation2D = $Navigation2D

#la manipulation des joueurs se passe ici!!!
onready var player
onready var characters : Dictionary
onready var chat_box : VBoxContainer = get_node("CanvasLayer/Panel/HBoxContainer/ChatBox")
onready var player_packed : PackedScene = preload("res://Preloadable/characters/Player.tscn")
onready var character_packed : PackedScene = preload("res://Preloadable/characters/Character.tscn")


func _ready():
	chat_box.connect("player_spoke",self,"on_player_spoke")
	build_characters()
	
	NetworkManager.connect("new_presence",self,"build_character")
	build_player()
	
	yield(NetworkManager.join_chat_async(NetworkManager._current_map),"completed")
	NetworkManager.connect("pos_received",self,"on_new_pos_received")
	NetworkManager.connect("new_message_received",self,"on_new_message_received")
	NetworkManager.connect("player_reacted",self,"on_player_reacted")
	NetworkManager.connect("presences_disconnections",self,"on_presences_disconnections")
	

func _unhandled_input(event : InputEvent) -> void:
	if not event is InputEventMouseButton :
		return
	if event.button_index !=  BUTTON_LEFT or not event.pressed:
		return
		
	var new_path := nav2D.get_simple_path(player.global_position, get_global_mouse_position())
	player.path = new_path
	NetworkManager.send_position_update(get_global_mouse_position())
	
func on_player_spoke(text : String) :
	player.speak(text)

func on_emoji_clicked(index) -> void :
	player.react(index)


func build_player() -> void :
	var inst : Node2D = player_packed.instance()
	inst.set_up_design(NetworkManager._composite)
	inst.position = Vector2.ONE * 150
	player = inst
	add_child(inst)
	player.set_nametag(NetworkManager._user_name)

func build_character(id,composite, nickname) -> void :
	characters.id = id
	var inst =  character_packed.instance()
	add_child(inst)
	inst.position = Vector2.ONE * 150
	inst.set_up_design(composite)
	inst.set_nametag(nickname)
	characters[id]  =  inst


func build_characters() -> void :
	for id in NetworkManager._presences:
		characters.id = id
		var inst =  character_packed.instance()
		add_child(inst)
		inst.position = Vector2(NetworkManager._positions[id].x,NetworkManager._positions[id].y)
		inst.set_up_design(NetworkManager._composites[id])
		inst.set_nametag(NetworkManager._nicknames[id])
		characters[id]  =  inst
		
		
func on_new_pos_received(id , pos) :
	var new_path := nav2D.get_simple_path(characters[id].position, Vector2(pos.x,pos.y))
	characters[id].path = new_path

func on_new_message_received(id, username, message) -> void :
	if message.has("to") :
		if message.to == NetworkManager._user_name :
			chat_box.add_message(message.from,message.msg,1)
	
	else:
		for key in characters :
			if key == id :
				characters[id].speak(message.msg)
				chat_box.add_message(NetworkManager._nicknames[id],message.msg)

func on_player_reacted(id, num) :
	for key in  characters :
		if key == id :
			characters[id].react(num)

func on_presences_disconnections( leaves : Array) -> void :
	for id in leaves :
		characters[id].queue_free()
		characters.erase(id)
		
