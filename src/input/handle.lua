-- Created By Rabia Alhaffar In 10/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

AddKeyDownHandler = function(f)
    window:addEventListener("keydown",f)
end

AddKeyUpHandler = function(f)
    window:addEventListener("keyup",f)
end

AddKeyHitHandler = function(f)
    window:addEventListener("keypress",f)
end

AddMouseDownHandler = function(f)
    window:addEventListener("mousedown",f)
end

AddMouseMoveHandler = function(f)
    window:addEventListener("mousemove",f)
end

AddClickHandler = function(f)
    window:addEventListener("click",f)
end

AddTapHandler = function(f)
    window:addEventListener("touchstart",f)
end

AddSwipeHandler = function(f)
    window:addEventListener("touchmove",f)
end
