extends Node

const KEY := "ZEDD_GAME"
var _session  : NakamaSession
var _client  := Nakama.create_client(KEY,"157.230.119.40",7350,"http") #modifier pour rendre compatible ac le nouveau serveur
var _socket : NakamaSocket
var _world_id = null #id de la map dans le serveur


var _presences := {}
var _nicknames := {}
var _composites := {}
var _positions  := {}

var _user_name : String 
var _composite : Array
var _current_map : String

signal previous_presences
signal presences_disconnections
signal new_presence(id,composite,nickname)


signal match_start(server_seed)
signal pos_received(id,pos)

#enumeration des differents codes de communication client  et serveur
enum OpCodes {
	PREVIOUS_PRESENCES = 1,
	NEW_PRESENCE,
	UPDATE_POSITION,
}


#authentification avec  id unique 
func authentificate_async(id) -> int:
	var result := OK
	var deviceid = OS.get_unique_id()
	
	#var test_session : NakamaSession = yield(_client.authenticate_device_async(deviceid,null,true),"completed")
	var test_session : NakamaSession = yield(_client.authenticate_custom_async(id + "nakama_playerww",null,true),"completed")
	if not test_session.is_exception():
		_session =  test_session
	return result
	
func connect_to_server_async() -> int:
	_socket = Nakama.create_socket_from(_client)
	var result :  NakamaAsyncResult = yield(_socket.connect_async(_session),"completed")
	if not result.is_exception():

		#warning-ignore: return_value_discarded
		_socket.connect("closed", self, "_on_NakamaSocket_closed")
		
		#warning-ignore: return_value_discarded
		_socket.connect("received_match_presence", self, "_on_NakamaSocket_received_match_presence")
	
		#warning-ignore: return_value_discarded
		_socket.connect("received_match_state", self, "_on_NakamaSocket_received_match_state")
		
		return OK
	return ERR_CANT_CONNECT

func _on_nakama_socket_closed() -> void:
	_socket = null

func join_map(map : String):
	
	_current_map = map
	
	var world :  NakamaAPI.ApiRpc = yield(_client.rpc_async(_session,"join_map",map),"completed")
	if not world.is_exception():
		_world_id = world.payload
	else:
		return("error world id  : %s  ---  exeption  :  %s" % [_world_id, world.get_exception().message])

	var match_join_result : NakamaRTAPI.Match  = yield(_socket.join_match_async(_world_id),"completed")
	if match_join_result.is_exception():
		var exception : NakamaException =  match_join_result.get_exception()
		return("Error joining the match :   %s -  %s"  % [exception.status_code, exception.message])
	else :
		return "OK"

func leave_map_async():
	var match_leave_result : NakamaAsyncResult =  yield(_socket.leave_match_async(_world_id),"completed")
	_world_id   =  null
	if match_leave_result.is_exception() :
		var exception : NakamaException =  match_leave_result.get_exception()
		return("Error joining the match :   %s -  %s"  % [exception.status_code, exception.message])


	
func _on_NakamaSocket_received_match_presence(new_presences: NakamaRTAPI.MatchPresenceEvent) -> void :
	
	for leave in new_presences.leaves:
		_presences.erase(leave.user_id)
		_nicknames.erase(leave.user_id)
		_composites.erase(leave.user_id)
	emit_signal("presences_disconnections")
	
	#ajouter les connections si possible ici
	
func _on_NakamaSocket_received_match_state(match_state: NakamaRTAPI.MatchData)  ->  void :
	
	var code := match_state.op_code
	var raw := match_state.data

	match code:
		
		OpCodes.PREVIOUS_PRESENCES:
			var decoded: Dictionary = JSON.parse(raw).result
			var presences: Dictionary = decoded.presences
			var nicknames :  Dictionary = decoded.nicknames
			#var composites : Dictionary = decoded.composites
			var positions : Dictionary = decoded.positions
			
			for id in presences.keys():
				if not (id ==  get_user_id()) :
					_presences[id]  = presences[id]
					_nicknames[id]  =  nicknames[id]
					var copy:  Array = decoded.composites[id]
					_composites[id] = []
					_composites[id].append_array(copy)
					_positions[id] = positions[id]
			
			emit_signal("previous_presences")

				
		OpCodes.NEW_PRESENCE:
			var decoded: Dictionary = JSON.parse(raw).result
			
			if(decoded.id == get_user_id()):
				_user_name = decoded.nickname
				_composite.append_array(decoded.composite)
			
			else :
				_nicknames[decoded.id] =  decoded.nickname
				_composites[decoded.id]  =  decoded.composite
				emit_signal("new_presence",decoded.id,decoded.composite,decoded.nickname)
				
			
		OpCodes.UPDATE_POSITION:
			var decoded: Dictionary = JSON.parse(raw).result
			
			if decoded.id == get_user_id() :
				return
			
			else :
				_positions[decoded.id] = decoded.pos
				emit_signal("pos_received",decoded.id,decoded.pos)

		
		
#reception des presences lors de  l'arrivee a la map	
func send_previous_joined_presences() -> void:
	if _socket:
		var payload := {}
		_socket.send_match_state_async(_world_id, OpCodes.PREVIOUS_PRESENCES, JSON.print(payload))

#envoi des informations de presence de son personnage
func send_my_presence_info(p_composite,p_nickname) -> void:
	if _socket:
		var payload := {id  =  get_user_id(), composite = p_composite, nickname = p_nickname}
		_socket.send_match_state_async(_world_id, OpCodes.NEW_PRESENCE, JSON.print(payload))


		
func send_position_update(position: Vector2) -> void:
	if _socket:
		var payload := {id = get_user_id(), pos = {x = position.x, y = position.y}}
		_socket.send_match_state_async(_world_id, OpCodes.UPDATE_POSITION, JSON.print(payload))


func get_user_id()  :
	return (_session.user_id)
	
func set_username(username : String) -> void :
	_user_name = username
