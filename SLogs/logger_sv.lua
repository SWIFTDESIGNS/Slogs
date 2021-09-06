--Main WebHook
local logs = ""
--Misc Notification Webhook
local NL = ""
local STEAM_KEY = "" -- add your own steam api key
--Script Details--Pls do not change
local ScriptName = "Swift Logs"

--Your Server Name 
local Sever_Name = "Testing"

PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = "SwiftSecurity", embeds = connect}), { ['Content-Type'] = 'application/json' })

print("^7============SwiftLogs=================")
print("^6Latest Version:^71.1.0")
print("^6Maker:^7Swift Designs")
print("^7==============Active==================")

print("^7============SwiftLoadout==============")
print("^3Latest Version:^71.2.0")
print("^3Loadouts:^72")
print("^7==============Active==================")

AddEventHandler('playerConnecting', function(reason)
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local Sever_Name = "Testing"
local connect = {
        {
            ["color"] = "8663711",
            ["title"] = "Player Connected to Testing",
            ["description"] = "Player: **"..name.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**\n Ping: **"..ping.."**",
	        ["footer"] = {
                ["text"] = ScriptName,
            },
        }
    }

    PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = "SwiftSecurity", embeds = connect}), { ['Content-Type'] = 'application/json' })
end)

AddEventHandler('playerDropped', function(reason)
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local disconnect = {
        {
            ["color"] = "8663711",
            ["title"] = "Player Disconnected from Server #1",
            ["description"] = "Player: **"..name.."** \nReason: **"..reason.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**\n Ping: **"..ping.."**",
	        ["footer"] = {
                ["text"] = ScriptName,
            },
        }
    }
	
    PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = "SwiftSecurity", embeds = disconnect}), { ['Content-Type'] = 'application/json' })
end)


AddEventHandler('chatMessage', function(source, name, message) 

	if string.match(message, "@everyone") then
		message = message:gsub("@everyone", "`@everyone`")
    end
    if string.match(message, "leo") then
		message = message:gsub("leo", "`leo`")
    end
    if string.match(message, "") then
		message = message:gsub("", " ")
	end
	if string.match(message, "@here") then
		message = message:gsub("@here", "`@here`")
    end
    
	if STEAM_KEY == '' or STEAM_KEY == nil then
        PerformHttpRequest(NL, function(err, text, headers) end, 'POST', json.encode({username = name .. " [" .. source .. "]", content = message, tts = false}), { ['Content-Type'] = 'application/json' })
	else
		PerformHttpRequest('https://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=' .. STEAM_KEY .. '&steamids=' .. tonumber(GetIDFromSource('steam', source), 16), function(err, text, headers)
			local image = string.match(text, '"avatarfull":"(.-)","')
            PerformHttpRequest(NL, function(err, text, headers) end, 'POST', json.encode({username = name .. " [" .. source .. "]", content = message, tts = false}), { ['Content-Type'] = 'application/json' })
		end)
	end
end)

function GetIDFromSource(Type, ID) --(Thanks To WolfKnight [forum.FiveM.net])
    local IDs = GetPlayerIdentifiers(ID)
    for k, CurrentID in pairs(IDs) do
        local ID = stringsplit(CurrentID, ':')
        if (ID[1]:lower() == string.lower(Type)) then
            return ID[2]:lower()
        end
    end
    return nil
end


function stringsplit(input, seperator)
	if seperator == nil then
		seperator = '%s'
	end
	
	local t={} ; i=1
	
	for str in string.gmatch(input, '([^'..seperator..']+)') do
		t[i] = str
		i = i + 1
	end
	
	return t
end








