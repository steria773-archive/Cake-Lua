-- Created By Rabia Alhaffar In 10/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

Fullscreen = window.fullscreen

ToggleFullscreen = function()
    screen = document.documentElement
    if screen.requestFullscreen then screen:requestFullscreen() end 
    if screen.mozRequestFullScreen then screen:mozRequestFullScreen() end
    if screen.webkitRequestFullscreen then screen:webkitRequestFullscreen() end 
    if screen.msRequestFullscreen then screen:msRequestFullscreen() end
end

ExitFullscreen = function()
    if document.exitFullscreen then document:exitFullscreen() end
	if document.mozCancelFullScreen then document:mozCancelFullScreen() end
	if document.webkitExitFullscreen then document:webkitExitFullscreen() end
	if document.msExitFullscreen then document:msExitFullscreen() end
end
