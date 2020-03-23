-- Created By Rabia Alhaffar In 10/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON
window.update = function()
    return window.requestAnimationFrame or 
           window.webkitRequestAnimationFrame or
           window.msRequestAnimationFrame or
           window.msRequestAnimationFrame or
           window.oRequestAnimationFrame or
           function(callback,fps)
            window:setTimeout(callback, 1000 / fps);
           end
end
