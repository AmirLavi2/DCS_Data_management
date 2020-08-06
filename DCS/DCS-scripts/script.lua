function table.val_to_str(v)
  if "string" == type(v) then
    v = string.gsub(v, "\n", "\\n")
    if string.match(string.gsub(v, '[^\'"]', ""), '^"+$') then
      return "'" .. v .. "'"
    end
    return '"' .. string.gsub(v, '"', '\\"') .. '"'
  else
    return "table" == type(v) and table.tostring(v) or tostring(v)
  end
end

function table.key_to_str(k)
  if "string" == type(k) and string.match(k, "^[_%a][_%a%d]*$") then
    return k
  else
    return "[" .. table.val_to_str(k) .. "]"
  end
end

function table.tostring(tbl)
  local result, done = {}, {}
  for k, v in ipairs(tbl) do
    table.insert(result, table.val_to_str(v))
    done[k] = true
  end
  for k, v in pairs(tbl) do
    if not done[k] then
      table.insert(result, table.key_to_str(k) .. "=" .. table.val_to_str(v))
    end
  end
  return "{" .. table.concat(result, ",") .. "}"
end

function TableConcat(t1, t2)
  for i = 1, #t2 do
    t1[#t1 + i] = t2[i]
  end
  return t1
end

------------------------------------

-- simple UDP Server using Moose.lua

-- UDP socket
package.path = package.path .. ";.\\LuaSocket\\?.lua" .. ";.\\Scripts\\?.lua"
package.cpath = package.cpath .. ";.\\LuaSocket\\?.dll"
local socket = require("socket")
local JSON = loadfile("Scripts\\JSON.lua")()

-- variables
local UDPip = "127.0.0.1"
local UDPport = "9182"
local udp
local API = {}
local all = {}
env.info()
-- socket config
udp = socket.udp()
udp:settimeout(0)
udp:setpeername(UDPip, UDPport)

-- get client's data
function clientsList()
  -- get all clients name
  allClient = SET_CLIENT:New():FilterCoalitions("blue"):FilterStart()

  allClient:ForEachClient(
    function(client)
      -- if the slot is occupied
      if client:GetPlayerName() then
        local playerName = client:GetPlayerName()
        local callsign = client:GetCallsign()
        local ammo = client:GetAmmo()
        local fuel = client:GetFuel()
        local dcsObj = client:GetDCSObject()
        local grp = client:GetGroup()
        -- local rdrOn = client:GetRadar()
        -- local sens = client:GetSensors()
        local threatLvl = client:GetThreatLevel()
        local name = client:Name()
        -- local coord = client:GetCoordinate()
        local vec3 = client:GetPositionVec3()
        local heading = client:GetHeading()
        local categoryName = client:GetCategoryName()
        local test = grp:GetTemplate()
        -- local height = client:GetHeight()
        local radio = grp:GetRadio()
        local brif = client:ShowBriefing()
        local desc = grp:GetDCSDesc()
        local lat, lon, alt = coord.LOtoLL(vec3)

        API.playerName = playerName
        API.callsign = callsign
        API.fuel = fuel
        API.ammo = ammo
        -- API.dcsObj = dcsObj\\
        -- API.grp = grp
        -- API.rdrOn = rdrOn
        -- API.sens = sens
        -- API.threatLvl = threatLvl
        API.name = name
        -- API.vec3 = vec3
        API.lat = lat
        API.lon = lon
        API.alt = alt
        API.heading = heading
        -- API.radio = radio
        API.desc = desc.displayName

        -- env.info(table.tostring(grp))
        -- env.info(table.tostring(vec3))
        -- env.info(JSON:encode({vec3}))
        -- env.info(table.tostring(API))
        -- env.info(tostring(categoryName))
        -- env.info(JSON:encode({API}))
      -- env.info(table.tostring(API))
      -- env.info(JSON:encode({API}))
      -- env.info(JSON:encode({name, callsign, ammo, fuel}));

      -- udp:send(tostring(JSON:encode({'name: ' ..name, 'callsign: ' .. callsign, 'ammo: ' .. ammo, 'fuel: ' .. fuel})))

      -- env.info(table.tostring(brif))
      -- env.info(table.tostring(desc))

      -- for k, v in pairs(brif) do
      --   env.info(k, tostring(v) )
      -- end

      MESSAGE:New(API.playerName, 5):ToAll()
      udp:send(JSON:encode({API}))

      end
    end
  )


end

-- clientsList()

-- loop event every 10 seconds
mist.scheduleFunction(clientsList, {}, timer.getTime(), 10) -- init
