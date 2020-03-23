-- Created By Rabia Alhaffar In 7/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

cheat = 0
InputCheatCode = function()
    cheat = window:prompt("Enter Cheatcode:")
end
CheckCheatCode = function(cheatcode)
    return cheat == cheatcode
end
SetCheatCode = function(cheatcode)
    cheat = cheatcode
end
