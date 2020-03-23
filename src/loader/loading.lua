-- Created By Rabia Alhaffar In 13/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

LoadingImageSource = ""
LoadingImageTime = 0
LoadingLevelTime = 0
LoadingLevel = 0
StartingLevel = 0
LoadingLevelAvailable = false
LoadLevelInsteadOfImage = false
LoadingImagesAvailable = false

SetLoadingImage = function(src,level,time)
    StartingLevel = level
    LoadingImagesAvailable = true
    LoadingImageSource = tostring(src)
    LoadingImageTime = time
    __loadingscreen()
end

SetLoadingLevel = function(loading_level,level,time)
    LoadingLevel = loading_level
    LoadingLevelAvailable = true
    LoadingLevelTime = time
    StartingLevel = level
    __loadingscreen()
end

__loadingscreen = function()
    window.onload = function()
        if LoadingImagesAvailable then
            cakecanvas.style.backgroundImage = "url("..LoadingImageSource..")"
            window:setTimeout(function()
                cakecanvas.style.backgroundImage = "none"
                ClearCanvas()
                StartingLevel:Start()
            end,LoadingImageTime)
        end
        if not LoadingImagesAvailable then
            LoadLevelInsteadOfImage = true
        end
        if LoadLevelInsteadOfImage and LoadingLevelAvailable then
            LoadingLevel:Start()
            window:setTimeout(function()
                LoadingLevel:Pause()
                LoadingLevel:Switch(StartingLevel)	
            end,LoadingLevelTime)
        end
    end
end
