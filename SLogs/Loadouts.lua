--Variables
local Script_name = "Server Loadout"
local player = GetPlayerName(PlayerId())

--Do not edit below unless you know what you are doing

RegisterCommand("wipe", function()
  RemoveAllPedWeapons(GetPlayerPed(-1), true)
  notify("~y~Cleared All Weapons")
end)

RegisterCommand("Leo", function(source, args, rawCommand)
local loadout1 = "Leo"

notify(Script_name.."\n~g~You have loaded the ~b~Leo ~g~Loadout")
print(player.." Loaded The ".. loadout1 .. " Loadout")  

	 giveWeapon("weapon_CombatPistol")
	 weaponComponent("weapon_CombatPistol","COMPONENT_AT_PI_FLSH")
	 giveWeapon("weapon_CarbineRifle")
	 weaponComponent("weapon_CarbineRifle","COMPONENT_AT_AR_FLSH")
	 giveWeapon("weapon_Flashlight")
	 giveWeapon("weapon_StunGun")
	 giveWeapon("weapon_PumpShotgun")
	 weaponComponent("weapon_PumpShotgun","COMPONENT_AT_AR_FLSH")
	 
	 TriggerServerEvent("LNotifications")
 end)

 RegisterCommand("Fire", function(source, args, rawCommand)
	local loadout2 = "Fire"
	
	notify(Script_name.."\n~g~You have loaded the ~r~Fire ~g~Loadout")
	print(player.." Loaded The ".. loadout2 .. " Loadout")  
		 giveWeapon("weapon_FireExtinguisher")
		 giveWeapon("weapon_Flashlight")
		 giveWeapon("weapon_Hatchet")
		 giveWeapon("weapon_Knife")
		 
		 TriggerServerEvent("FNotifications")
	 end)



	 --Functions
	function notify(msg)
		SetNotificationTextEntry("STRING")
		AddTextComponentString(msg)
		DrawNotification(true, false)
	end
	
	function giveWeapon(weaponHash)
		GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(weaponHash), 999, false, false --[[equips when gotten]])
	end
	
	function weaponComponent(weaponHash, component)
		if HasPedGotWeapon(GetPlayerPed(-1), GetHashKey(weaponHash), false) then
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey(weaponHash), GetHashKey(component))
		 end
	end
