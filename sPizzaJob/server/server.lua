TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_phone:registerNumber', 'pizza', 'alerte pizza', true, true)

TriggerEvent('esx_society:registerSociety', 'pizza', 'pizza', 'society_pizza', 'society_pizza', 'society_pizza', {type = 'public'})

RegisterServerEvent('Ouvre:pizzas')
AddEventHandler('Ouvre:pizzas', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Pizza', '~p~Annonce', 'Le Pizza est désormais ~g~Ouvert~s~!', 'CHAR_GANGAPP', 8)
	end
end)

RegisterServerEvent('Ferme:pizzas')
AddEventHandler('Ferme:pizzas', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Pizza', '~p~Annonce', 'Le Pizza est désormais ~r~Fermer~s~!', 'CHAR_GANGAPP', 8)
	end
end)

RegisterServerEvent('Recru:pizzas')
AddEventHandler('Recru:pizzas', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Pizza', '~g~Annonce', '~y~Recrutement en cours, rendez-vous a Pizza !', 'CHAR_GANGAPP', 8)
	end
end)

RegisterServerEvent('Giga:pizzas')
AddEventHandler('Giga:pizzas', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Pizza', '~g~Annonce', '~y~Vous savez quels jours sommes nous ? MARDI ! aujourd\'hui journée exclusive! journée giga pizza !', 'CHAR_GANGAPP', 8)
	end
end)

RegisterServerEvent('esx_pizzajob:prendreitems')
AddEventHandler('esx_pizzajob:prendreitems', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pizza', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		-- is there enough in the society?
		if count > 0 and inventoryItem.count >= count then

			-- can the player carry the said amount of x item?
			if sourceItem.limit ~= -1 and (sourceItem.count + count) > sourceItem.limit then
				TriggerClientEvent('esx:showNotification', _source, "quantité invalide")
			else
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				TriggerClientEvent('esx:showNotification', _source, 'Objet retiré', count, inventoryItem.label)
			end
		else
			TriggerClientEvent('esx:showNotification', _source, "quantité invalide")
		end
	end)
end)


RegisterNetEvent('esx_pizzajob:stockitem')
AddEventHandler('esx_pizzajob:stockitem', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pizza', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		-- does the player have enough of the item?
		if sourceItem.count >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('esx:showNotification', _source, "Objet déposé "..count..""..inventoryItem.label.."")
		else
			TriggerClientEvent('esx:showNotification', _source, "quantité invalide")
		end
	end)
end)

RegisterNetEvent('aurezia:Buypizzafroid2')
AddEventHandler('aurezia:Buypizzafroid2', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 750
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_pizza', function(account)
        societyAccount = account
        end)
        xPlayer.removeMoney(price)
        societyAccount.addMoney (price)
        xPlayer.addInventoryItem('pizzafroid2', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('aurezia:Buypizzafroid3')
AddEventHandler('aurezia:Buypizzafroid3', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 620
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_pizza', function(account)
        societyAccount = account
        end)
        xPlayer.removeMoney(price)
        societyAccount.addMoney (price)
        xPlayer.addInventoryItem('vingtpizzafroid3', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)


ESX.RegisterServerCallback('esx_pizzajob:inventairejoueur', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

	cb({items = items})
end)

ESX.RegisterServerCallback('esx_pizzajob:prendreitem', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pizza', function(inventory)
		cb(inventory.items)
	end)
end)


RegisterNetEvent('aurezia:Buypizzafroid2')
AddEventHandler('aurezia:Buypizzafroid2', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 25
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('pizzafroid2', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('aurezia:Buypizzafroid3')
AddEventHandler('aurezia:Buypizzafroid3', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 20
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('pizzafroid3', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('aurezia:Buypizzafroidxll')
AddEventHandler('aurezia:Buypizzafroidxll', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 20
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('pizzafroidxll', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('aurezia:Buypetitefroidfrite')
AddEventHandler('aurezia:Buypetitefroidfrite', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 14
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('petitefroidfrite', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('aurezia:Buymoyennefroidfrite')
AddEventHandler('aurezia:Buymoyennefroidfrite', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 14
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('moyennefroidfrite', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('aurezia:Buygrandefroidfrite')
AddEventHandler('aurezia:Buygrandefroidfrite', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 8
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('grandefroidfrite', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('aurezia:Buysundaynature')
AddEventHandler('aurezia:Buysundaynature', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 8
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('sundaynature', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('aurezia:Buysundayfraise')
AddEventHandler('aurezia:Buysundayfraise', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 8
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('sundayfraise', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)


RegisterNetEvent('craftdunpizza2')
AddEventHandler('craftdunpizza2', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local pizzafroid2 = xPlayer.getInventoryItem('pizzafroid2').count
    local pizza2 = xPlayer.getInventoryItem('pizza2').count

    if pizza2 > 50 then
        TriggerClientEvent('esx:showNotification', source, '~r~Tu à ateint la limite')
    elseif pizzafroid2 < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~tu n\'as plus de pizza 2 viande froid pour faire ceci')
    else
        xPlayer.removeInventoryItem('pizzafroid2', 1)
        xPlayer.addInventoryItem('pizza2', 1)    
    end
end)

RegisterNetEvent('craftdunepizza3')
AddEventHandler('craftdunepizza3', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local pizzafroid2 = xPlayer.getInventoryItem('pizzafroid2').count
    local pizza3 = xPlayer.getInventoryItem('pizza3').count

    if pizza3 > 60 then
        TriggerClientEvent('esx:showNotification', source, '~r~Tu à ateint la limite')
    elseif pizzafroid2 < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~tu n\'as plus de pizza 3 viande froid pour faire ceci')
    else
        xPlayer.removeInventoryItem('pizzafroid2', 1)
        xPlayer.addInventoryItem('pizza3', 1)    
    end
end)

RegisterNetEvent('craftdunepizzaxll')
AddEventHandler('craftdunepizzaxll', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local pizzafroidxll = xPlayer.getInventoryItem('pizzafroidxll').count
    local pizzaxll = xPlayer.getInventoryItem('pizzaxll').count

    if pizzaxll > 60 then
        TriggerClientEvent('esx:showNotification', source, '~r~Tu à ateint la limite')
    elseif pizzafroidxll < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~tu n\'as plus de pizza xll froid pour faire ceci')
    else
        xPlayer.removeInventoryItem('pizzafroidxll', 1)
        xPlayer.addInventoryItem('pizzaxll', 1)    
    end
end)

RegisterNetEvent('craftdunepetitefrite')
AddEventHandler('craftdunepetitefrite', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local petitefroidfrite = xPlayer.getInventoryItem('petitefroidfrite').count
    local petitefrite = xPlayer.getInventoryItem('petitefrite').count

    if petitefrite > 60 then
        TriggerClientEvent('esx:showNotification', source, '~r~Tu à ateint la limite')
    elseif petitefroidfrite < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~tu n\'as plus de petit frite froid pour faire ceci')
    else
        xPlayer.removeInventoryItem('petitefroidfrite', 1)
        xPlayer.addInventoryItem('petitefrite', 1)    
    end
end)

RegisterNetEvent('craftdunemoyennefrite')
AddEventHandler('craftdunemoyennefrite', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local moyennefroidfrite = xPlayer.getInventoryItem('moyennefroidfrite').count
    local moyennefrite = xPlayer.getInventoryItem('moyennefrite').count

    if moyennefrite > 60 then
        TriggerClientEvent('esx:showNotification', source, '~r~Tu à ateint la limite')
    elseif moyennefroidfrite < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~tu n\'as plus de moyenne frite froid pour faire ceci')
    else
        xPlayer.removeInventoryItem('moyennefroidfrite', 1)
        xPlayer.addInventoryItem('moyennefrite', 1)    
    end
end)

RegisterNetEvent('craftdunegrandefrite')
AddEventHandler('craftdunegrandefrite', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local grandefroidfrite = xPlayer.getInventoryItem('grandefroidfrite').count
    local grandefrite = xPlayer.getInventoryItem('grandefrite').count

    if grandefrite > 60 then
        TriggerClientEvent('esx:showNotification', source, '~r~Tu à ateint la limite')
    elseif grandefroidfrite < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~tu n\'as plus de grande frite froid pour faire ceci')
    else
        xPlayer.removeInventoryItem('grandefroidfrite', 1)
        xPlayer.addInventoryItem('grandefrite', 1)    
    end
end)

RegisterNetEvent('recoltegigapizzafroid')
AddEventHandler('recoltegigapizzafroid', function()
    local item = "gigapizzafroid"
    local limiteitem = 50
    local xPlayer = ESX.GetPlayerFromId(source)
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count
    

    if nbitemdansinventaire >= limiteitem then
        TriggerClientEvent('esx:showNotification', source, "Ta pas assez de place dans ton inventaire!")
        recoltepossible = false
    else
        xPlayer.addInventoryItem(item, 1)
        TriggerClientEvent('esx:showNotification', source, "Récolte en cours...")
		return
    end
end)

RegisterNetEvent('traitementgigapizzafroid')
AddEventHandler('traitementgigapizzafroid', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local gigapizzafroid = xPlayer.getInventoryItem('gigapizzafroid').count
    local gigapizza = xPlayer.getInventoryItem('gigapizza').count

    if gigapizza > 50 then
        TriggerClientEvent('esx:showNotification', source, '~r~Il semble que tu ne puisses plus porter de giga pizza...')
    elseif gigapizzafroid < 3 then
        TriggerClientEvent('esx:showNotification', source, '~r~Pas assez de giga pizza froid pour traiter...')
    else
        xPlayer.removeInventoryItem('gigapizzafroid', 5)
        xPlayer.addInventoryItem('gigapizza', 1)    
    end
end)


RegisterServerEvent('sellgigapizza')
AddEventHandler('sellgigapizza', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local gigapizza = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]

		if item.name == "gigapizza" then
			gigapizza = item.count
		end
	end
    
    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_pizza', function(account)
        societyAccount = account
    end)
    
    if gigapizza > 0 then
        xPlayer.removeInventoryItem('gigapizza', 1)
        xPlayer.addMoney(40)
        societyAccount.addMoney(40)
        TriggerClientEvent('esx:showNotification', xPlayer.source, "~g~Vous avez gagner ~b~40$~g~ pour chaque vente de giga pizza")
        TriggerClientEvent('esx:showNotification', xPlayer.source, "~g~La société gagne ~b~40$~g~ pour chaque vente de giga pizza")
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, "Vous n'avez plus rien à vendre")
    end
end)

-- Gigapizza

RegisterNetEvent('aurezia:Buygobeletvide')
AddEventHandler('aurezia:Buygobeletvide', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 750
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_pizza', function(account)
        societyAccount = account
        end)
        xPlayer.removeMoney(price)
        societyAccount.addMoney (price)
        xPlayer.addInventoryItem('gobeletvide', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Goble-vide~w~ donner !")
    else
         TriggerClientEvent('esx:showNotification', source, "il y a plus de Goble-vide")
    end
end)

-- Craft boission

RegisterNetEvent('craftdunegobeletdecoca')
AddEventHandler('craftdunegobeletdecoca', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local gobeletvide = xPlayer.getInventoryItem('gobeletvide').count
    local gobeletdecoca = xPlayer.getInventoryItem('gobeletdecoca').count

    if gobeletdecoca > 60 then
        TriggerClientEvent('esx:showNotification', source, '~r~Tu à ateint la limite')
    elseif gobeletvide < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~tu n\'as plus de boission pour faire ceci')
    else
        xPlayer.removeInventoryItem('gobeletvide', 1)
        xPlayer.addInventoryItem('gobeletdecoca', 1)    
    end
end)

RegisterNetEvent('craftdunegobeletdeicetea')
AddEventHandler('craftdunegobeletdeicetea', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local gobeletvide = xPlayer.getInventoryItem('gobeletvide').count
    local gobeletdeicetea = xPlayer.getInventoryItem('gobeletdeicetea').count

    if gobeletdeicetea > 60 then
        TriggerClientEvent('esx:showNotification', source, '~r~Tu à ateint la limite')
    elseif gobeletvide < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~tu n\'as plus de boission pour faire ceci')
    else
        xPlayer.removeInventoryItem('gobeletvide', 1)
        xPlayer.addInventoryItem('gobeletdeicetea', 1)    
    end
end)

RegisterNetEvent('craftdunegobeletdehawai')
AddEventHandler('craftdunegobeletdehawai', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local gobeletvide = xPlayer.getInventoryItem('gobeletvide').count
    local gobeletdehawai = xPlayer.getInventoryItem('gobeletdehawai').count

    if gobeletdehawai > 60 then
        TriggerClientEvent('esx:showNotification', source, '~r~Tu à ateint la limite')
    elseif gobeletvide < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~tu n\'as plus de boission pour faire ceci')
    else
        xPlayer.removeInventoryItem('gobeletvide', 1)
        xPlayer.addInventoryItem('gobeletdehawai', 1)    
    end
end)
