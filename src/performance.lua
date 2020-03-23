-- Created By Rabia Alhaffar In 10/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

calltime = window.performance:now()

GetPerformance = function()
    print("Calling Functions Performance: "..tostring(calltime).." Milliseconds");
end