-- Created By Rabia Alhaffar In 12/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

LaunchXBOX = function()
    window:open("https://www.xbox.com/")
end	

OpenXBOXPage = function(page)
    if page == "Main" then
        window:open("https://www.xbox.com")
    end
    if page == "Games" then
        window:open("https://www.xbox.com/games")
    end
    if page == "Feedback" then
        window:open("https://aka.ms/xboxideas")
    end
    if page == "Support" then
        window:open("https://support.xbox.com/")
    end
    if page == "News" then
        window:open("https://news.xbox.com/")
    end
    if page == "Developers" then
        window:open("https://www.xbox.com/developers")
    end
    if page == "XBOX Game Pass" then
        window:open("https://www.xbox.com/xbox-game-pass")
    end
    if page == "Profile" then
        window:open("https://account.xbox.com/Profile")
    end
    if page == "Settings" then
        window:open("https://account.xbox.com/Settings/")
    end
    if page == "Trending" then
        window:open("https://account.xbox.com/trendingtopics")
    end
    if page == "Home" then
        window:open("https://account.xbox.com/social")
    end
    if page == "Friends" then
        window:open("https://account.xbox.com/Friends")
    end
    if page == "Messages" then
        window:open("https://account.xbox.com/SkypeMessages")
    end
    if page == "My Games" then
        window:open("https://account.xbox.com/MyGames")
    end
    if page == "Clubs" then
        window:open("https://account.xbox.com/clubs")
    end
    if page == "Community" then
        window:open("https://www.xbox.com/community")
    end
    if page == "XBOX Live" then
        window:open("https://www.xbox.com/live")
    end
end
OpenXBOXGamePage = function(game_name)
    window:open("https://www.xbox.com/games/" + tostring(game_name))
end
SignOutFromXBOX = function()
    window:open("https://account.xbox.com/Account/Signout")
end