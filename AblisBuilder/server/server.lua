ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent("utilitaire:checkPerm")
AddEventHandler("utilitaire:checkPerm", function()
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    
    if xPlayer.getGroup() ~= "user" then
        TriggerClientEvent("utilitaire:checkIsAdminOk", _src)
    else
        TriggerClientEvent("esx:showNotification", _src, "Vous n'avez pas les permissions nécessaires pour effectuer cette action.")
    end
end)

RegisterServerEvent("AblisBuilder:createBlips")
AddEventHandler("AblisBuilder:createBlips", function(infoB)
    local _src = source
    MySQL.Async.execute('INSERT INTO ablisbuilder (name, coords, type, color) VALUES (@name, @coords, @type, @color)', {
        ['@name'] = infoB.name,
        ['@coords'] = json.encode(infoB.coords),
        ['@type'] = infoB.type,
        ['@color'] = infoB.color
    }, function(affectedRows)
        if affectedRows > 0 then
            TriggerClientEvent('esx:showNotification', _src, "Blip créé avec succès.")
        else
            TriggerClientEvent('esx:showNotification', _src, "Erreur lors de la création du blip.")
        end
    end)
end)


ESX.RegisterServerCallback('AblisBuilder:getAllBlips', function(source, cb)
    MySQL.Async.fetchAll("SELECT * FROM ablisbuilder", {}, function(data)
        local allBlips = {}
        for _, v in pairs(data) do
            table.insert(allBlips, {
                id = v.type,
                name = v.name,
                coords = v.coords,
                type = v.type,
                color = v.color
            })
        end
        cb(allBlips)
    end)
end)

RegisterCommand('stopanimation', function(source, args, rawCommand)
    local playerId = source
    local playerPed = GetPlayerPed(playerId)
    
    if DoesEntityExist(playerPed) then
        ClearPedTasks(playerPed)
        TriggerClientEvent('esx:showNotification', playerId, '~g~Animation arrêtée !')
    else
        TriggerClientEvent('esx:showNotification', playerId, '~r~Erreur: Vous n\'êtes pas un ped.')
    end
end, false)
