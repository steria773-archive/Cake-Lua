-- Created By Rabia Alhaffar In 16/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

cx = 0
cy = 0
cz = 0

SetCameraPosition = function(x,y,z) 
    if Unknown(x) then x = 0 end
    if Unknown(y) then y = 0 end
    if Unknown(z) then z = 0 end
    cx = x
    cy = y
    cz = z
end

InitializeCamera = function(mode,scene)
    if Unknown(mode) then mode = "canvas" end
    
    if mode == "canvas" then
        window:setInterval(function()
            cakepen:translate(cx,cy)
        end,0)
    end
    
    if mode == "space" then
        window:setInterval(function()
            scene.camera.x = cx
            scene.camera.y = cy
            scene.camera.z = cz
        end,0)
    end
    
    if mode == "webgl" then
        window:setInterval(function()
            cakepen:translate(cx,cy,cz)
        end,0)
    end

end

MoveCamera = function(x,y,z)
    cx = cx + x
    cy = cy + y
    cz = cz + z
end

FreezeCamera = function()
    cx = 0
    cy = 0
    cz = 0
end
