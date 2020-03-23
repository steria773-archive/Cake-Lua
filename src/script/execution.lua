-- Created By Rabia Alhaffar In 7/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

scripts_added = 0

Execute = function(code,loop,ms)
    if loop == 0 then window:setTimeout(code,0) end
    if loop == 1 then window:setTimeout(code,ms) end
    if loop == 2 then window:setInterval(code,0) end
    if loop == 3 then window:setInterval(code,ms) end
end

Import = function(script_source)
    script = document:createElement("script")
    script.src = tostring(script_source)
    script.type = "application/lua"
    script.async = true
    head = document:getElementsByTagName('head')
    head:appendChild(script)
end

AddJavaScript = function(script_source)
    script = document:createElement("script")
    script.src = tostring(script_source)
    script.type = "text/javascript"
    script.defer = true
    document:getElementsByTagName('head')[scripts_added]:appendChild(script)
    scripts_added = scripts_added + 1
end
