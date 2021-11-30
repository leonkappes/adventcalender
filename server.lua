ESX = nil

TriggerEvent("esx:getSharedObject", function(obj)
    ESX = obj
end)

ESX.RegisterServerCallback("advent:getData"
, function(src, cb)
    local xPlayer = ESX.GetPlayerFromId(src)

    exports["oxmysql"]:single("SELECT day FROM advent WHERE owner = ?", {xPlayer.getIdentifier()}, function (result)
        cb(result)
    end)
end)

RegisterNetEvent("advent:openDoor")
AddEventHandler("advent:openDoor", function(day)
    local xPlayer = ESX.GetPlayerFromId(source)
    if tonumber(os.date("%d")) >= day then
        exports["oxmysql"]:single("SELECT day FROM advent WHERE owner = ?", {xPlayer.getIdentifier()}, function (result)
            if result == nil then
                result = {}
                table.insert(result, day)
                exports["oxmysql"]:execute("INSERT INTO advent (owner, day) VALUES (?, ?)", {xPlayer.getIdentifier(), json.encode(result)})
            else
                result = json.decode(result.day)
                table.insert(result, day)
                exports["oxmysql"]:execute("UPDATE advent SET day = ? WHERE owner = ?", {json.encode(result), xPlayer.getIdentifier()})
            end
        end)
        giveItems(xPlayer, day)
    end
end)

function giveItems(xPlayer, day)
    if day == 1 then
        xPlayer.addMoney(9000)
    elseif day == 2 then
        xPlayer.addAccountMoney('black_money', 3000)
    elseif day == 3 then
        xPlayer.addInventoryItem('dietrich', 2)
    elseif day == 4 then
        xPlayer.addInventoryItem('eschere', 4)
    elseif day == 5 then
        xPlayer.addInventoryItem('gps', 1)
    elseif day == 6 then
        xPlayer.addMoney(14000)
    elseif day == 7 then
        xPlayer.addInventoryItem('spray', 2)
    elseif day == 8 then
        xPlayer.addInventoryItem('spray_remover', 5)
    elseif day == 9 then
        xPlayer.addInventoryItem('whiskycoca', 4)
    elseif day == 10 then
        xPlayer.addInventoryItem('taco', 9)
    elseif day == 11 then
        xPlayer.addInventoryItem('vodka', 2)
    elseif day == 12 then
        xPlayer.addInventoryItem('cognac', 1)
    elseif day == 13 then
        xPlayer.addInventoryItem('curryworst', 3)
    elseif day == 14 then
        xPlayer.addMoney(8000)
    elseif day == 15 then
        xPlayer.addInventoryItem('coke_pooch', 5)
    elseif day == 16 then
        xPlayer.addInventoryItem('clip', 4)
    elseif day == 17 then
        xPlayer.addWeapon('GADGET_PARACHUTE', 1)
    elseif day == 18 then
        xPlayer.addMoney(13000)
    elseif day == 19 then
        xPlayer.addInventoryItem('wheelticket', 1)
    elseif day == 20 then
        xPlayer.addInventoryItem('opium_pooch', 12)
    elseif day == 21 then
        xPlayer.addInventoryItem('wein', 3)
    elseif day == 22 then
        xPlayer.addInventoryItem('lsd_pooch', 22)
    elseif day == 23 then
        xPlayer.addInventoryItem('rhumcoca', 4)
    elseif day == 24 then

    end
end