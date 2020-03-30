-- Created By Rabia Alhaffar In 7/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

RestartGame = function()
    window.location:reload()
end
CloseGame = function()
    window:close()
end
Title = function(t)
    document.title = t
end
CrashGame = function()
    while true do console:log(0) end
end
ViewSourceCode = function(index)
    window:open(document.scripts[index].src)
end
ViewGameSourceCode = function()
    window:open(document.scripts[2].src)
end
StartProcess = function(dir)
    window:open("file:///"..tostring(dir))
end
UpdateEngine = function()
    cake_engine = document:createElement("script")
    cake_engine.src = "https://cdn.jsdelivr.net/gh/Cake-Engine/Cake@master/build/cake.js"
    cake_engine.type = 'text/javascript'
    cake_engine.defer = true
    head = document:getElementsByTagName('head')
    head:appendChild(cake_engine);
end
Destroy = function(component)
    if not component.destroyed then component:Destroy() end
end