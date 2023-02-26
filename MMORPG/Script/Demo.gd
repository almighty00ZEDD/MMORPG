extends Node2D

onready var nav2D  : Navigation2D = $Navigation2D

#la manipulation des joueurs se passe ici!!!
onready var player : Node2D = get_node("Player")
onready var chat_box : VBoxContainer = get_node("CanvasLayer/Panel/HBoxContainer/ChatBox")
onready var player_packed : PackedScene = preload("res://Preloadable/characters/Player.tscn")
	
func _ready():
	chat_box.connect("player_spoke",self,"on_player_spoke")
	build_character([3,9,5,12,3], "sakura")
	
	#server tests
	NetworkManager.connect("previous_presences",self,"load_existing_players")

func _unhandled_input(event : InputEvent) -> void:
	if not event is InputEventMouseButton :
		return
	if event.button_index !=  BUTTON_LEFT or not event.pressed:
		return
		
	var new_path := nav2D.get_simple_path(player.global_position, get_global_mouse_position())
	player.path = new_path
	
func on_player_spoke(text : String) :
	player.speak(text)

func on_emoji_clicked(index) -> void :
	player.react(index)

func build_character(composites,nametag) -> void :
	var inst : Node2D = player_packed.instance()
	inst.set_up_design(composites)
	inst.position = Vector2.ONE * 150
	player = inst
	add_child(inst)
	player.set_nametag(nametag)
	
func build_player(composites,nametag) -> void :
	var inst : Node2D = player_packed.instance()
	inst.set_up_design(composites)
	inst.position = Vector2.ONE * 150
	player = inst
	add_child(inst)
	player.set_nametag(nametag)


func load_existing_players() -> void :
	pass
