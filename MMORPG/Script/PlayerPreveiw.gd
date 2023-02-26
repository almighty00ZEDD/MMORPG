extends Node2D

onready var body = $CompositeSprite/body
onready var hair = $CompositeSprite/hair
onready var accessory = $CompositeSprite/accessory
onready var shirt = $CompositeSprite/shirt
onready var pants = $CompositeSprite/pants

const composite_character = preload("res://Script/CompositeCharacter.gd")

var current_body : int = 0
var current_hair : int = 0
var current_accessory : int = 0
var current_shirt : int = 0
var current_pants : int = 0


func _ready():
	body.texture = composite_character.body_spritesheet[0]
	hair.texture = composite_character.hair_spritesheet[176]
	accessory.texture = composite_character.accessory_spritesheet[25]
	shirt.texture = composite_character.shirt_spritesheet[54]
	pants.texture = composite_character.pants_spritesheet[28]


func _on_previous_body_button_up():
	if current_body == 0 :
		current_body = composite_character.body_spritesheet.size() -1
	else :
		current_body = (current_body - 1) % composite_character.body_spritesheet.size()
		
	body.texture = composite_character.body_spritesheet[current_body]


func _on_next_body_button_up():
	current_body = (current_body + 1) % composite_character.body_spritesheet.size()
	body.texture = composite_character.body_spritesheet[current_body]


func _on_previous_hair_button_up():
	if current_hair == 0 :
	   current_hair = composite_character.hair_spritesheet.size() -1
	else :
	 current_hair = (current_hair - 1) % composite_character.hair_spritesheet.size()
	
	hair.texture = composite_character.hair_spritesheet[current_hair]


func _on_next_hair_button_up():
	current_hair = (current_hair + 1) % composite_character.hair_spritesheet.size()
	hair.texture = composite_character.hair_spritesheet[current_hair]


func _on_previous_acc_button_up():
	if current_accessory == 0 :
		current_accessory = composite_character.accessory_spritesheet.size() -1
	else :
		current_accessory = (current_accessory - 1) % composite_character.accessory_spritesheet.size()
	accessory.texture = composite_character.accessory_spritesheet[current_accessory]


func _on_next_acc_button_up():
	current_accessory = (current_accessory + 1) % composite_character.accessory_spritesheet.size()
	accessory.texture = composite_character.accessory_spritesheet[current_accessory]


func _on_previous_shirt_button_up():
	if current_shirt == 0 :
		current_shirt = composite_character.shirt_spritesheet.size() -1
	else :
		current_shirt = (current_shirt - 1) % composite_character.shirt_spritesheet.size()
	shirt.texture = composite_character.shirt_spritesheet[current_shirt]


func _on_next_shirt_button_up():
	current_shirt = (current_shirt + 1) % composite_character.shirt_spritesheet.size()
	shirt.texture = composite_character.shirt_spritesheet[current_shirt]


func _on_previous_pants_button_up():
	if current_pants == 0 :
		current_pants = composite_character.pants_spritesheet.size() -1
	else :
		current_pants = (current_pants - 1) % composite_character.pants_spritesheet.size()
	pants.texture = composite_character.pants_spritesheet[current_pants]


func _on_next_pants_button_up():
	current_pants = (current_pants + 1) % composite_character.pants_spritesheet.size()
	pants.texture = composite_character.pants_spritesheet[current_pants]
