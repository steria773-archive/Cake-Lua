-- Created By Rabia Alhaffar In 7/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

KeyUp = function() end
KeyDown = function() end
KeyHit = function() end
Tap = function() end
Swipe = function() end
Click = function() end
Hover = function() end
MouseButtonDown = function() end
MouseButtonUp = function() end

GamepadID = function(gamepad_index)
   return navigator:getGamepads()[gamepad_index].id
end

GamepadConnected = function(gamepad_index)
   return navigator:getGamepads()[gamepad_index].connected
end

GamepadButtonPressed = function(gamepad_index,button)
    return navigator:getGamepads()[gamepad_index].buttons[button].pressed
end

GamepadButtonTouched = function(gamepad_index,button)
    return navigator:getGamepads()[gamepad_index].buttons[button].touched
end

GamepadAxeValue = function(gamepad_index,axe)
    return navigator:getGamepads()[gamepad_index].axes[axe]
end

document.onkeyup = KeyUp
document.onkeydown = KeyDown
document.onkeypress = KeyHit
document.ontouchstart = Tap
document.ontouchmove = Swipe
document.onclick = Click
document.onmousedown = MouseButtonDown
document.onmouseup = MouseButtonUp
document.onmouseover = Hover
