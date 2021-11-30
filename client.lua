local ESX = nil
local ready = false
local isInMarker = false
local hasAlreadyEnteredMarker = false
local drawMarker = false
local open = false
local openedDoors = {}

Citizen.CreateThread( function()
    while ESX == nil do
        TriggerEvent("esx:getSharedObject", function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    ready = true

    Citizen.Wait(5000)
    init()

    

end)

function tableIsTrue(table, key)
    for _, value in ipairs(table) do
        if value == key then
            return true
        end
    end
    return false
end

function init()
    ESX.TriggerServerCallback("advent:getData", function(data)
        if data ~= nil then
            openedDoors = json.decode(data.day)
        else
            openedDoors = {}
        end
        local doors = {}
        for _, value in ipairs(Config.Doors) do
            if openedDoors ~= nil then
                value.opened = tableIsTrue(openedDoors, value.day)
            else
                value.opened = false
            end
            table.insert(doors, value)
        end
        SendNUIMessage({
            event = "door",
            doors = doors
        })
    end)
end

-- Blip logic
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		local coords = GetEntityCoords(PlayerPedId())
		local canSleep = true
		isInMarker = false
        drawMarker = false
        local distance = #(coords-Config.Location)

		if distance < 1.5 then
			isInMarker, canSleep = true, false
        end
        if distance < 30.0 then
            drawMarker, canSleep = true, false
        end
		

		if isInMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
			canSleep = false
		end
	
		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
		end

        if drawMarker then
            DrawMarker(1, Config.Location, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 255, 255, 100, false, true, 2, false, false, false, false)
        end

		if canSleep then
			Citizen.Wait(500)
		end
	end
end)

-- Menu interactions
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if isInMarker and not open then

			ESX.LookiHelpMeNotices("Drücke ~INPUT_CONTEXT~ um den Adventskalender zu öffnen!")

			if IsControlJustReleased(0, 38) and IsPedOnFoot(PlayerPedId()) then
				open = true
				SendNUIMessage({
                    event = "open",
				})

				SetNuiFocus(true, true)
			end

		else
			Citizen.Wait(500)
		end
	end
end)

RegisterNUICallback("hide", function(data, cb)
    SetNuiFocus(false, false)
    open = false
    cb()
end)

RegisterNUICallback("openDoor", function(data, cb)
    local door = data.day

    TriggerServerEvent("advent:openDoor", door)

    cb({ type = "success" })
end)