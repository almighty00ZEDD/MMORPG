extends Node2D

onready var nav2D  : Navigation2D = $Navigation2D

#la manipulation des joueurs se passe ici!!!
onready var player : Node2D = get_node("Player")
onready var chat_box : VBoxContainer = get_node("CanvasLayer/Panel/HBoxContainer/ChatBox")
	
func _ready():
	chat_box.connect("player_spoke",self,"on_player_spoke")

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
