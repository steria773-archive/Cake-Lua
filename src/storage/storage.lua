-- Created By Rabia Alhaffar In 10/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

Save = function(variable_name,value)
    localStorage:setItem(variable_name,JSON:stringify(value))
end

Load = function(variable_name)
    JSON:parse(localStorage:getItem(variable_name))
end

Modify = function(variable_name,new_value)
    localStorage[variable_name] = new_value;
end 

ClearData = function()
    localStorage:clear()
end
