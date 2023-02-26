local nakama  =  require("nakama")

--stores the ids of the maps
local map_ids = {}

--registers the maps and gets their ids
local function load_maps()
  map_ids["forrest"] = nakama.match_create("map_logic",{name = "forrest"})
  map_ids["town"] = nakama.match_create("map_logic",{name = "town"})
  map_ids["blizzard"] = nakama.match_create("map_logic",{name = "blizzard"})  
end

--make the function load_maps only executes once
nakama.register_runonce(load_maps)


-- return the id of the map given it's name
local function join_map(_,payload)
 
 local map_id =  map_ids[payload.map_name] 
 return map_id

nakama.register_rpc(join_private_match,"join_map")

