Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
    end
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
    end
    if ESX.IsPlayerLoaded() then

		ESX.PlayerData = ESX.GetPlayerData()

    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)


-- MENU FUNCTION --

local open = false 
local pizzaMain3 = RageUI.CreateMenu('~y~Piz~g~za', '~g~Interaction')
local pizzaMain2 = RageUI.CreateMenu('~y~Piz~g~za', '~g~Interaction')
local subMenu5 = RageUI.CreateSubMenu(pizzaMain3, "~y~Anno~g~nces", "~g~Interaction")
local pizzaMenu6 = RageUI.CreateSubMenu(pizzaMain2, "~y~Fa~g~rm", "~g~Interaction")
pizzaMain2.Display.Header = true 
pizzaMain2.Closed = function()
  open = false
end

function OpenMenupizza()
	if open then 
		open = false
		RageUI.Visible(pizzaMain3, false)
		return
	else
		open = true 
		RageUI.Visible(pizzaMain3, true)
		CreateThread(function()
		while open do 
		   RageUI.IsVisible(pizzaMain3,function() 

			RageUI.Separator("~y~↓ Anno~g~nces ↓")
			RageUI.Button("Annonces", nil, {RightLabel = "→→"}, true , {
				onSelected = function()
				end
			}, subMenu5)


			RageUI.Separator("~y~↓ Fact~g~ures ↓")
			RageUI.Button("Faire une Facture", nil, {RightLabel = "→→"}, true , {
				onSelected = function()
					OpenBillingMenu2()
                    RageUI.CloseAll()
				end
			})

		
		
			RageUI.Separator("~y~↓ Far~g~ms ↓")
			RageUI.Button("Pour accéder au farms", nil, {RightLabel = "→→"}, true , {
				onSelected = function()
				end
			}, pizzaMenu6)

			end)


			RageUI.IsVisible(pizzaMenu6,function() 

				RageUI.Button("Obtenir le point de récolte", nil, {RightLabel = "→→"}, true , {
					onSelected = function()
						SetNewWaypoint(-62.38, 6239.85, 30.09)  
					end
				})
	
				RageUI.Button("Obtenir le point de traitement", nil, {RightLabel = "→→"}, true , {
					onSelected = function()
						SetNewWaypoint(-2544.12, 2315.94, 33.22) 
					end
				})
	
				RageUI.Button("Obtenir le point de vente", nil, {RightLabel = "→→"}, true , {
					onSelected = function()
						SetNewWaypoint(-157.81, -54.37, 54.4) 
					end
				})

			end)

			RageUI.IsVisible(subMenu5, function()
				RageUI.Button("Annonce Ouvertures", nil, { RightLabel = "→" }, true, {
					onSelected = function()
						TriggerServerEvent('Ouvre:pizzas')
					end
				})
			  
				RageUI.Button("Annonce Fermetures", nil, { RightLabel = "→" }, true, {
					onSelected = function()
						TriggerServerEvent('Ferme:pizzas')
					end
				})
			  
				RageUI.Button("Annonce Recrutement", nil, { RightLabel = "→" }, true, {
					onSelected = function()
						TriggerServerEvent('Recru:pizzas')
					end
				})
			  
				RageUI.Button("Annonce Giga pizza", nil, { RightLabel = "→" }, true, {
					onSelected = function()
						TriggerServerEvent('Giga:pizzas')
					end
				})
			  end)
			  
		 Wait(0)
		end
	 end)
  end
end
RegisterNetEvent('esx:showAdvancedNotification')
AddEventHandler('esx:showAdvancedNotification', function(title, subject, msg, icon, iconType)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(msg)
	SetNotificationMessage(icon, icon, false, iconType, title, subject)
	DrawNotification(false, true)
end)
-- FUNCTION BILLING --

function OpenBillingMenu2()

	ESX.UI.Menu.Open(
	  'dialog', GetCurrentResourceName(), 'billing',
	  {
		title = "Facture"
	  },
	  function(data, menu)
	  
		local amount = tonumber(data.value)
		local player, distance = ESX.Game.GetClosestPlayer()
  
		if player ~= -1 and distance <= 3.0 then
  
		  menu.close()
		  if amount == nil then
			  ESX.ShowNotification("~r~Problèmes~s~: Montant invalide")
		  else
			local playerPed        = GetPlayerPed(-1)
			TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TIME_OF_DEATH', 0, true)
			Citizen.Wait(5000)
			  TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_pizza', ('pizza'), amount)
			  Citizen.Wait(100)
			  ESX.ShowNotification("~r~Vous avez bien envoyer la facture")
		  end
  
		else
		  ESX.ShowNotification("~r~Problèmes~s~: Aucun joueur à proximitée")
		end
  
	  end,
	  function(data, menu)
		  menu.close()
	  end
	)
  end

-- OUVERTURE DU MENU --

Keys.Register('F6', 'Pizza', 'Ouvrir le menu pizza', function()
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'pizza' then
    	OpenMenupizza()
	end
end)

