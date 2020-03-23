-- Created By Rabia Alhaffar In 16/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

FB_Initialize = function()
    window:eval("FBInstant.initializeAsync();")
end

FB_PlayerID = function()
    window:eval("FBInstant.player.getID();")
end

FB_PlayerName = function()
    window:eval("FBInstant.player.getName();")
end

FB_PlayerPhoto = function()
    window:eval("FBInstant.player.getPhoto();")
end

FB_ContextID = function()
    window:eval("FBInstant.context.getID();")
end

FB_ContextType = function()
    window:eval("FBInstant.context.getType();")
end

FB_OS = function()
    window:eval("FBInstant.getPlatform();")
end

FB_SDKVersion = function()
    window:eval("FBInstant.getSDKVersion();")
end

FB_Localization = function()
    window:eval("FBInstant.getLocale();")
end

FB_SetProgress = function(x)
    window:eval("FBInstant.setLoadingProgress("..x..");")
end

FB_ExitGame = function()
    window:eval("FBInstant.quit();")
end

FB_APIS = function()
    window:eval("FBInstant.getSupportedAPIs();")
end

FB_LeaderboardName = function()
    window:eval("FBInstant.leaderboard.getName();")
end

FB_PostScore = function(x)
    window:eval("FBInstant.postSessionScore("..x..");")
end