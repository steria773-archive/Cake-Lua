-- Created By Rabia Alhaffar In 11/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON
OnAwake = function(f)
    window.onload = function()
        window:setTimeout(f,0)
    end
end
OnStart = function(f)
    window.onload = function()
        window:setTimeout(f,1000)
    end
end
OnUpdate = function(f)
    window.onload = function()
        window:setInterval(f,1)
    end
end
OnClose = function(f)
    window.onclose = function()
        window:setTimeout(f,0)
    end
end
OnLevelStart = function(level,f)
    if level.started or level.resumed then window:setTimeout(f,0) end
end
OnLevelPause = function(level,f)
    if level.paused then window:setTimeout(f,0) end
end
OnDestroy = function(component,f)
    if component.destroyed then window:setTimeout(f,0) end
end
OnCollision = function(component_1,component_2,f)
    if CheckCollisionRect(component_1,component_2) then window:setTimeout(f,1) end
    if CheckCollisionCircle(component_1,component_2) then window:setTimeout(f,1) end
    if CheckCollisionCircleRect(component_1,component_2) then window:setTimeout(f,1) end
end
OnRotate = function(component,f)
    if component.rotated then window:setTimeout(f,0) end
end
