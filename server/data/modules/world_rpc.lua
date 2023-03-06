local nakama  =  require("nakama")

--stores the ids of the maps
local map_ids = {}

--registers the maps and gets their ids
function load_maps()
  map_ids["forrest"] = nakama.match_create("map_logic",{name = "forrest"})
  map_ids["town"] = nakama.match_create("map_logic",{name = "town"})
  map_ids["blizzard"] = nakama.match_create("map_logic",{name = "blizzard"})  
end

--make the function load_maps only execute once
load_maps()


-- return the id of the map given it's name
local function join_map(_,payload)
 
 local map_id =  map_ids[payload] 
 return map_id
end

nakama.register_rpc(join_map,"join_map")
