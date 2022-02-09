---------------------------
---      Złomiarz       ---
---------------------------

ESX = nil
local ImpoudTable = {}

TriggerEvent('esx:getShtestaredObjtestect', function(obj) ESX = obj end)

TriggerEvent('esx_society:registerSociety', 'zlomiarz', 'zlomiarz', 'society_zlom', 'society_zlom', 'society_zlom', {type = 'public'})

ESX.RegisterServerCallback('esx_zlomiarz:getitemy', function(source, cb)	
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local pieniadze = xPlayer.getMoney()
	local zlomdrzwi = xPlayer.getInventoryItem('zlomdrzwi').count 
	local zlomsiedzenie = xPlayer.getInventoryItem('zlomsiedzenie').count
	local zlomrower = xPlayer.getInventoryItem('zlomrower').count
	local zlomkarta = xPlayer.getInventoryItem('zlomkartapracy').count
	cb(pieniadze, zlomdrzwi, zlomsiedzenie, zlomrower, zlomkarta)
end)

ESX.RegisterServerCallback('esx_zlomiarz:getitemyspecjalne', function(source, cb)	
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local zlomzelazo = xPlayer.getInventoryItem('zlomzelazo').count 
	local zlomszczotki = xPlayer.getInventoryItem('zlomszczotki').count
	local zlomsprezyna = xPlayer.getInventoryItem('zlomsprezyna').count
	cb(zlomzelazo, zlomszczotki, zlomsprezyna)
end)

RegisterServerEvent('esx_zlomiarz:startsprezyna')
AddEventHandler('esx_zlomiarz:startsprezyna', function(detect)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.protect ~= detect then
		TriggerEvent('DAWIJMDAWIJD8945J09J9GEJG90JE5490', xPlayer.source, 'ban', 'Event Detect', GetCurrentResourceName())
		return
	end
	
	local zlomsprezyna = xPlayer.getInventoryItem('zlomsprezyna').count

	local pieniadze = math.floor(200 * zlomsprezyna)
	xPlayer.removeInventoryItem('zlomsprezyna', zlomsprezyna)
	xPlayer.addMoney(pieniadze)
	TriggerClientEvent("pNotify:SendNotification", _source, {
		text = 'Sprzedałeś x'..zlomsprezyna..' sprężyn za '..pieniadze..'$',
	})
	Wait(500)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_zlom', function(inventory)
		inventory.addItem('zlomsprezyna', zlomsprezyna)
	end)
end)

RegisterServerEvent('esx_zlomiarz:startszczotki')
AddEventHandler('esx_zlomiarz:startszczotki', function(detect)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.protect ~= detect then
		TriggerEvent('DAWIJMDAWIJD8945J09J9GEJG90JE5490', xPlayer.source, 'ban', 'Event Detect', GetCurrentResourceName())
		return
	end
	
	local zlomszczotki = xPlayer.getInventoryItem('zlomszczotki').count
	
	local pieniadze = math.floor(300 * zlomszczotki)
	xPlayer.removeInventoryItem('zlomszczotki', zlomszczotki)
	xPlayer.addMoney(pieniadze)
	TriggerClientEvent("pNotify:SendNotification", _source, {
		text = 'Sprzedałeś x'..zlomszczotki..' szczotek	za '..pieniadze..'$',
	})
	Wait(500)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_zlom', function(inventory)
		inventory.addItem('zlomszczotki', zlomszczotki)
	end)
end)

RegisterServerEvent('esx_zlomiarz:startzelazo')
AddEventHandler('esx_zlomiarz:startzelazo', function(detect)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.protect ~= detect then
		TriggerEvent('DAWIJMDAWIJD8945J09J9GEJG90JE5490', xPlayer.source, 'ban', 'Event Detect', GetCurrentResourceName())
		return
	end
	
	local zlomzelazo = xPlayer.getInventoryItem('zlomzelazo').count
	
	local pieniadze = math.floor(500 * zlomzelazo)
	xPlayer.removeInventoryItem('zlomzelazo', zlomzelazo)
	xPlayer.addMoney(pieniadze)
	TriggerClientEvent("pNotify:SendNotification", _source, {
		text = 'Sprzedałeś x'..zlomzelazo..' żelaza za '..pieniadze..'$',
	})
	Wait(500)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_zlom', function(inventory)
		inventory.addItem('zlomzelazo', zlomzelazo)
	end)
end)

RegisterServerEvent('esx_zlomiarz:pojazdroboczykasa')
AddEventHandler('esx_zlomiarz:pojazdroboczykasa', function(detect)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.protect ~= detect then
		TriggerEvent('DAWIJMDAWIJD8945J09J9GEJG90JE5490', xPlayer.source, 'ban', 'Event Detect', GetCurrentResourceName())
		return
	end
	
	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_zlom', function(account)
		societyAccount = account
	end)
	societyAccount.addMoney(100)
	xPlayer.removeMoney(100)
end)

RegisterServerEvent('zlom_addItem')
AddEventHandler('zlom_addItem', function(item, ilosc, detect)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.protect ~= detect then
		TriggerEvent('DAWIJMDAWIJD8945J09J9GEJG90JE5490', xPlayer.source, 'ban', 'Event Detect', GetCurrentResourceName())
		return
	end
	
	if xPlayer.canCarryItem(item, ilosc) then
		xPlayer.addInventoryItem(item, ilosc)
	else
		xPlayer.showNotification('Nie możesz więcej unieść')
	end
end)

RegisterServerEvent('zlom_removeItem')
AddEventHandler('zlom_removeItem', function(item, ilosc, detect)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.protect ~= detect then
		TriggerEvent('DAWIJMDAWIJD8945J09J9GEJG90JE5490', xPlayer.source, 'ban', 'Event Detect', GetCurrentResourceName())
		return
	end
	
	xPlayer.removeInventoryItem(item, ilosc)
end)

RegisterServerEvent('esx_zlomiarz:startkasacja')
AddEventHandler('esx_zlomiarz:startkasacja', function(detect)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.protect ~= detect then
		TriggerEvent('DAWIJMDAWIJD8945J09J9GEJG90JE5490', xPlayer.source, 'ban', 'Event Detect', GetCurrentResourceName())
		return
	end

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_zlom', function(inventory)
		inventory.addItem('zlomsprasowany', 3)
	end)
	
	losowankosociety = math.random(1, 100)
	if losowankosociety <= 5 then
		itemy = math.random(1, 3)
		if itemy == 1 then
			sprezynaile = math.random(1, 3)
			if xPlayer.canCarryItem('zlomsprezyna', sprezynaile) then
				xPlayer.addInventoryItem('zlomsprezyna', sprezynaile)
			else
				xPlayer.showNotification('Nie możesz więcej unieść')
			end
		elseif itemy == 2 then
			szczotkiile = math.random(1, 3)
			if xPlayer.canCarryItem('zlomszczotki', szczotkiile) then
				xPlayer.addInventoryItem('zlomszczotki', szczotkiile)
			else
				xPlayer.showNotification('Nie możesz więcej unieść')
			end
		else
			zelazoile = math.random(1, 3)
			if xPlayer.canCarryItem('zlomzelazo', zelazoile) then
				xPlayer.addInventoryItem('zlomzelazo', zelazoile)
			else
				xPlayer.showNotification('Nie możesz więcej unieść')
			end
		end
		losowankobutla = math.random(1, 3)
		TriggerEvent('esx_addoninventory:getSharedInventory', 'society_zlom', function(inventory)
			inventory.addItem('zlombutlagazowa', losowankobutla)
		end)
	end
end)

RegisterServerEvent('esx_zlomiarz:startwyplata')
AddEventHandler('esx_zlomiarz:startwyplata', function(detect)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.protect ~= detect then
		TriggerEvent('DAWIJMDAWIJD8945J09J9GEJG90JE5490', xPlayer.source, 'ban', 'Event Detect', GetCurrentResourceName())
		return
	end
	
	local zlomkarta = xPlayer.getInventoryItem('zlomkartapracy').count
	local societyAccount
	
	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_zlom', function(account)
		societyAccount = account
	end)

	local wyplata = math.floor(Config.wyplatakasa * zlomkarta)
	local wyplatafirma = math.floor(wyplata * Config.procent / 100)
	xPlayer.removeInventoryItem('zlomkartapracy', zlomkarta)
	
	MySQL.Async.fetchAll('SELECT zlomkursy FROM users WHERE identifier = @identifier',{
	['@identifier'] = xPlayer.identifier
	}, function(result)	
		if result[1] ~= nil then
			local wynik = result[1]
			local twojstarypijany = wynik.zlomkursy
			xPlayer.addMoney(wyplata)
			if twojstarypijany <= 149 then
				TriggerClientEvent("pNotify:SendNotification", _source, {
					text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 0<br>Otrzymałeś 0$ premii',
				})
			elseif twojstarypijany >= 150 and twojstarypijany <= 299 then
				TriggerClientEvent("pNotify:SendNotification", _source, {
					text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 1<br>Otrzymałeś 150$ premii',
				})
				xPlayer.addMoney(150)
			elseif twojstarypijany >= 300 and twojstarypijany <= 599 then
				TriggerClientEvent("pNotify:SendNotification", _source, {
					text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 2<br>Otrzymałeś 300$ premii',
				})
				xPlayer.addMoney(300)
			elseif twojstarypijany >= 600 and twojstarypijany <= 999 then
				TriggerClientEvent("pNotify:SendNotification", _source, {
					text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 3<br>Otrzymałeś 600$ premii',
				})
				xPlayer.addMoney(600)
			elseif twojstarypijany >= 1000 and twojstarypijany <= 1499 then
				TriggerClientEvent("pNotify:SendNotification", _source, {
					text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 4<br>Otrzymałeś 1000$ premii',
				})
				xPlayer.addMoney(1000)
			elseif twojstarypijany >= 1500 and twojstarypijany <= 2099 then
				TriggerClientEvent("pNotify:SendNotification", _source, {
					text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 5<br>Otrzymałeś 1500$ premii',
				})
				xPlayer.addMoney(1500)
			elseif twojstarypijany >= 2100 and twojstarypijany <= 2799 then
				TriggerClientEvent("pNotify:SendNotification", _source, {
					text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 6<br>Otrzymałeś 2100$ premii',
				})
				xPlayer.addMoney(2100)
			elseif twojstarypijany >= 2800 and twojstarypijany <= 3599 then
				TriggerClientEvent("pNotify:SendNotification", _source, {
					text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 7<br>Otrzymałeś 2800$ premii',
				})
				xPlayer.addMoney(2800)
			elseif twojstarypijany >= 3600 and twojstarypijany <= 4499 then
				TriggerClientEvent("pNotify:SendNotification", _source, {
					text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 8<br>Otrzymałeś 3600$ premii',
				})
				xPlayer.addMoney(3600)
			elseif twojstarypijany >= 4500 and twojstarypijany <= 5499 then
				TriggerClientEvent("pNotify:SendNotification", _source, {
					text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 9<br>Otrzymałeś 4500$ premii',
				})
				xPlayer.addMoney(4500)
			elseif twojstarypijany >= 5500 then
				TriggerClientEvent("pNotify:SendNotification", _source, {
					text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 10<br>Otrzymałeś 5500$ premii',
				})
				xPlayer.addMoney(5500)
			end
			
			Wait(500)
			
			MySQL.Async.execute('UPDATE users SET zlomkursy = @zlomkursy WHERE identifier = @identifier', {
				['@identifier'] = xPlayer.identifier,
				['@zlomkursy'] = twojstarypijany + zlomkarta
			})
		end
	end)
	
	Wait(100)
	
	societyAccount.addMoney(wyplatafirma)
end)

ESX.RegisterServerCallback('esx_zlomiarz:getStockItems', function(source, cb)
	local blackMoney = 0
	local items      = {}
	local weapons    = {}

	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_zlom_black', function(account)
		blackMoney = account.money
	end)

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_zlom', function(store)
		weapons = store.get('weapons')
		if weapons == nil then
			weapons = {}
		end
	end)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_zlom', function(inventory)
		for i=1, #inventory.items, 1 do
			if inventory.items[i].count > 0 then
				table.insert(items, inventory.items[i])
			end
		end	
	end)

	cb({
		blackMoney = blackMoney,
		items      = items,
		weapons    = weapons
	})
end)

RegisterServerEvent('esx_zlomiarz:getStockItem')
AddEventHandler('esx_zlomiarz:getStockItem', function(type, itemName, count, detect)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.protect ~= detect then
		TriggerEvent('DAWIJMDAWIJD8945J09J9GEJG90JE5490', xPlayer.source, 'ban', 'Event Detect', GetCurrentResourceName())
		return
	end

	if xPlayer ~= nil then
		if type == 'item_standard' then
			local sourceItem = xPlayer.getInventoryItem(item)
			TriggerEvent('esx_addoninventory:getSharedInventory', 'society_zlom', function(inventory)
				local item = inventory.getItem(itemName)
				local sourceItem = xPlayer.getInventoryItem(itemName)

				if count > 0 and item.count >= count then

					if xPlayer.canCarryItem(itemName, count) then
						inventory.removeItem(itemName, count)
						xPlayer.addInventoryItem(itemName, count)
						TriggerClientEvent('esx:showNotification', xPlayer.source, "Pobrałeś x"..count..' '..item.label)					
					else
						xPlayer.showNotification('Nie możesz więcej unieść')
					end
				else
					TriggerClientEvent('esx:showNotification', xPlayer.source, "Nieprawidłowa ilość")
				end
			end)

		elseif type == 'item_account' then

			TriggerEvent('esx_addonaccount:getSharedAccount', "society_zlom_black", function(account)
				local AccountMoney = account.money

				if AccountMoney >= count then
					account.removeMoney(count)
					xPlayer.addAccountMoney(itemName, count)
					--sendToDiscordzlomiarz('LSE | Playboy', xPlayer.name ..' wyciągnął z sejfu '.. itemName .. ' w ilości '.. count..'$' ,8421504)
				else
					TriggerClientEvent('esx:showNotification', _source, "Nieprawidłowa ilość")
				end
			end)

		elseif type == 'item_weapon' then

			TriggerEvent('esx_datastore:getSharedDataStore', 'society_zlom', function(store)
				local storeWeapons = store.get('weapons') or {}
				local weaponName   = nil
				local ammo         = nil

				if not xPlayer.hasWeapon(itemName) then
					for i=1, #storeWeapons, 1 do
						if storeWeapons[i].name == itemName then
							weaponName = storeWeapons[i].name
							ammo       = storeWeapons[i].ammo
							table.remove(storeWeapons, i)
							break
						end
					end
					store.set('weapons', storeWeapons)
					xPlayer.addWeapon(weaponName, ammo)
				else
					xPlayer.showNotification('Posiadasz już tą broń')
				end
				--sendToDiscordzlomiarz('LSE | Playboy', xPlayer.name ..' wyciągnął z sejfu '.. weaponName .. ' z ilością naboi '.. ammo ,16711680)
			end)
		end
	end
end)

RegisterServerEvent('esx_zlomiarz:putStockItems')
AddEventHandler('esx_zlomiarz:putStockItems', function(type, itemName, count, detect)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.protect ~= detect then
		TriggerEvent('DAWIJMDAWIJD8945J09J9GEJG90JE5490', xPlayer.source, 'ban', 'Event Detect', GetCurrentResourceName())
		return
	end
	
	if xPlayer ~= nil then
		if type == 'item_standard' then
			local playerItemCount = xPlayer.getInventoryItem(itemName).count

			TriggerEvent('esx_addoninventory:getSharedInventory', 'society_zlom', function(inventory)
				local item = inventory.getItem(itemName)
				local playerItemCount = xPlayer.getInventoryItem(itemName).count

				if item.count >= 0 and count <= playerItemCount then
					xPlayer.removeInventoryItem(itemName, count)
					inventory.addItem(itemName, count)
					--sendToDiscordzlomiarz('LSE | Playboy', xPlayer.name ..' zdeponował do sejfu '.. item.label .. ' w ilości '.. count ,16744192)
				else
					TriggerClientEvent('esx:showNotification', xPlayer.source, "Nieprawidłowa ilość")
				end
				TriggerClientEvent('esx:showNotification', xPlayer.source, "Schowałeś x"..count..' '..item.label)
			end)

		elseif type == 'item_account' then

			local playerAccountMoney = xPlayer.getAccount(itemName).money
			if playerAccountMoney >= count and count > 0 then
				xPlayer.removeAccountMoney(itemName, count)
				--sendToDiscordzlomiarz('LSE | Playboy', xPlayer.name ..' zdeponował do sejfu '.. itemName .. ' w ilości '.. count..'$',8421504)

				TriggerEvent('esx_addonaccount:getSharedAccount', "society_zlom_black", function(account)
					account.addMoney(count)
				end)
			else
				TriggerClientEvent('esx:showNotification', _source, "Nieprawidłowa ilość")
			end

		elseif type == 'item_weapon' then

			TriggerEvent('esx_datastore:getSharedDataStore', "society_zlom", function(store)
				local storeWeapons = store.get('weapons') or {}

				table.insert(storeWeapons, {
					name = itemName,
					ammo = count
				})

				store.set('weapons', storeWeapons)
				xPlayer.removeWeapon(itemName, count)
				--sendToDiscordzlomiarz('LSE | Playboy', xPlayer.name ..' zdeponował do sejfu '.. itemName .. ' z ilością naboi '.. count ,16711680)
			end)
		end
	end
end)

ESX.RegisterServerCallback('esx_zlomiarz:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer ~= nil then
		local blackMoney = xPlayer.getAccount('black_money').money
		local items      = xPlayer.inventory

		cb({
			blackMoney = blackMoney,
			items      = items,
			weapons    = xPlayer.getLoadout()
		})
	end
end)

ESX.RegisterServerCallback('esx_zlomiarzjob:getPlayerInventory2', function(source, cb)

  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  local items      = xPlayer.inventory

  cb({
    items      = items
  })

end)

ESX.RegisterServerCallback('kuana:getVehicleszlom', function(source, cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local vehicules = {}

	MySQL.Async.fetchAll("SELECT vehicle, state, plate FROM owned_vehicles WHERE owned_vehicles.plate NOT IN (SELECT plate from h_impounded_vehicles);",{
		['@identifier'] = xPlayer.identifier
	}, function(data)
		for _,v in pairs(data) do
			local vehicle = json.decode(v.vehicle)
			table.insert(vehicules, {vehicle = vehicle, state = v.state, plate = v.plate})
		end
		cb(vehicules)
	end)
end)

RegisterServerEvent('route68zlomowisko:sprzedajpojazd')
AddEventHandler('route68zlomowisko:sprzedajpojazd', function(plate, model, pojazd, detect)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.protect ~= detect then
		TriggerEvent('DAWIJMDAWIJD8945J09J9GEJG90JE5490', xPlayer.source, 'ban', 'Event Detect', GetCurrentResourceName())
		return
	end
	
	local cena = MySQL.Sync.fetchScalar("SELECT price FROM vehicles WHERE model = @model", {['@model'] = model})
	if tonumber(cena) == 99999999 then
		TriggerClientEvent('pNotify:SendNotification', _source, {text = "Nie możesz zezłomować tak unikalnego pojazdu!"})
	else
		local zaplata = math.floor(cena * 0.3)
		MySQL.Sync.execute("DELETE FROM owned_vehicles WHERE plate=@plate",{['@plate'] = plate})
		MySQL.Sync.execute("DELETE FROM owned_vehicles WHERE plate=@plate",{['@plate'] = plate})
		MySQL.Sync.execute("DELETE FROM owned_vehicles WHERE plate=@plate",{['@plate'] = plate})
		TriggerClientEvent('route68zlomowisko:usunPojazd', _source)
		xPlayer.addMoney(zaplata)
		TriggerClientEvent('pNotify:SendNotification', _source, {text = "Otrzymano $"..zaplata..' za zezłomowanie pojazdu '..plate..'.'})
	end	
end)