extends VBoxContainer

onready var messages_displayer : RichTextLabel = get_node("MessagesDisplayer")
onready var line_edit : LineEdit = get_node("HBoxContainer/LineEdit")
onready var send_button : Button = get_node("HBoxContainer/Button")
signal player_spoke(message)

var groups = [
	{'name' : 'Map', 'color' : '#ffffff'},
	{'name' : 'Private', 'color' : '#002eff'},
	{'name' : 'Me', 'color' : '#52545e'}
]

var group_index : int  = 0
var username = "marocaine"

func _input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode  == KEY_ENTER:
			line_edit.grab_focus()

func _ready():
	line_edit.connect("text_entered",self,"on_text_entered")
	send_button.connect("button_down", self,"on_envoyer_pressed")

func add_message(from,text,group = 0) -> void :
	messages_displayer.bbcode_text += '[color=' + groups[group]['color'] +']'
	messages_displayer.bbcode_text += '[u]' + username + '[/u]' + ' : ' + text
	messages_displayer.bbcode_text += '[/color]'
	messages_displayer.bbcode_text += '\n'

func on_text_entered(text : String)  -> void:
	if text == "" or text.strip_edges() == "": 
		line_edit.text = ''
		return
		
	add_message(username, text, 2)
	emit_signal("player_spoke", text)
	line_edit.text = ''

func on_envoyer_pressed() -> void :
	var text = line_edit.text
	if text == "" or text.strip_edges() == "": 
		line_edit.text = ''
		return
		
	add_message(username, text, 2)
	emit_signal("player_spoke", text)
	line_edit.text = ''
