-- Created By Rabia Alhaffar In 10/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

LockPointer = function()
    if cakecanvas.requestPointerLock then cakecanvas:requestPointerLock() end
    if document.pointerLockElement.localName == "canvas" then cakecanvas:requestPointerLock() end
end

UnlockPointer = function()
    document:exitPointerLock()
end
