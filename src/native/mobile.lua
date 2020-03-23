-- Created By Rabia Alhaffar In 11/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

Vibrate = function(x)
    navigator:vibrate(x)
end
StopVibrating = function()
    navigator:vibrate(0)
end
ShowBatteryLevel = function()
    console:info("Battery Level: "..tostring(navigator.battery.level * 100).."%")
end
UnlockDeviceRotation = function()
    window.ScreenOrientation:unlock()
end
LockDeviceRotation = function(position)
    window.ScreenOrientation:lock(tostring(position))
end 
