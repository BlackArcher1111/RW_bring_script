
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- A Discord Webhook URL-je
local discordWebhookURL = "https://discord.com/api/webhooks/YOUR_WEBHOOK_URL"


local playerCoords = {}

function sendDiscordLog(message)
    local content = {
        content = message
    }

    PerformHttpRequest(discordWebhookURL, function(err, text, headers)
        
    end, 'POST', json.encode(content), { ['Content-Type'] = 'application/json' })
end

RegisterCommand('bring', function(source, args)
    local src = source
    local targetId = tonumber(args[1])

    if not targetId then
        TriggerClientEvent('esx:showNotification', src, 'Adj meg egy érvényes ID-t!')
        return
    end


    local coords = GetEntityCoords(GetPlayerPed(src))
    playerCoords[targetId] = GetEntityCoords(GetPlayerPed(targetId))

    TriggerClientEvent('bring:teleport', targetId, coords)
    TriggerClientEvent('esx:showNotification', src, 'Játékost (ID: ' .. targetId .. ') magadhoz hoztad!')

    local adminName = GetPlayerName(src)  
    local targetName = GetPlayerName(targetId)  
    sendDiscordLog('**Bring parancs:** ' .. adminName .. ' hozta magához ' .. targetName .. ' játékost (ID: ' .. targetId .. ').')
end, false)

RegisterCommand('bringall', function(source)
    local src = source
    local coords = GetEntityCoords(GetPlayerPed(src))

    for _, playerId in ipairs(GetPlayers()) do
        if tonumber(playerId) ~= src then
            playerCoords[playerId] = GetEntityCoords(GetPlayerPed(playerId))
            TriggerClientEvent('bring:teleport', playerId, coords)
        end
    end

    TriggerClientEvent('esx:showNotification', src, 'Minden játékost magadhoz hoztál!')


    local adminName = GetPlayerName(src)  
    sendDiscordLog('**Bringall parancs:** ' .. adminName .. ' minden játékost magához hozott.')
end, false)


RegisterCommand('back', function(source, args)
    local src = source
    local targetId = tonumber(args[1])

    if not targetId or not playerCoords[targetId] then
        TriggerClientEvent('esx:showNotification', src, 'Hibás ID vagy nincs mentett pozíció!')
        return
    end

    TriggerClientEvent('bring:teleport', targetId, playerCoords[targetId])
    TriggerClientEvent('esx:showNotification', src, 'Játékost (ID: ' .. targetId .. ') visszatelepítetted az eredeti helyére!')
    playerCoords[targetId] = nil


    local adminName = GetPlayerName(src) 
    local targetName = GetPlayerName(targetId)  
    sendDiscordLog('**Back parancs:** ' .. adminName .. ' visszateleportálta ' .. targetName .. ' játékost az eredeti helyére.')
end, false)


RegisterCommand('backall', function(source)
    local src = source

    for playerId, coords in pairs(playerCoords) do
        TriggerClientEvent('bring:teleport', playerId, coords)
    end

    TriggerClientEvent('esx:showNotification', src, 'Minden játékost visszatelepítettél az eredeti helyére!')
    playerCoords = {}

    local adminName = GetPlayerName(src)  
    sendDiscordLog('**Backall parancs:** ' .. adminName .. ' minden játékost visszateleportált az eredeti helyükre.')
end, false)
