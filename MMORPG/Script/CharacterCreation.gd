extends Node2D


onready var playButton = get_node("CanvasLayer/PlayButton")
onready var playButtonLabel : Label = get_node("CanvasLayer/PlayButton/PlayButtonLabel")
onready var playerPreview : Node2D = get_node("CanvasLayer/Player")


onready var forrest_map : PackedScene = preload("res://Scenes/forrest.tscn")

var players_loaded : bool = false
var my_presence_here : bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	playButton.connect("button_down",self,"on_play_button_down")
	playButton.connect("button_up",self,"on_play_button_up")
	playButton.connect("pressed",self,"on_play_button_pressed")
	NetworkManager.connect("previous_presences",self,"on_previous_presences_received")
	NetworkManager.connect("my_presence_notified",self,"on_my_presence_notified")
	
	playerPreview.setNameTag(NetworkManager._user_name)
	
func on_play_button_down() :
	playButtonLabel.modulate = Color.red

func on_play_button_up() :
	playButtonLabel.modulate = Color.whitesmoke

func on_play_button_pressed() :
	yield(NetworkManager.join_map("forrest"),"completed")
	NetworkManager.send_my_presence_info(playerPreview.getComposite(),NetworkManager._user_name)
	NetworkManager.send_previous_joined_presences()
	
func on_previous_presences_received() ->  void :
	players_loaded = true
	if my_presence_here :
		get_tree().change_scene_to(forrest_map)

func on_my_presence_notified() -> void :
	my_presence_here = true
	if players_loaded :
		get_tree().change_scene_to(forrest_map)
