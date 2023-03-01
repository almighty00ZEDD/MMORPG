extends Node2D

const SPEED : = 70.0
var path : = PoolVector2Array() setget set_path
var nametag  : String = ""
var is_moving : bool

var  current_animation : String = ""
onready var animator : AnimationPlayer  = get_node("AnimationPlayer")
onready var chat_bubble : Node2D = get_node("SpeechBubble")
onready var nametag_label : Label = get_node("nametag")

#to delete
var ale = 1

func _ready() -> void:
	is_moving = false

func _process(delta : float) -> void:
	if is_moving :
		var move_distance = SPEED * delta
		move_along_path(move_distance)
		CompositeCharacter

#just to test the speech bubble
func _input(event):
	if not event is InputEventMouseButton :
		return
	if event.button_index !=  BUTTON_RIGHT or not event.pressed:
		return
	set_up_design([0,0,0,0,0])

func move_along_path(distance : float) -> void :
	var start_point : = position
	for i in range(path.size()):
		animate(position - path[0])
		var distance_to_next : = start_point.distance_to(path[0])
		if distance  <= distance_to_next and distance >= 0.0:
			position = start_point.linear_interpolate(path[0],distance / distance_to_next)
			break
			
		elif distance < 0.0:
			position = path[0]
			is_moving = false
			break
		
		distance -= distance_to_next
		start_point = path[0]
		path.remove(0)
		
		if(path.empty()):
			is_moving =  false
			idle()


func animate(direction : Vector2) -> void:
	var anim :  String = ""
	if abs(direction.x) > abs(direction.y):
		if direction.x < 0 :
			anim = "walk_right"
		if direction.x > 0 :
			anim = "walk_left"
	else :
		if direction.y > 0 :
			anim = "walk_up"
		if direction.y < 0 :
			anim = "walk_down"
		
	if not (animator.current_animation ==  anim):
		animator.play(anim)
	
func set_path(value : PoolVector2Array) -> void :
	path = value
	if value.size() == 0:
		return
	is_moving  = true
	
func idle() -> void :
	animator.stop(true)

	for sprite in $CompositeSprite.get_children():
		if typeof(sprite) == typeof(Sprite) :
			sprite.frame_coords =  Vector2.ZERO

func speak(speech : String) -> void:
	chat_bubble.show_bubble(speech)

func react(index :int) -> void:
	chat_bubble.show_emoji(index)
	NetworkManager.send_reaction(index)

#ajouter le paramètre qui comporte la composition du composite sprite
#donc à ramener de la BDD du serveur
func set_up_design(composites) -> void:
	
	$CompositeSprite/body.texture = CompositeCharacter.body_spritesheet[int(composites[0])]
	
	$CompositeSprite/hair.texture = CompositeCharacter.hair_spritesheet[int(composites[1])]
	
	$CompositeSprite/accessory.texture = CompositeCharacter.accessory_spritesheet[int(composites[2])]
	
	$CompositeSprite/shirt.texture = CompositeCharacter.shirt_spritesheet[int(composites[3])]
	
	$CompositeSprite/pants.texture = CompositeCharacter.pants_spritesheet[int(composites[4])]
	
func set_nametag(nametag : String) -> void :
	nametag_label.text = nametag
