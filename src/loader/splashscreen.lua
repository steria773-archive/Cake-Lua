-- Created By Rabia Alhaffar In 12/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

SetSplashscreen = function(src,level,time)
    cakecanvas.style.backgroundImage = "url("..tostring(src)..")"
    window:setTimeout(function()
        cakecanvas.style.backgroundImage = "none"
        level:Start()  
    end,time)
end
