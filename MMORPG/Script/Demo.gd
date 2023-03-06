extends Node2D

onready var nav2D  : Navigation2D = $Navigation2D

#la manipulation des joueurs se passe ici!!!
onready var player
onready var characters : Dictionary
onready var chat_box : VBoxContainer = get_node("CanvasLayer/Panel/HBoxContainer/ChatBox")
onready var player_packed : PackedScene = preload("res://Preloadable/characters/Player.tscn")
onready var character_packed : PackedScene = preload("res://Preloadable/characters/Character.tscn")
onready var camLimits :  Position2D = get_node("camLimits")

onready var btn1 : Button = get_node("CanvasLayer/Panel/HBoxContainer/VBoxContainer/Button")
onready var btn2 : Button = get_node("CanvasLayer/Panel/HBoxContainer/VBoxContainer/Button2")

var where_to : PackedScene 

var prev_pres : bool = false
var my_pres : bool = false

func _ready():
	
	btn1.connect("pressed",self,"on_btn1_pressed")
	btn2.connect("pressed",self,"on_btn2_pressed")
	
	chat_box.connect("player_spoke",self,"on_player_spoke")
	build_characters()
	
	NetworkManager.connect("new_presence",self,"build_character")
	build_player()
	
	yield(NetworkManager.join_chat_async(NetworkManager._current_map),"completed")
	NetworkManager.connect("pos_received",self,"on_new_pos_received")
	NetworkManager.connect("new_message_received",self,"on_new_message_received")
	NetworkManager.connect("player_reacted",self,"on_player_reacted")
	NetworkManager.connect("presences_disconnections",self,"on_presences_disconnections")
	
	NetworkManager.connect("previous_presences",self,"on_previous_presences")
	NetworkManager.connect("my_presence_notified",self,"on_my_presence_notified")
	

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
	player.render(camLimits.position.x, camLimits.position.y)

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
		
func on_btn1_pressed() -> void :
	match btn1.text :
		"WINTER" : 
			where_to = CompositeCharacter.winter
			yield(NetworkManager.join_map("blizzard"),"completed")
			NetworkManager.send_previous_joined_presences()
			NetworkManager.send_my_presence_info(NetworkManager._composite,NetworkManager._user_name)
		
		"FORREST" :
			where_to = CompositeCharacter.forrest
			yield(NetworkManager.join_map("forrest"),"completed")
			NetworkManager.send_previous_joined_presences()
			NetworkManager.send_my_presence_info(NetworkManager._composite,NetworkManager._user_name) 
		
		"Bar" : 
			where_to = CompositeCharacter.Bar
			yield(NetworkManager.join_map("town"),"completed")
			NetworkManager.send_previous_joined_presences()
			NetworkManager.send_my_presence_info(NetworkManager._composite,NetworkManager._user_name)
			
func on_btn2_pressed() -> void :
	match btn2.text :
		"WINTER" : 
			where_to = CompositeCharacter.winter
			yield(NetworkManager.join_map("blizzard"),"completed")
			NetworkManager.send_previous_joined_presences()
			NetworkManager.send_my_presence_info(NetworkManager._composite,NetworkManager._user_name)
		
		"FORREST" :
			where_to = CompositeCharacter.forrest
			yield(NetworkManager.join_map("forrest"),"completed")
			NetworkManager.send_previous_joined_presences()
			NetworkManager.send_my_presence_info(NetworkManager._composite,NetworkManager._user_name) 
		
		"Bar" : 
			where_to = CompositeCharacter.Bar
			yield(NetworkManager.join_map("town"),"completed")
			NetworkManager.send_previous_joined_presences()
			NetworkManager.send_my_presence_info(NetworkManager._composite,NetworkManager._user_name)
			

func on_previous_presences() -> void :
	prev_pres = true
	if my_pres :
		get_tree().change_scene_to(where_to)
	
func on_my_presence_notified() -> void :
	my_pres = true
	if prev_pres :
		get_tree().change_scene_to(where_to)
