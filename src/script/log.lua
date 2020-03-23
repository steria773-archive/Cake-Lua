-- Created By Rabia Alhaffar In 15/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

Key = ""
KeyCode = 0
MouseX = 0
MouseY = 0
MouseButton = 0
MouseButtonName = ""
TouchX = 0
TouchY = 0

Log = function(log)
	console:log(log)
end

RecordKeyboard = function(KeyboardKey)
	Key = KeyboardKey.key
	KeyCode = KeyboardKey.keyCode
	console:info("Key Pressed: "..Key.." , KeyCode: "..KeyCode)	
end

RecordMouse = function(event)

	MouseX = event.clientX
	MouseY = event.clientY
	MouseButton = event.button
	if MouseButton == 0 then MouseButtonName = "Left" end
	if MouseButton == 1 then MouseButtonName = "Middle(Wheel)" end
	if MouseButton == 2 then MouseButtonName = "Right" end
	console:info("Mouse X Position: "..MouseX.." , Mouse Y Position: "..MouseY.." , Button Pressed: "..MouseButtonName.." Mouse Button")
end

RecordTouch = function(event)
	TouchX = event.clientX or event.pageX
	TouchY = event.clientY or event.pageY
	console.info("Touch X Position: "..TouchX.." , Touch Y Position: "..TouchY)
end

RecordMotion = function(event)
	console.log("Acceleration X: "..event.accelerationIncludingGravity.x.." , Acceleration Y: "..event.accelerationIncludingGravity.y)
end

document:addEventListener("keydown",RecordKeyboard)
document:addEventListener("keyup",RecordKeyboard)
document:addEventListener("mousemove",RecordMouse)
document:addEventListener("click",RecordMouse)
document:addEventListener("touchmove",RecordTouch)
document:addEventListener("touchstart",RecordTouch)

EnableAccelerometer = function()
	document:addEventListener("devicemotion",RecordMotion) -- Did This For Not Conflicting With Other Browsers(Other Than Chrome)
end

ClearConsole = function()
	console:clear()
end
