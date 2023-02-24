extends Node2D

const MAX_LINE_LENGTH : int = 22

onready var emoji_sheet : Texture = preload("res://Sprites/Characters/emoticons.png") as Texture
onready var label : = $Label
onready var ninerect : = $Label/NinePatchRect
onready var timer : = $Timer
onready var emoji :  Sprite  = $Emoji
var do_close = false

func _ready():
	visible_emoji(false)
	visible_bubble(false)

func show_bubble(speech : String):
	speech = text_set_up(speech)
	label.text = speech
	visible_bubble(true)
	visible_emoji(false)
	timer.start(5)

func text_set_up(speech : String) -> String:
	if speech.length() < MAX_LINE_LENGTH:
		return speech

	var lines : int = speech.length() / MAX_LINE_LENGTH
	for i in lines :
		if MAX_LINE_LENGTH * (i+1) >= speech.length():
			break
		var ind = speech.find(" ", MAX_LINE_LENGTH * (i+1))
		if (not ind == -1):
			speech[ind] = "\n"
	
	return speech

func show_emoji(index : int) -> void :
	var x = 16 * (index % 5)
	var y = 16 * (index / 5)
	emoji.region_rect = Rect2(x,y,16,16)
	visible_emoji(true)
	visible_bubble(false)
	timer.start(3)
			
func _on_Timer_timeout():
	visible_bubble(false)
	visible_emoji(false)
	label.text = ""

func visible_emoji(boolean : bool) -> void :
	emoji.visible = boolean
	
func visible_bubble(boolean : bool) -> void :
	label.visible = boolean
	ninerect.visible = boolean
