ESX = exports['es_extended']:getSharedObject()

local open = false
local animationPlaying = false

local blipData = {
    id = nil,
    color = nil,
    name = nil,
    scale = nil,
    coords = nil
}

function IsValidBlipScale(scale)
    return (scale >= 0.1 and scale <= 0.9) or (scale >= 1 and scale <= 9)
end

function BlipsBuilder()
    if not open then
        open = true
        local MainMenu = RageUI.CreateMenu("Ablips Builder", "Actions disponibles :")
        local CreateBlips = RageUI.CreateSubMenu(MainMenu, "Ablips Builder", "Actions disponibles :")

        RageUI.Visible(MainMenu, true)

        if not animationPlaying then
            ExecuteCommand("e tablet2")
            animationPlaying = true
        end

        Citizen.CreateThread(function()
            while open do
                RageUI.IsVisible(MainMenu, function()
                    RageUI.Button("→ Crée un blip", "Vous permet de créer un blip", {RightLabel = "→→"}, true, {}, CreateBlips)
                end) 

                RageUI.IsVisible(CreateBlips, function()
                    RageUI.Button("→ Model du Blips", nil, {RightLabel = blipData.id or "~r~Indéfini~s~"}, true, {
                        onSelected = function()
                            local input = exports["cfx-target"]:ShowSync('Veuillez indiquer le modèle du Blips', true, 600, "small_text")
                            if input then
                                blipData.id = tonumber(input)
                            end
                        end
                    })

                    RageUI.Button("→ Couleur du blips", nil, {RightLabel = blipData.color or "~r~Indéfini~s~"}, true, {
                        onSelected = function()
                            local input = exports["cfx-target"]:ShowSync('Veuillez indiquer la couleur souhaitée du Blips', true, 600, "small_text")
                            if input then
                                blipData.color = tonumber(input)
                            end
                        end
                    })

                    RageUI.Button("→ Nom du Blips", nil, {RightLabel = blipData.name or "~r~Indéfini~s~"}, true, {
                        onSelected = function()
                            local input = exports["cfx-target"]:ShowSync('Veuillez indiquer le nom du Blips', true, 600, "small_text")
                            if input then
                                blipData.name = input
                            end
                        end
                    })

                    RageUI.Button("→ Taille du Blips", nil, {RightLabel = blipData.scale or "~r~Indéfini~s~"}, true, {
                        onSelected = function()
                            local input = exports["cfx-target"]:ShowSync('Veuillez indiquer la taille du Blips', true, 600, "small_text")
                            if input then
                                local scale = tonumber(input)
                                if IsValidBlipScale(scale) then
                                    blipData.scale = scale
                                else
                                    ESX.ShowNotification("Taille invalide. Entrez une valeur entre 0.1-0.9 ou 1-9.")
                                end
                            end
                        end
                    })

                    RageUI.Button("→ Définir la position du blip", nil, {RightLabel = blipData.coords and "~g~Défini~s~" or "~r~Indéfini~s~"}, true, {
                        onSelected = function()
                            local playerPed = PlayerPedId()
                            local playerPos = GetEntityCoords(playerPed)
                            blipData.coords = {x = playerPos.x, y = playerPos.y, z = playerPos.z}
                        end
                    })

                    RageUI.Button("→ ~g~Valider la création~s~", nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            if blipData.id and blipData.color and blipData.name and blipData.scale and blipData.coords then
                                local blip = AddBlipForCoord(blipData.coords.x, blipData.coords.y, blipData.coords.z)
                                SetBlipSprite(blip, blipData.id or 1)
                                SetBlipDisplay(blip, 4)
                                SetBlipScale(blip, blipData.scale or 1.0) 
                                SetBlipColour(blip, blipData.color or 1)
                                SetBlipAsShortRange(blip, false)
                                BeginTextCommandSetBlipName("STRING")
                                AddTextComponentString(blipData.name or "Blip")
                                EndTextCommandSetBlipName(blip)
                    
                                TriggerServerEvent("AblisBuilder:createBlips", {
                                    name = blipData.name,
                                    coords = blipData.coords,
                                    type = blipData.id,
                                    color = blipData.color
                                })
                    
                                blipData = {id = nil, color = nil, name = nil, scale = nil, coords = nil}
                                ESX.ShowNotification("Blip créé avec succès !")
                            else
                                ESX.ShowNotification("Veuillez remplir tous les champs avant de valider.")
                            end
                        end
                    })
                end)

                if not RageUI.Visible(MainMenu) and not RageUI.Visible(CreateBlips) then
                    open = false
                    if animationPlaying then
                        ExecuteCommand("stopanimation")
                        animationPlaying = false
                    end
                end

                Wait(0)
            end
        end)
    end
end

Citizen.CreateThread(function()
    ESX.TriggerServerCallback('AblisBuilder:getAllBlips', function(blips)
        for _, blipData in pairs(blips) do
            local coords = json.decode(blipData.coords)
            local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
            SetBlipSprite(blip, tonumber(blipData.type) or 1) 
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, 1.0)
            SetBlipColour(blip, tonumber(blipData.color) or 1) 
            SetBlipAsShortRange(blip, false) 
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(tostring(blipData.name) or "Blip") 
            EndTextCommandSetBlipName(blip)
        end
    end)
end)

RegisterCommand("blipsbuilder", function()
    TriggerServerEvent("utilitaire:checkPerm")
end)

RegisterNetEvent("utilitaire:checkIsAdminOk")
AddEventHandler("utilitaire:checkIsAdminOk", function()
    BlipsBuilder()
end)

