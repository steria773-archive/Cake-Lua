-- Created By Rabia Alhaffar In 10/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

Opera = navigator.userAgent:indexOf("Opera") > -1 or navigator.userAgent:indexOf("OPR") > -1
Firefox = navigator.userAgent:indexOf("Firefox") > -1
Safari = navigator.userAgent:indexOf("Safari") > -1
IE = navigator.userAgent:indexOf("Trident") > -1
Chrome = navigator.userAgent:indexOf("Chrome") > -1
Edge = navigator.userAgent:indexOf("Edge") > -1
SamsungInternet = navigator.userAgent:indexOf("SamsungBrowser") > -1

JRE = navigator:javaEnabled()
Language = navigator.language
Online = navigator.onLine

OpenURL = function(url)
    window:open(tostring(url))
end

ReloadHistory = function()
    window.location:reload()
end 

NextHistory = function()
    window.history:forward()
end

BackHistory = function()
    window.history:back()
end
