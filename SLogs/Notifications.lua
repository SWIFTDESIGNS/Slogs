
PerformHttpRequest(NL, function(err, text, headers) end, 'POST', json.encode({username = "SwiftNotifications", embeds = Notification1}), { ['Content-Type'] = 'application/json' })

RegisterServerEvent("LNotifications")
AddEventHandler("LNotifications", function(reason)
local NL = ""
local Script_name = "Swift Loadout"
local loadout1 = "Leo"
local player = GetPlayerName(source)
local Notification1 = {
    {
        ["color"] = "16776960",
        ["title"] = "Player Weapon Notifications",
        ["description"] = "Player: **"..player.."**\nWeapon Loadout Spawned: **"..loadout1.."**",
        ["footer"] = {
            ["text"] = Script_name,
        },
    }
}
PerformHttpRequest(NL, function(err, text, headers) end, 'POST', json.encode({username = "SwiftNotifications", embeds = Notification1}), { ['Content-Type'] = 'application/json' })
end)

RegisterServerEvent("FNotifications")
AddEventHandler("FNotifications", function(reason)
local NL = ""
local Script_name = "Swift Loadout"
local loadout1 = "Fire"
local player = GetPlayerName(source)
local Notification2 = {
    {
        ["color"] = "16776960",
        ["title"] = "Player Weapon Notifications",
        ["description"] = "Player: **"..player.."**\nWeapon Loadout Spawned: **"..loadout1.."**",
        ["footer"] = {
            ["text"] = Script_name,
        },
    }
}
PerformHttpRequest(NL, function(err, text, headers) end, 'POST', json.encode({username = "SwiftNotifications", embeds = Notification2}), { ['Content-Type'] = 'application/json' })
end)

RegisterServerEvent("HelpNotification")
AddEventHandler("HelpNotification", function()
    TriggerClientEvent("chatMessage",source,"^3[LoadoutHelp]^0Do /leo for a leo loadout, do /fire for a fire loadout")
end)
