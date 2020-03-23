-- Created By Rabia Alhaffar In 19/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

CLAY_Initialize = function(game_id)
    window:eval([[Clay('init', { gameId: ]]..game_id..[[ });]])
end

CLAY_ShareWithText = function(share_text)
    window:eval([[Clay('client.share.any', { text: ]]..share_text..[[ });]])
end

CLAY_VERSION = function()
    window:eval([[Clay('version');]])
end

CLAY_ShowAd = function()
    window:eval([[Clay('ui.ads.page');]])
end

CLAY_ShowBanner = function(banner_position)
    window:eval([[Clay('ui.ads.banner', { position: ]]..banner_position..[[ });]])
end
--[[
banner_position Can Be:
"top"
"bottom"
]]
