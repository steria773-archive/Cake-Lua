-- Created By Rabia Alhaffar In 15/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

Is = function(a,b,c)
    if a == b then 
        window:setTimeout(c,0)
    end
    return a == b,a,b,c
end