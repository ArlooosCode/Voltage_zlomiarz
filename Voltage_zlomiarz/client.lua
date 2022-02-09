---------------------------
---      Złomiarz       ---
---------------------------

ESX                             = nil
local PlayerData                = {}
local JobBlips                  = {}
local drzwipaka                 = false
local siedzeniepaka             = false
local rowerpaka                 = false
local ubranie                   = false
local napisdrzwi                = false
local napissiedzenie            = false
local napisrama                 = false
local napiskasacja              = false
local napiswyplata              = false
local pojazdsluzbowy            = false
local roboczydelete             = false
local bossmenu                  = false
local vaultmenu                 = false
local garazprywatny23			= false
local wyplata23                 = false
local CzyJest                   = false
local Vehicles					= {}
local ubranierobocze			= false
local prop						= nil

CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShtestaredObjtestect', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end
	
	ESX.TriggerServerCallback('esx_vehiclekatalog:getVehicles', function (vehicles)
		Vehicles = vehicles
	end)
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
	blips()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	deleteBlips()
	blips()
end)

function deleteBlips()
	if JobBlips[1] ~= nil then
		for i=1, #JobBlips, 1 do
		RemoveBlip(JobBlips[i])
		JobBlips[i] = nil
		end
	end
end

CreateThread(function()		
	local blip = AddBlipForCoord(-421.65, -1711.06, 18.46)
	SetBlipSprite (blip, 380)
	SetBlipDisplay(blip, 4)
	SetBlipColour (blip, 21)
	SetBlipScale (blip, 1.0)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Złomowisko")
	EndTextCommandSetBlipName(blip)
end)

function blips()		
    if PlayerData.job ~= nil and PlayerData.job.name == 'zlomiarz' then
		for k,v in pairs(Config.szatnia)do
			if v.Type == 365 then
				local blip2 = AddBlipForCoord(v.Pos.x, v.Pos.y, v.Pos.z)

				SetBlipSprite (blip2, 366)
				SetBlipDisplay(blip2, 4)
				SetBlipScale  (blip2, 0.8)
				SetBlipColour (blip2, 1)
				SetBlipAsShortRange(blip2, true)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(v.Name)
				EndTextCommandSetBlipName(blip2)
				table.insert(JobBlips, blip2)
			end
		end

		for k,v in pairs(Config.drzwi)do
			if v.Type == 402 then
				local blip3 = AddBlipForCoord(v.Pos.x, v.Pos.y, v.Pos.z)

				SetBlipSprite (blip3, 402)
				SetBlipDisplay(blip3, 4)
				SetBlipScale  (blip3, 0.8)
				SetBlipColour (blip3, 73)
				SetBlipAsShortRange(blip3, true)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(v.Name)
				EndTextCommandSetBlipName(blip3)
				table.insert(JobBlips, blip3)
			end
		end

		for k,v in pairs(Config.siedzenie)do
			if v.Type == 402 then
				local blip4 = AddBlipForCoord(v.Pos.x, v.Pos.y, v.Pos.z)

				SetBlipSprite (blip4, 402)
				SetBlipDisplay(blip4, 4)
				SetBlipScale  (blip4, 0.8)
				SetBlipColour (blip4, 73)
				SetBlipAsShortRange(blip4, true)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(v.Name)
				EndTextCommandSetBlipName(blip4)
				table.insert(JobBlips, blip4)
			end
		end
		
		for k,v in pairs(Config.rower)do
			if v.Type == 402 then
				local blip4 = AddBlipForCoord(v.Pos.x, v.Pos.y, v.Pos.z)

				SetBlipSprite (blip4, 402)
				SetBlipDisplay(blip4, 4)
				SetBlipScale  (blip4, 0.8)
				SetBlipColour (blip4, 73)
				SetBlipAsShortRange(blip4, true)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(v.Name)
				EndTextCommandSetBlipName(blip4)
				table.insert(JobBlips, blip4)
			end
		end
		
		for k,v in pairs(Config.kasacja)do
			if v.Type == 365 then
				local blip4 = AddBlipForCoord(v.Pos.x, v.Pos.y, v.Pos.z)

				SetBlipSprite (blip4, 603)
				SetBlipDisplay(blip4, 4)
				SetBlipScale  (blip4, 0.8)
				SetBlipColour (blip4, 2)
				SetBlipAsShortRange(blip4, true)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(v.Name)
				EndTextCommandSetBlipName(blip4)
				table.insert(JobBlips, blip4)
			end
		end
		
		for k,v in pairs(Config.wyplata)do
			if v.Type == 365 then
				local blip4 = AddBlipForCoord(v.Pos.x, v.Pos.y, v.Pos.z)

				SetBlipSprite (blip4, 500)
				SetBlipDisplay(blip4, 4)
				SetBlipScale  (blip4, 0.8)
				SetBlipColour (blip4, 25)
				SetBlipAsShortRange(blip4, true)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(v.Name)
				EndTextCommandSetBlipName(blip4)
				table.insert(JobBlips, blip4)
			end
		end
	end
end

function szatnia()
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
		TriggerEvent('skinchanger:getSkin', function(skin)	
			if (skin.tshirt_1 == 24 and skin.torso_1 == 70 and skin.sex == 0) or (skin.tshirt_1 == 14 and skin.torso_1 == 230 and skin.sex == 1) then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					TriggerEvent('skinchanger:loadSkin', skin)
				end)	
				ubranierobocze = false
			else
				ubranierobocze = true
				if skin.sex == 0 then
					local clothesSkin = {
						['tshirt_1'] = 24, ['tshirt_2'] = 0,
						['torso_1'] = 70, ['torso_2'] = 0,
						['arms'] = 17, 
						['pants_1'] = 49, ['pants_2'] = 1,
						['helmet_1'] = 25,  ['helmet_2'] = 2,
						['shoes_1'] = 25, ['shoes_2'] = 0
					}
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)	
				else
					local clothesSkin = {
						['tshirt_1'] = 14, ['tshirt_2'] = 0,
						['torso_1'] = 230, ['torso_2'] = 20,
						['arms'] = 18, 
						['pants_1'] = 4, ['pants_2'] = 9,
						['helmet_1'] = 60,  ['helmet_2'] = 8,
						['shoes_1'] = 25, ['shoes_2'] = 0
					}
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)	
				end		
			end
		end)
	end)
end

function pobierzpojazdsluzbowy()
	local model = 'caddy3'
	autopozycja1 = {x = -508.53051757813, y = -1734.4255371094, z = 19.076944351196}
	autopozycja2 = {x = -508.53051757813, y = -1734.4255371094, z = 19.076944351196}
	if pojazdsluzbowy == false then
		ESX.TriggerServerCallback('esx_zlomiarz:getitemy', function (pieniadze, zlomdrzwi, zlomsiedzenie, zlomrower, zlomkarta)
			if pieniadze >= 100 then
				spawn = math.random(1, 2)
				if spawn == 1 then
					if ESX.Game.IsSpawnPointClear(autopozycja1, 6.0) then
						ESX.Game.SpawnVehicle(model, autopozycja1, 169.61, function(vehicle)
							TaskWarpPedIntoVehicle(Citizen.InvokeNative(0x43A66C31C68491C0, -1),  vehicle,  -1)
							local plate = 'ZLOM' .. math.random(100, 900)
							SetVehicleNumberPlateText(vehicle, plate)
							TriggerEvent("pNotify:SendNotification", {text = "Pojazd został pobrany<br>Pobrano 100$<br>Twoja firma zarobiła 100$"})
							TriggerServerEvent('esx_zlomiarz:pojazdroboczykasa', PlayerData.protect)
							TriggerEvent('ls:dodajklucze', GetVehicleNumberPlateText(vehicle))
							pojazdsluzbowy = true
							roboczydelete = true
						end)
					else
						TriggerEvent("pNotify:SendNotification", {text = "Miejsce poboru zajęte!"})
					end
				elseif spawn == 2 then
					if ESX.Game.IsSpawnPointClear(autopozycja2, 6.0) then
						ESX.Game.SpawnVehicle(model, autopozycja2, 349.26, function(vehicle)
							TaskWarpPedIntoVehicle(Citizen.InvokeNative(0x43A66C31C68491C0, -1),  vehicle,  -1)
							local plate = 'ZLOM' .. math.random(100, 900)
							SetVehicleNumberPlateText(vehicle, plate)
							TriggerEvent("pNotify:SendNotification", {text = "Pojazd został pobrany<br>Pobrano 100$<br>Twoja firma zarobiła 100$"})
							TriggerServerEvent('esx_zlomiarz:pojazdroboczykasa', PlayerData.protect)
							TriggerEvent('ls:dodajklucze', GetVehicleNumberPlateText(vehicle))
							pojazdsluzbowy = true
							roboczydelete = true
						end)
					else
						TriggerEvent("pNotify:SendNotification", {text = "Miejsce poboru zajęte!"})
					end
				end
			else
				TriggerEvent("pNotify:SendNotification", {text = "Masz niewystarczająco gotówki, aby pobrać pojazd służbowy (100$)"})
			end
		end)
	else
		TriggerEvent("pNotify:SendNotification", {text = "Niedawno pobrano pojazd służbowy!"})
	end
end

function zwrocpojazdsluzbowy()
	vehiclerobocze = GetVehiclePedIsIn(Citizen.InvokeNative(0x43A66C31C68491C0, -1), false)
	if (IsVehicleModel(vehiclerobocze, GetHashKey('caddy3'))) or (IsVehicleModel(vehiclerobocze, GetHashKey('bodhi2'))) or (IsVehicleModel(vehiclerobocze, GetHashKey('towtruck2'))) then
		ESX.Game.DeleteVehicle(vehiclerobocze)
		TriggerEvent("pNotify:SendNotification", {text = "Pojazd został zwrócony"})
		roboczydelete = false
	else
		TriggerEvent("pNotify:SendNotification", {text = "To nie jest pojazd służbowy!"})
	end
end

RegisterNetEvent('zlomiarz:freezePlayer')
AddEventHandler('zlomiarz:freezePlayer', function(freeze)
	FreezeEntityPosition(Citizen.InvokeNative(0x43A66C31C68491C0, -1), freeze)
end)

RegisterNetEvent('zlomiarz:freezeCar')
AddEventHandler('zlomiarz:freezeCar', function(freeze)
	vehicle = GetVehiclePedIsIn(Citizen.InvokeNative(0x43A66C31C68491C0, -1), false)
	FreezeEntityPosition(vehicle, freeze)
end)

CreateThread(function()
	RequestModel(GetHashKey('a_m_m_hillbilly_01'))
	while not HasModelLoaded(GetHashKey('a_m_m_hillbilly_01')) do
		Citizen.Wait(100)
	end
	local ped = Citizen.InvokeNative(0xD49F9B0955C367DE, 4, 0x6C9B2849, 2340.63, 3126.16, 47.21, 347.33, false, true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "CODE_HUMAN_MEDIC_TIME_OF_DEATH", 0, true)
end)

function animka2()
	local dict = "mini@repair"
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(10)
	end
	TaskPlayAnim(Citizen.InvokeNative(0x43A66C31C68491C0, -1), dict, "fixing_a_ped", 1.5, -8.0, 50000, 1, 0, false, false, false)
end

function animka3()
	local dict = "amb@world_human_cop_idles@male@idle_b"
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(10)
	end
	TaskPlayAnim(Citizen.InvokeNative(0x43A66C31C68491C0, -1), dict, "idle_e", 1.5, -8.0, 5000, 1, 0, false, false, false)
end

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(10)
	end
end

RegisterNetEvent('prop:drzwi')
AddEventHandler('prop:drzwi', function()
	local player = Citizen.InvokeNative(0x43A66C31C68491C0, -1)
	local coords = GetEntityCoords(player)
	RequestAnimDict('anim@heists@box_carry@')
	while not HasAnimDictLoaded('anim@heists@box_carry@') do
		Citizen.Wait(1)
	end	
				
	ESX.Game.SpawnObject('prop_car_door_01', {
		x = coords.x,
		y = coords.y,
		z = coords.z + 0.2
	}, function(object)
		AttachEntityToEntity(object, player, GetPedBoneIndex(player, 60309), 0.025, 0.00, 0.355, -75.0, 470.0, 0.0, true, true, false, true, 1, true)
		TaskPlayAnim(player, 'anim@heists@box_carry@', "idle", 3.0, -8, -1, 63, 0, 0, 0, 0)
		prop = {object = object, name = 'prop_car_door_01', anim = {lib = "anim@heists@box_carry@", anim = "idle"}}
	end)
end)

RegisterNetEvent('prop:siedzenie')
AddEventHandler('prop:siedzenie', function()
	local player = Citizen.InvokeNative(0x43A66C31C68491C0, -1)
	local coords = GetEntityCoords(player)
	RequestAnimDict('anim@heists@box_carry@')
	while not HasAnimDictLoaded('anim@heists@box_carry@') do
		Citizen.Wait(1)
	end	
				
	ESX.Game.SpawnObject('prop_car_seat', {
		x = coords.x,
		y = coords.y,
		z = coords.z + 0.2
	}, function(object)
		AttachEntityToEntity(object, player, GetPedBoneIndex(player, 60309), 0.025, 0.00, 0.355, -045.0, 480.0, 0.0, true, true, false, true, 1, true)
		TaskPlayAnim(player, 'anim@heists@box_carry@', "idle", 3.0, -8, -1, 63, 0, 0, 0, 0)
		prop = {object = object, name = 'prop_car_door_01', anim = {lib = "anim@heists@box_carry@", anim = "idle"}}
	end)
end)

RegisterNetEvent('prop:rower')
AddEventHandler('prop:rower', function()	
	local player = Citizen.InvokeNative(0x43A66C31C68491C0, -1)
	local coords = GetEntityCoords(player)
	RequestAnimDict('anim@heists@box_carry@')
	while not HasAnimDictLoaded('anim@heists@box_carry@') do
		Citizen.Wait(1)
	end	
				
	ESX.Game.SpawnObject('prop_rub_bike_02', {
		x = coords.x,
		y = coords.y,
		z = coords.z + 0.2
	}, function(object)
		AttachEntityToEntity(object, player, GetPedBoneIndex(player, 60309), 0.125, -0.50, 0.355, -045.0, 410.0, 0.0, true, true, false, true, 1, true)
		TaskPlayAnim(player, 'anim@heists@box_carry@', "idle", 3.0, -8, -1, 63, 0, 0, 0, 0)
		prop = {object = object, name = 'prop_car_door_01', anim = {lib = "anim@heists@box_carry@", anim = "idle"}}
	end)
end)
  
RegisterNetEvent('zlomiarz:drzwi')
AddEventHandler('zlomiarz:drzwi', function()
	napisdrzwi = true
	TriggerEvent('zlomiarz:freezePlayer', true)					
	animka2()					
	Wait(50000)
	TriggerEvent('prop:drzwi')
	drzwipaka = true
	TriggerEvent('zlomiarz:freezePlayer', false)
	ESX.ShowNotification('Wrzuć drzwi na pake pojazdu służbowego')
	Wait(2500)
	napisdrzwi = false
end)

RegisterNetEvent('zlomiarz:siedzenie')
AddEventHandler('zlomiarz:siedzenie', function()
	napissiedzenie = true
	TriggerEvent('zlomiarz:freezePlayer', true)
	animka2()					
	Wait(50000)
	TriggerEvent('prop:siedzenie')	
	siedzeniepaka = true
	TriggerEvent('zlomiarz:freezePlayer', false)
	ESX.ShowNotification('Wrzuć siedzenie na pake pojazdu służbowego')
	Wait(2500)
	napissiedzenie = false
end)

RegisterNetEvent('zlomiarz:rower')
AddEventHandler('zlomiarz:rower', function()
	napisrama = true
	TriggerEvent('zlomiarz:freezePlayer', true)
	animka2()
	Wait(50000)
	TriggerEvent('prop:rower')		
	rowerpaka = true
	TriggerEvent('zlomiarz:freezePlayer', false)
	ESX.ShowNotification('Wrzuć ramę na pake pojazdu służbowego')
	Wait(2500)
	napisrama = false
end)

RegisterNetEvent('zlomiarz:kasacja')
AddEventHandler('zlomiarz:kasacja', function()
	napiskasacja = true
	TriggerEvent('zlomiarz:freezeCar', true)
	Wait(10000)			
	TriggerEvent('zlomiarz:freezeCar', false)
	Wait(2500)
	napiskasacja = false
end)

RegisterNetEvent('zlomiarz:wyplata')
AddEventHandler('zlomiarz:wyplata', function()
	napiswyplata = true
	TriggerEvent('zlomiarz:freezePlayer', true)
	animka3()
	Wait(5000)					
	TriggerEvent('zlomiarz:freezePlayer', false)
	Wait(2500)
	napiswyplata = false
end)

function procent(time)
	TriggerEvent('zlomiarz:procenty')
	TimeLeft = 0
	repeat
	TimeLeft = TimeLeft + 1
	Citizen.Wait(time)
	until(TimeLeft == 100)
	CzyJest = false
end

RegisterNetEvent('zlomiarz:procenty')
AddEventHandler('zlomiarz:procenty', function()
	CzyJest = true
	while (CzyJest) do
		Citizen.Wait(8)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		DrawText3D(coords.x, coords.y, coords.z, '~b~'.. TimeLeft .. '%', 0.4)
	end
end)

kick = 600000
CreateThread(function()
	while true do
		Citizen.Wait(1000)
		work_truck = GetVehiclePedIsIn(Citizen.InvokeNative(0x43A66C31C68491C0, -1), true)
		pozycja = GetEntityCoords(work_truck, true)
			if roboczydelete == true then
				if pozycja == starapozycja then
					if time > 0 then
						time = time - 1
					else
						ESX.Game.DeleteVehicle(work_truck)
					end
				else
					time = kick
				end
				starapozycja = pozycja
			end
			
			if pojazdsluzbowy == true then
				Wait(600000)
				pojazdsluzbowy = false
			end
	end
end)

function startdrzwi()	
	ESX.TriggerServerCallback('esx_mrp:canCarryItem', function(can)
		if can then
			TriggerEvent('zlomiarz:drzwi')
			procent(475)	
			TriggerServerEvent('zlom_addItem', 'zlomdrzwi', 1, PlayerData.protect)
		else
			ESX.ShowNotification('Nie możesz więcej unieść')
		end
	end, 'zlomdrzwi', 1)
end

function startsiedzenie()
	ESX.TriggerServerCallback('esx_mrp:canCarryItem', function(can)
		if can then
			TriggerEvent('zlomiarz:siedzenie')
			procent(475)		
			TriggerServerEvent('zlom_addItem', 'zlomsiedzenie', 1, PlayerData.protect)
		else
			ESX.ShowNotification('Nie możesz więcej unieść')
		end
	end, 'zlomsiedzenie', 1)
end

function startrower()	
	ESX.TriggerServerCallback('esx_mrp:canCarryItem', function(can)
		if can then
			TriggerEvent('zlomiarz:rower')
			procent(475)		
			TriggerServerEvent('zlom_addItem', 'zlomrower', 1, PlayerData.protect)
		else
			ESX.ShowNotification('Nie możesz więcej unieść')
		end
	end, 'zlomrower', 1)
end

function startkasacja()
	ESX.TriggerServerCallback('esx_zlomiarz:getitemy', function (pieniadze, zlomdrzwi, zlomsiedzenie, zlomrower, zlomkarta)
		if zlomkarta <= 9 then
			if zlomdrzwi >= 1 then
				if zlomsiedzenie >= 1 then
					if zlomrower >= 1 then
						TriggerEvent('zlomiarz:kasacja')
						procent(95)
						TriggerServerEvent('zlom_addItem', 'zlomkartapracy', 1, PlayerData.protect)
						TriggerServerEvent('zlom_removeItem', 'zlomdrzwi', 1, PlayerData.protect)
						TriggerServerEvent('zlom_removeItem', 'zlomsiedzenie', 1, PlayerData.protect)
						TriggerServerEvent('zlom_removeItem', 'zlomrower', 1, PlayerData.protect)
						TriggerServerEvent('esx_zlomiarz:startkasacja', PlayerData.protect)
					else
						ESX.ShowNotification('Masz niewystarczająco ram!')
					end
				else
					ESX.ShowNotification('Masz niewystarczająco siedzeń!')
				end
			else
				ESX.ShowNotification('Masz niewystarczająco drzwi!')
			end
		else
			ESX.ShowNotification('Posiadasz już maksymalną ilość kart pracy!')
		end
	end)
end
	
CreateThread(function()
	local timer = GetGameTimer()
	while true do
		Citizen.Wait(7)
			
			local coords = GetEntityCoords(Citizen.InvokeNative(0x43A66C31C68491C0, -1))
			
			if PlayerData.job ~= nil and PlayerData.job.name == 'zlomiarz' then
				
				if #(coords - vec3(-529.23895263672, -1708.1192626953, 19.322757720947)) <= 10.0 and napiskasacja == false and ubranierobocze == true then		
					DrawMarker(27, -529.23895263672, -1708.1192626953, 19.322757720947 - 0.3, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.5, 2.5, 1.0, 0, 158, 189, 100, false, true, 2, false, false, false, false)
					if #(coords - vec3(-529.23895263672, -1708.1192626953, 19.322757720947)) <= 2.0 then	
						ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~rozpocząć ~s~kasację')
						ESX.ShowFloatingHelpNotification('~b~ KASACJA', vec3(-529.23895263672, -1708.1192626953, 19.322757720947))
						if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
							if IsPedInAnyVehicle(Citizen.InvokeNative(0x43A66C31C68491C0, -1), false) then
								startkasacja()
							else
								TriggerEvent("pNotify:SendNotification", {text = "Musisz być w pojeździe służbowym!"})
							end
							
							timer = GetGameTimer() + 1000
						end
					end
				end
				
				if IsPedInAnyVehicle(Citizen.InvokeNative(0x43A66C31C68491C0, -1), false) then
					if #(coords - vec3(-511.39758300781, -1736.8192138672, 19.216060638428)) <= 10.0 then	
						DrawMarker(27, -511.39758300781, -1736.8192138672, 19.216060638428 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 3.5, 3.5, 1.0, 0, 158, 189, 100, false, true, 2, false, false, false, false)
						if #(coords - vec3(-511.39758300781, -1736.8192138672, 19.216060638428)) <= 2.0 then	
							ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~schować ~s~pojazd')
							ESX.ShowFloatingHelpNotification('~b~ ZWROT POJAZDU', vec3(-511.39758300781, -1736.8192138672, 19.216060638428))
							if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
								zwrocpojazdsluzbowy()
								
								timer = GetGameTimer() + 500
							end
						end
					end
				end
				
				if not IsPedInAnyVehicle(Citizen.InvokeNative(0x43A66C31C68491C0, -1), false) then
				
					work_truck = GetVehiclePedIsIn(Citizen.InvokeNative(0x43A66C31C68491C0, -1), true)
					local trunk = GetWorldPositionOfEntityBone(work_truck, GetEntityBoneIndexByName(work_truck, "platelight"))
					plyCoords = GetEntityCoords(Citizen.InvokeNative(0x43A66C31C68491C0, -1), false)
					if drzwipaka == true or siedzeniepaka == true or rowerpaka == true then
						DrawMarker(27, trunk.x + 0.1, trunk.y + 0.3, trunk.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.0, 0, 158, 189, 100, false, true, 2, false, false, false, false)
						dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, trunk.x , trunk.y, trunk.z)
						if dist <= 1.0 then
							ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~odłożyć ~s~przedmiot')	
							ESX.ShowFloatingHelpNotification('~b~ ODŁÓŹ PRZEDMIOT', vec3(trunk.x , trunk.y, trunk.z))
							if IsControlJustReleased(0, 38) then
								if prop.name == 'prop_car_door_01' then
									DeleteObject(prop.object)
									prop = nil
									ClearPedSecondaryTask(PlayerPedId())
								elseif prop.name == 'prop_car_seat' then
									DeleteObject(prop.object)
									prop = nil
									ClearPedSecondaryTask(PlayerPedId())
								elseif prop.name == 'prop_rub_bike_02' then
									DeleteObject(prop.object)
									prop = nil
									ClearPedSecondaryTask(PlayerPedId())
								end
								
								drzwipaka = false
								siedzeniepaka = false
								rowerpaka = false
								-- timer = GetGameTimer() + 500
							end
						end
					end
				
					if #(coords - vec3(-448.73443603516, -1713.4832763672, 18.742935180664)) <= 10.0 and napisdrzwi == false and ubranierobocze == true then
						DrawMarker(1, -448.73443603516, -1713.4832763672, 18.742935180664 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.0, 0, 158, 189, 100, false, true, 2, false, false, false, false)
						if #(GetEntityCoords(Citizen.InvokeNative(0x43A66C31C68491C0, -1)) - vec3(-448.73443603516, -1713.4832763672, 18.742935180664)) <= 2.0 then
							ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~demontować ~s~drzwi')
							ESX.ShowFloatingHelpNotification('~b~ DEMONTAŻ DRZWI', vec3(-448.73443603516, -1713.4832763672, 18.742935180664))
							if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
								startdrzwi()
								
								timer = GetGameTimer() + 500
							end
						end
					end
				
				if #(coords - vec3(-515.78497314453, -1689.4056396484, 19.61589050293)) <= 10.0 and napissiedzenie == false and ubranierobocze == true then				
					DrawMarker(1, -515.78497314453, -1689.4056396484, 19.61589050293 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.0, 0, 158, 189, 100, false, true, 2, false, false, false, false)
					if #(coords - vec3(-515.78497314453, -1689.4056396484, 19.61589050293)) <= 2.0 then
						ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~demontować ~s~siedzenie')
						ESX.ShowFloatingHelpNotification('~b~ DEMONTAŻ SIEDZENIA', vec3(-515.78497314453, -1689.4056396484, 19.61589050293))
						if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
							startsiedzenie()
							
							timer = GetGameTimer() + 500
						end
					end
				end
				
				if #(coords - vec3(-419.23294067383, -1675.4240722656, 19.029066085815)) <= 10.0 and napisrama == false and ubranierobocze == true then			
					DrawMarker(1, -419.23294067383, -1675.4240722656, 19.029066085815 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.0, 0, 158, 189, 100, false, true, 2, false, false, false, false)
					if #(coords - vec3(-419.23294067383, -1675.4240722656, 19.029066085815)) <= 2.0 then	
						ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~demontować ~s~ramę')
						ESX.ShowFloatingHelpNotification('~b~ DEMONTAŻ RAM', vec3(-419.23294067383, -1675.4240722656, 19.029066085815))
						if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
							startrower()
							
							timer = GetGameTimer() + 500
						end
					end
				end
				
				if #(coords - vec3(-428.73474121094, -1728.5146484375, 19.7838306427)) <= 10.0 and napiswyplata == false and ubranierobocze == true then	
					DrawMarker(1, -428.73474121094, -1728.5146484375, 19.7838306427 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.0, 0, 158, 189, 100, false, true, 2, false, false, false, false)
					if #(coords - vec3(-428.73474121094, -1728.5146484375, 19.7838306427)) <= 2.0 then	
						ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~odebrać ~s~wypłatę')
						ESX.ShowFloatingHelpNotification('~b~ ODBIÓR WYPŁATY', vec3(-428.73474121094, -1728.5146484375, 19.7838306427))
						if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
							wyplata()	
							
							timer = GetGameTimer() + 500
						end
					end
				end
				
				if #(coords - vec3(-512.05187988281, -1747.814453125, 19.227495193481)) <= 10.0 then	
					DrawMarker(1, -512.05187988281, -1747.814453125, 19.227495193481 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.0, 0, 158, 189, 100, false, true, 2, false, false, false, false)
					if #(coords - vec3(-512.05187988281, -1747.814453125, 19.227495193481)) <= 2.0 then	
						ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~zmienić ~s~ubranie')
						ESX.ShowFloatingHelpNotification('~b~ SZATNIA', vec3(-512.05187988281, -1747.814453125, 19.227495193481))
						if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
							szatnia()

							timer = GetGameTimer() + 500
						end
					end
				end
				
				if #(coords - vec3(-512.94500732422, -1737.4622802734, 19.262674331665)) <= 10.0 then	
					DrawMarker(1, -512.94500732422, -1737.4622802734, 19.262674331665 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.0, 0, 158, 189, 100, false, true, 2, false, false, false, false)
					if #(coords - vec3(-512.94500732422, -1737.4622802734, 19.262674331665)) <= 2.0 then
						ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~wyciągnąć ~s~pojazd')
						ESX.ShowFloatingHelpNotification('~b~ GARAŻ', vec3(-512.94500732422, -1737.4622802734, 19.262674331665))
						if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
							if ubranierobocze == true then
								pobierzpojazdsluzbowy()
							else
								ESX.ShowNotification('Przebierz się w strój roboczy!')
							end
						end
					end
				end
				
				if PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name == 'zastepca' or PlayerData.job.grade_name == 'kierownik' then
					if #(coords - vec3(-510.47076416016, -1738.6795654297, 19.239345550537)) <= 10.0 then	
						DrawMarker(1, -510.47076416016, -1738.6795654297, 19.239345550537 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.0, 0, 158, 189, 100, false, true, 2, false, false, false, false)
						if #(coords - vec3(-510.47076416016, -1738.6795654297, 19.239345550537)) <= 2.0 then
							ESX.ShowFloatingHelpNotification('~b~ GARAŻ', vec3(-510.47076416016, -1738.6795654297, 19.239345550537))
							ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~otworzyć ~s~garaż')
							if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
								garazprywatny()
								
								timer = GetGameTimer() + 500
							end
						end
					end
				end
				
				if PlayerData.job.grade_name == 'boss' then
					if #(coords - vec3(-498.94012451172, -1714.0872802734, 19.89892578125)) <= 10.0 then	
						DrawMarker(1, -498.94012451172, -1714.0872802734, 19.89892578125 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.0, 0, 158, 189, 100, false, true, 2, false, false, false, false)
						if #(coords - vec3(-498.94012451172, -1714.0872802734, 19.89892578125)) <= 2.0 then
							ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~zarządzać ~s~firmą')
							ESX.ShowFloatingHelpNotification('~b~ BIURO', vec3(-498.94012451172, -1714.0872802734, 19.89892578125))
							if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
								bossmenu = true
								openbossmenuzlom()

								--[[TriggerEvent('esx_society:openBostestsMenu', 'zlomiarz', function(data, menu)
									menu.close()								
								end, opcje)]]
								
								timer = GetGameTimer() + 500
							end
						end
					end
				end
				
				if PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name == 'zastepca' or PlayerData.job.grade_name == 'kierownik' then
					if #(coords - vec3(-498.72512817383, -1717.0766601563, 19.526172637939)) <= 10.0 then	
						DrawMarker(1, -498.72512817383, -1717.0766601563, 19.526172637939 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.0, 0, 158, 189, 100, false, true, 2, false, false, false, false)
						if #(coords - vec3(-498.72512817383, -1717.0766601563, 19.526172637939)) <= 2.0 then	
								ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~otworzyć ~s~schowek')
								ESX.ShowFloatingHelpNotification('~b~ SCHOWEK', vec3(-498.72512817383, -1717.0766601563, 19.526172637939))
								if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
									vaultmenu = true
									OpenVaultMenu()
									
									timer = GetGameTimer() + 500
								end
							end
						end
					end
				end
				
				if #(coords - vec3(-498.94012451172, -1714.0872802734, 19.89892578125)) >= 2.0 then
					if bossmenu == true then
						ESX.UI.Menu.CloseAll()
						bossmenu = false
					end
				end
				
				if #(coords - vec3(-498.72512817383, -1717.0766601563, 19.526172637939)) >= 2.0 then
					if vaultmenu == true then
						ESX.UI.Menu.CloseAll()
						vaultmenu = false
					end
				end
				
				if #(coords - vec3(-428.73474121094, -1728.5146484375, 19.783830642)) >= 2.0 then	
					if wyplata23 == true then
						ESX.UI.Menu.CloseAll()
						wyplata23 = false
					end
				end
				
				if #(coords - vec3(-510.47076416016, -1738.6795654297, 19.239345550537)) >= 2.0 then	
					if garazprywatny23 == true then
						ESX.UI.Menu.CloseAll()
						garazprywatny23 = false
					end
				end
			
			end
		
	end
end)

function openbossmenuzlom()
	local elements = {
		{label = 'Zarządzanie Firmą', value = 'boss_actions'},
		{label = 'Lista Kursów', value = 'kursy_actions'}
	}


	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'zlomiarz',
	{
		title    = 'Złomiarz menu',
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)

		if data.current.value == 'put_stock' then
			OpenPutStocksMenu()
		elseif data.current.value == 'get_stock' then
			OpenGetStocksMenu()
		elseif data.current.value == 'boss_actions' then
			TriggerEvent('esx_society:openBostestsMenu', 'zlomiarz', function(data, menu)
				menu.close()
			end)
		elseif data.current.value == 'kursy_actions' then
			ESX.TriggerServerCallback('esx_zlomiarz:getEmployees', function(employees)
				local elements2 = {
					head = {'Imie i nazwisko', 'Stopień', 'Ilość kursów'},
					rows = {}
				}
				
				for i=1, #employees, 1 do
					local gradeLabel = (employees[i].job.grade_label == '' and employees[i].job.label or employees[i].job.grade_label)

					table.insert(elements2.rows, {
						data = employees[i],
						cols = {
							employees[i].name,
							gradeLabel,
							employees[i].kursy
						}
					})
				end
					
				ESX.UI.Menu.Open('list', GetCurrentResourceName(), 'employee_list_', elements2, function(data, menu)
					local employee = data.data
				end, function(data, menu)
					menu.close()
					openbossmenuzlom()
				end)
			end)
		end

	end, function(data, menu)
		menu.close()

		CurrentAction     = 'boss_actions'
		CurrentActionMsg  = _U('press_to_open')
		CurrentActionData = {}
	end)
end


function wyplata()

	wyplata23 = true
	
    local elements = {
      {label = 'Karta pracy [2300$/szt]', value = 'kartypracy'},
	  {label = 'Sprężyna [200$/szt]', value = 'sprezynasprzedaj'},
	  {label = 'Szczotki [300$/szt]', value = 'szczotkisprzedaj'},
	  {label = 'Żelazo [500$/szt]', value = 'zelazosprzedaj'}
    }
    
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'sprzedaz',
      {
        title    = "Kasa",
        align    = 'bottom-right',
        elements = elements,
      },
      function(data, menu)

        if data.current.value == 'kartypracy' then
	      menu.close()
		  ESX.TriggerServerCallback('esx_zlomiarz:getitemy', function (pieniadze, zlomdrzwi, zlomsiedzenie, zlomrower, zlomkarta)
			if zlomkarta >= 1 then
				TriggerServerEvent('esx_zlomiarz:startwyplata', PlayerData.protect)
				TriggerEvent('zlomiarz:wyplata')
				procent(48)
			else
				ESX.ShowNotification("Nie masz kart/y pracy!")
			end
		  end)
		end
		
		if data.current.value == 'sprezynasprzedaj' then
			menu.close()
			ESX.TriggerServerCallback('esx_zlomiarz:getitemyspecjalne', function (zlomzelazo, zlomszczotki, zlomsprezyna)
				if zlomsprezyna >= 1 then
					TriggerServerEvent('esx_zlomiarz:startsprezyna', PlayerData.protect)
					TriggerEvent('zlomiarz:wyplata')
					procent(48)
				else
					ESX.ShowNotification('Nie masz sprężyn/y')
				end
			end)
		end
		
		if data.current.value == 'szczotkisprzedaj' then
			menu.close()
			ESX.TriggerServerCallback('esx_zlomiarz:getitemyspecjalne', function (zlomzelazo, zlomszczotki, zlomsprezyna)
				if zlomszczotki >= 1 then
					TriggerServerEvent('esx_zlomiarz:startszczotki', PlayerData.protect)
					TriggerEvent('zlomiarz:wyplata')
					procent(48)
				else
					ESX.ShowNotification('Nie masz szczotki/ek!')
				end
			end)
		end
		
		if data.current.value == 'zelazosprzedaj' then
			menu.close()
			ESX.TriggerServerCallback('esx_zlomiarz:getitemyspecjalne', function (zlomzelazo, zlomszczotki, zlomsprezyna)
				if zlomzelazo >= 1 then
					TriggerServerEvent('esx_zlomiarz:startzelazo', PlayerData.protect)
					TriggerEvent('zlomiarz:wyplata')
					procent(48)
				else
					ESX.ShowNotification('Nie masz żelaza!')
				end
			end)
		end

		
      end,
      
      function(data, menu)

        menu.close()
      end
    )

end

function garazprywatny()

	garazprywatny23 = true
	
    local elements = {
      {label = "Bodhi", value = 'bodhi'},
	  {label = "Odholownik", value = 'odholownik'}
    }
    
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'garaz',
      {
        title    = "Graraż Prywatny",
        align    = 'bottom-right',
        elements = elements,
      },
      function(data, menu)

        if data.current.value == 'bodhi' then
	      menu.close()
          local model = 'bodhi2'
			autopozycjaprywatny = {x = -508.53051757813, y = -1734.4255371094, z = 19.076944351196}
			if ESX.Game.IsSpawnPointClear(autopozycjaprywatny, 6.0) then
				ESX.Game.SpawnVehicle(model, autopozycjaprywatny, 347.43, function(vehicle)
					TaskWarpPedIntoVehicle(Citizen.InvokeNative(0x43A66C31C68491C0, -1),  vehicle,  -1)
					TriggerEvent("pNotify:SendNotification", {text = "Pojazd został pobrany"})
				end)
			else
				TriggerEvent("pNotify:SendNotification", {text = "Miejsce poboru zajęte!"})
			end
		end
		
		if data.current.value == 'odholownik' then
			menu.close()
			local model = 'towtruck2'
			autopozycjaprywatny = {x = -508.53051757813, y = -1734.4255371094, z = 19.076944351196}
			if ESX.Game.IsSpawnPointClear(autopozycjaprywatny, 6.0) then
				ESX.Game.SpawnVehicle(model, autopozycjaprywatny, 347.43, function(vehicle)
					TaskWarpPedIntoVehicle(Citizen.InvokeNative(0x43A66C31C68491C0, -1),  vehicle,  -1)
					TriggerEvent("pNotify:SendNotification", {text = "Pojazd został pobrany"})
				end)
			else
				TriggerEvent("pNotify:SendNotification", {text = "Miejsce poboru zajęte!"})
			end
		end

		
      end,
      
      function(data, menu)

        menu.close()
      end
    )

end

function OpenVaultMenu()
	
    local elements = {
      {label = "Weź przedmiot", value = 'get_stock'},
      {label = "Włóź przedmiot", value = 'put_stock'}
    }
    

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'vault',
      {
        title    = "Sejf",
        align    = 'bottom-right',
        elements = elements,
      },
      function(data, menu)

        if data.current.value == 'put_stock' then
           OpenPutStocksMenu()
        end

        if data.current.value == 'get_stock' then
           OpenGetStocksMenu()
        end

      end,
      
      function(data, menu)

        menu.close()
      end
    )

end

function OpenPutStocksMenu()

	ESX.TriggerServerCallback('esx_zlomiarz:getPlayerInventory', function(inventory)
		local elements = {}

		if inventory.blackMoney > 0 then
			table.insert(elements, {
				label = "Brudne pieniądze: <span style='color: yellow;'>"..ESX.Math.GroupDigits(inventory.blackMoney).."$",
				type  = 'item_account',
				value = 'black_money'
			})
		end

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. ' x' .. item.count,
					type  = 'item_standard',
					value = item.name
				})
			end
		end

		for i=1, #inventory.weapons, 1 do
			local weapon = inventory.weapons[i]

			table.insert(elements, {
				label = weapon.label..' ['..weapon.ammo..']',
				type  = 'item_weapon',
				value = weapon.name,
				ammo  = weapon.ammo
			})
		end



		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = "Sejf",
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)

			if data.current.type == 'item_weapon' then
				menu.close()
				TriggerServerEvent('esx_zlomiarz:putStockItems', data.current.type, data.current.value, data.current.ammo, PlayerData.protect)

				ESX.SetTimeout(300, function()
					OpenPutStocksMenu()
				end)
			else
				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count', {
					title = "Ilość"
				}, function(data2, menu2)
					local count = tonumber(data2.value)

					if count == nil then
						ESX.ShowNotification("Nieprawidłowa ilość")
					else
						menu2.close()
						menu.close()
						TriggerServerEvent('esx_zlomiarz:putStockItems', data.current.type, data.current.value, count, PlayerData.protect)
						Citizen.Wait(500)
						OpenPutStocksMenu()
					end
				end, function(data2, menu2)
					menu2.close()
				end)
			end
		end, function(data, menu)
			menu.close()
		end)
	end)
end


function OpenGetStocksMenu()

	ESX.TriggerServerCallback('esx_zlomiarz:getStockItems', function(inventory)
		local elements = {}
		local menutitle = "Sejf"

		if inventory.blackMoney > 0 then
			table.insert(elements, {
				label = "Brudne pieniądze: <span style='color: yellow;'>"..ESX.Math.GroupDigits(inventory.blackMoney).."$",
				type = 'item_account',
				value = 'black_money'
			})
		end

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. ' x' .. item.count,
					type = 'item_standard',
					value = item.name
				})
			end
		end

		for i=1, #inventory.weapons, 1 do
			local weapon = inventory.weapons[i]

			table.insert(elements, {
				label = ESX.GetWeaponLabel(weapon.name)..' ['..weapon.ammo..']',
				type  = 'item_weapon',
				value = weapon.name,
				ammo  = weapon.ammo
			})
		end



		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = "Sejf",
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)

			if data.current.type == 'item_weapon' then
				menu.close()
				TriggerServerEvent('esx_zlomiarz:getStockItem', data.current.type, data.current.value, data.current.ammo, PlayerData.protect)
				ESX.SetTimeout(300, function()
					OpenGetStocksMenu()
				end)
			else
				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
					title = "Ilość"
				}, function(data2, menu2)
					local count = tonumber(data2.value)

					if count == nil then
						ESX.ShowNotification("Nieprawidłowa ilość")
					else
						menu2.close()
						menu.close()
						TriggerServerEvent('esx_zlomiarz:getStockItem', data.current.type, data.current.value, count, PlayerData.protect)
						Citizen.Wait(500)
						OpenGetStocksMenu()
					end
				end, function(data2, menu2)
					menu2.close()
				end)
			end
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function OpenChangingRoomMenu()

	ESX.TriggerServerCallback('esx_property:getPlayerDressing', function(dressing)
		local elements = {}

		for i=1, #dressing, 1 do
			table.insert(elements, {
				label = dressing[i],
				value = i
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_dressing',
		{
			title    = 'GARDEROBA',
			align    = 'bottom-right',
			elements = elements
		}, function(data2, menu2)

			TriggerEvent('skinchanger:getSkin', function(skin)
				ESX.TriggerServerCallback('esx_property:getPlayerOutfit', function(clothes)
					TriggerEvent('skinchanger:loadClothes', skin, clothes)
					TriggerEvent('esx_skin:setLastSkin', skin)

					TriggerEvent('skinchanger:getSkin', function(skin)
						TriggerServerEvent('esx_skin:save', skin)
					end)
				end, data2.current.value)
			end)

			end, function(data2, menu2)
				menu2.close()
		end)
	end)
end

function getPlayerVehicles(identifier)

	local vehicles = {}
	local data = MySQL.Sync.fetchAll("SELECT vehicle, id, plate FROM owned_vehicles WHERE owner=@identifier",{['@identifier'] = identifier})
	for _,v in pairs(data) do
		local vehicle = json.decode(v.vehicle)
		table.insert(vehicles, {id = v.id, plate = v.plate})
	end
	return vehicles
end

local zlomowanie = 2409.47, 3032.89, 48.15
CreateThread(function()
	local timer = GetGameTimer()
	while true do
		Citizen.Wait(10)
		if PlayerData.job ~= nil and PlayerData.job.name == 'zlomiarz' then
			if PlayerData.job.grade_name == 'boss' then
				if IsPedInAnyVehicle(Citizen.InvokeNative(0x43A66C31C68491C0, -1), false) then
					local coords = GetEntityCoords(Citizen.InvokeNative(0x43A66C31C68491C0, -1))
					if (GetDistanceBetweenCoords(coords, 2409.47, 3032.89, 48.15, true) < 15) then
						local PozycjaTekstu = {
							["x"] = 2409.47,
							["y"] = 3032.89,
							["z"] = 48.15
						}
						ESX.Game.Utils.DrawText3D(PozycjaTekstu, "NACIŚNIJ [~g~E~s~] ABY ZEZŁOMOWAĆ POJAZD~n~ZA ~b~30~s~% CENY SALONOWEJ", 1.0, 3.5, "~b~ZŁOMOWISKO", 1.2)
						if (GetDistanceBetweenCoords(coords, 2409.47, 3032.89, 48.15, true) < 3.5) then
							if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
								SprzedajZlomowisko()
								
								timer = GetGameTimer() + 500
							end
						end
					end
				end
			end
		end
	end
end)

function SprzedajZlomowisko()
	local pojazd = GetVehiclePedIsIn(Citizen.InvokeNative(0x43A66C31C68491C0, -1), false)
	local tablica = ESX.Math.Trim(GetVehicleNumberPlateText(pojazd))
	local posiada = false
	ESX.TriggerServerCallback('kuana:getVehicleszlom', function(vehicles)
		for _,v in pairs(vehicles) do
			local plate = v.plate
			local hashVehicule = v.vehicle.model
    		local model = GetDisplayNameFromVehicleModel(hashVehicule)
			if tablica == plate then
				posiada = true
				PotwierdzSprzedaz(tablica, model, pojazd)
				break
			end
		end
		if posiada == false then
			ESX.ShowNotification('Nie możesz zezłomować takiego pojazdu')
		end
	end)	
end

function PotwierdzSprzedaz(info, model, pojazd)
	TriggerEvent('pNotify:SendNotification', {text = 'Trwa złomowanie pojazdu o tablicach rejestracyjnych: '..info})
	local pojazd = GetVehiclePedIsIn(Citizen.InvokeNative(0x43A66C31C68491C0, -1), false)
	local modelPojazdu
	for i=1, #Vehicles, 1 do
		if GetHashKey(Vehicles[i].model) == GetEntityModel(pojazd) then
			modelPojazdu = Vehicles[i].model
			break
		end
	end
	TriggerServerEvent('route68zlomowisko:sprzedajpojazd', info, modelPojazdu, pojazd, PlayerData.protect)
end

RegisterNetEvent('route68zlomowisko:usunPojazd')
AddEventHandler('route68zlomowisko:usunPojazd', function(pojazd)
	TriggerEvent('esx:deleteVehicle', source)
end)

function DrawText3D(x, y, z, text, scale)
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
	SetTextScale(scale, scale)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextEntry("STRING")
	SetTextCentre(1)
	SetTextColour(255, 255, 255, 255)
	SetTextOutline()
	AddTextComponentString(text)
	DrawText(_x, _y)
	local factor = (string.len(text)) / 270
	--DrawRect(_x, _y + 0.015, 0.005 + factor, 0.03, 31, 31, 31, 155)
end