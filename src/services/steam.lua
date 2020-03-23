-- Created By Rabia Alhaffar In 12/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

LaunchSteam = function()
    window:open("https://store.steampowered.com")
end

OpenSteamPage = function(page)
    if page == "Store" then
        window:open("https://store.steampowered.com/")
    end
    if page == "Help" then
        window:open("https://help.steampowered.com/")
    end
    if page == "Community" then
        window:open("https://steamcommunity.com/")
    end
    if page == "News" then
        window:open("https://store.steampowered.com/news/")
    end
end

DownloadSteamDirectly = function()
    if Windows then
        window:open("https://steamcdn-a.akamaihd.net/client/installer/SteamSetup.exe")
    end
    if Mac then
        window:open("https://steamcdn-a.akamaihd.net/client/installer/SteamSetup.dmg")
    end
    if not Windows or Mac then
        window:open("https://steamcdn-a.akamaihd.net/client/installer/SteamSetup.deb")
    end
end

OpenSteamAppPage = function(app_number_as_id)
    window:open("https://store.steampowered.com/app/"..tostring(app_number_as_id))
end

Steam_Login = function()
    window:open("https://store.steampowered.com/login")
end

Steam_Logout = function()
    window:open("https://store.steampowered.com/logout")	
end
