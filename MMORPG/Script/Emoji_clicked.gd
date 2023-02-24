extends TextureButton

signal emoji_clicked(index)
onready var root_node = get_node("../../../../../..")

func _ready():
	connect("button_down",self,"on_clicked")
	connect("emoji_clicked",root_node,"on_emoji_clicked")

func on_clicked() -> void :
	emit_signal("emoji_clicked",get_index())
