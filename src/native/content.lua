-- Created By Rabia Alhaffar In 11/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON
AddContent = function(source,w,h)
    content = document:createElement("object")
    content.data = source
    content.width = w
    content.height = h
    body = document:getElementsByTagName("body")
    body:appendChild(content)
end
