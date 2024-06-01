local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('qb_anonymous:start_mission')
AddEventHandler('qb_anonymous:start_mission', function()
    local itemName = "fakebankingcard"
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    local qtty = xPlayer.Functions.GetItemByName(itemName) and xPlayer.Functions.GetItemByName(itemName).amount or 0

    if qtty < 1 then
        xPlayer.Functions.AddItem(itemName, 1)
        TriggerClientEvent('QBCore:Notify', _source, 'You received a fake banking card', 'success')
    end
    TriggerClientEvent("qb_anonymous:start_mission", _source)
end)

RegisterServerEvent('qb_anonymous:do_mission')
AddEventHandler('qb_anonymous:do_mission', function()
    local itemName = "fakebankingcard"
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    local qtty = xPlayer.Functions.GetItemByName(itemName) and xPlayer.Functions.GetItemByName(itemName).amount or 0

    if qtty > 0 then
        xPlayer.Functions.RemoveItem(itemName, 1)
        xPlayer.Functions.AddItem("usbhacked", 1)
        TriggerClientEvent('QBCore:Notify', _source, 'You received a hacked USB', 'success')
        TriggerClientEvent("qb_anonymous:do_mission", _source)
    end
end)

RegisterServerEvent('qb_anonymous:end_mission')
AddEventHandler('qb_anonymous:end_mission', function(distance)
    local itemName = "usbhacked"
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    local qtty = xPlayer.Functions.GetItemByName(itemName) and xPlayer.Functions.GetItemByName(itemName).amount or 0

    if qtty > 0 then
        xPlayer.Functions.RemoveItem(itemName, qtty)
        local reward = Config.MoneyAmount * qtty * distance / 15000
        xPlayer.Functions.AddMoney('blackmoney', reward)
        TriggerClientEvent('QBCore:Notify', _source, 'You received ' .. reward .. ' black money', 'success')
    end
end)
