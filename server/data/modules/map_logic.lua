local map_logic  =  {}

local nakama = require("nakama")

local  nb_players = 0

-- Custom operation codes. Nakama specific codes are <= 0.
local OpCodes = {

    PREVIOUS_PRESENCES = 1,
    NEW_PRESENCE = 2,
    UPDATE_POSITION = 3,
    PLAYER_REACTED = 4,
}


function map_logic.match_init(context  ,params)
  local state  = {
    presences  =  {},
    nicknames  =  {},
    positions = {},
    composites = {},
  }
  local tick_rate =  10
  local label =  params.name
  return state,  tick_rate, label
end

function map_logic.match_join_attempt(context ,dispatcher, tick, state, presence, metadata)

  if state.presences[presence.user_id] ~= nil then
    return state, false,  "user  already logged in!"
  end

  return state, true
end

function  map_logic.match_join(context ,dispatcher, tick, state, presences)
  for _,presence in ipairs(presences)  do
    state.presences[presence.user_id]  =  presence

    state.positions[presence.user_id] = {
            ["x"] = 150,
            ["y"] = 150
        }
 
  end

  nb_players = nb_players + 1

  return state
end

function  map_logic.match_leave(context ,dispatcher, tick, state, presences)
  for _,presence in ipairs(presences)  do
    state.nicknames[presence.user_id] = nil
    state.presences[presence.user_id]  =  nil
    state.positions[presence.user_id]  =  nil
    state.composites[presence.user_id] = nil
  end

  nb_players = nb_players - 1

  return state
end

function map_logic.match_loop(context,  dispatcher, tick, state,  messages)

  for _, message in ipairs(messages) do
        local op_code = message.op_code
        local decoded = nakama.json_decode(message.data)

        if op_code == OpCodes.PREVIOUS_PRESENCES then
            local encoded = encode_previous_presences(state)
            dispatcher.broadcast_message(OpCodes.PREVIOUS_PRESENCES, encoded, {message.sender})
        end

        if op_code == OpCodes.NEW_PRESENCE then
          local encoded  = encode_new_presence(state,decoded)
	  state.nicknames[decoded.id] = decoded.nickname
	  state.composites[decoded.id] = decoded.composite
          dispatcher.broadcast_message(OpCodes.NEW_PRESENCE,encoded)
        end

        if op_code == OpCodes.UPDATE_POSITION then
          local encoded = update_position(state,decoded)
          dispatcher.broadcast_message(OpCodes.UPDATE_POSITION,encoded)
        end

	if op_code == OpCodes.PLAYER_REACTED then
	  local encoded = diffuse(decoded)
	  dispatcher.broadcast_message(OpCodes.PLAYER_REACTED,encoded)
        end
        
      end

  return state
end

function map_logic.match_terminate(context,  dispatcher, tick, state,  grace_seconds)
  return state
end


function map_logic.match_signal(context, dispatcher, tick, state, data)
  return state, data
end



-- additional fonctions for "clean code" matters



function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

--makes a "ready to send"  json which contains the informations of the active players in this match
function encode_previous_presences(state)

  local data = {
        ["presences"] = state.presences,
        ["nicknames"] = state.nicknames,
        ["positions"] = state.positions,
        ["composites"] = state.composites,
    }

    return nakama.json_encode(data)

end

--makes a "ready to send" json containing the informations on the new player who joined
function encode_new_presence(state,decoded)

  local _id = decoded.id

  local data = {
        composite  = decoded.composite,
        nickname = decoded.nickname,
        id = _id,
    }

  return nakama.json_encode(data)

end

--updates the positions server side then broacast them to everyone
function update_position(state,decoded)
  state.positions[decoded.id] = decoded.pos
  
  local data = {
       id = decoded.id,
       pos = decoded.pos,
   }

  return  nakama.json_encode(data)

end

--less frequent messages from the client designed to only be relayed to the others without
--any alteration on the server
function diffuse(decoded)
  return nakama.json_encode(decoded)
end

--[==[
--]==]

return map_logic

