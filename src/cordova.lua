-- Created By Rabia Alhaffar In 19/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

CORDOVA_GetDeviceInfo = function()
    window:eval([[console.info(`Device Informations:\nDevice Model: ${ device.model }\nDevice Manufacturer: ${ device.manufacturer }\nDevice Version: ${ device.version }\nDevice UUID: ${ device.uuid }\nDevice Serial Number: ${ device.serial }\nOperating System: ${ device.platform }\nCordova Version: ${ device.cordova }\nEmulated: ${ device.isVirtual }`);]])
end

CORDOVA_ShowSplashscreen = function()
    navigator.splashscreen:show()
end

CORDOVA_HideSplashscreen = function()
    navigator.splashscreen:hide()
end

CORDOVA_SetStatusBar = function(color,color_name,isWebView)
    if isWebView then
        window:eval("StatusBar.overlaysWebView(true);")
    end

    if color == "default" then
        window:eval("StatusBar.styleDefault();")
    end

    if color == "name" then
        window:eval("StatusBar.backgroundColorByName("..color_name..");")
    end

    if color == "light-content" then
        window:eval("StatusBar.styleLightContent();")
    end

    if color == "black-transculent" then
        window:eval("StatusBar.styleBlackTransculent();")
    end

    if color == "black-opaque" then
        window:eval("StatusBar.styleBlackOpaque();")
    end

    if color == "hex" then
        window:eval("StatusBar.backgroundColorByHexString("..color_name..");")
    end	
end

CORDOVA_ShowStatusBar = function()
    window:eval("StatusBar.show()")
end

CORDOVA_HideStatusBar = function()
    window:eval("StatusBar.hide()")
end

CORDOVA_CancelVibration = function()
    navigator:vibrate(0)
end

CORDOVA_StatusBarVisible = function()
    window:eval("return(StatusBar.isVisible);")
end