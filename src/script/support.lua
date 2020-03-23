-- Created By Rabia Alhaffar In 12/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

JAVA = function()
    return navigator:javaEnabled()
end

ONLINE = function()
    return navigator.onLine
end

WEBVR = function()
    return navigator:getVRDisplays()
end

-- Kept IIFE That Uses Eval() For Some Reasons
WEBXR = function()
    window:eval([[(() => { return("xr" in window.navigator); })();]])
end

WEBM = function()
    return (document:createElement("video"):canPlayType("video/webm"))
end

WAV = function()
    return (document:createElement("audio"):canPlayType("audio/wav"))
end

OGG = function()
    return (document:createElement("audio"):canPlayType("audio/ogg"))
end

MP4 = function()
    return (document:createElement("video"):canPlayType("video/mp4"))
end

AIFF = function()
    return (document:createElement("audio"):canPlayType("audio/x-aiff"))
end

MPEG = function()
    return (document:createElement("audio"):canPlayType("audio/mpeg"))
end

MP3 = function()
    return (document:createElement("audio"):canPlayType("audio/mp3"))
end

CANVAS = function()
    return ((document:createElement("canvas").getContext) and (document:createElement("canvas"):getContext("2d")))
end

WEBGL = function()
    return ((document:createElement("canvas").getContext) and (document:createElement("canvas"):getContext("2d")) and (document:createElement("canvas"):getContext("webgl")) or (document:createElement("canvas"):getContext("experimental-webgl")))
end
