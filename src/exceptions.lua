-- Created By Rabia Alhaffar In 12/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

StartConsoleTimer = function()
    console:timer()
end

EndConsoleTimer = function()
    console:timerEnd()
end

Trace = function()
    console:trace()
end

Info = function(title,info)
    console:info(tostring(title)..":\n"..tostring(info))
end

Warn = function(name,description)
    console:warn(tostring(name)..": "..tostring(description))
end

Error = function(name,code,description)
    console:error("\nERROR CODE: "..code.."\nERROR NAME: "..tostring(name) + "\nERROR DESCRIPTION: "..tostring(description))
end

Exception = function(name,code,description)
    window:eval("throw".."\nEXCEPTION CODE: " + code + "\nEXCEPTION NAME: " + tostring(name) + "\nEXCEPTION DESCRIPTION: " + tostring(description))
end