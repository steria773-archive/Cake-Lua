-- Created By Rabia Alhaffar In 7/March/2020
-- Lua Port Of Cake's Audio Core
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

PlayAudio = function(source)
    audio = window.document:createElement("audio")
    audio.src = source
    audio:play()
end

Music = { source = "" }
function Music:new(source)
    setmetatable(Music, self)
    self.src = source
    self.audio = window.document:createElement("audio")
    self.audio.src = self.src
    return Music
end
function Music:Play()
    self.audio:play()
end
function Music:Pause()
    self.audio:pause()
end
function Music:Resume()
    self.audio:play()
end
function Music:Reload()
    self.audio:load()
end
function Music:SetVolume(v)
    self.audio.volume = v
end
function Music:SetSource(src)
    self.audio.src = src
    self.audio:load()
end
function Music:ShowControls()
    self.audio.controls = true
end
function Music:HideControls()
    self.audio.controls = false
end
function Music:Mute()
    self.audio.muted = true
end
function Music:UnMute()
    self.audio.muted = false
end
function Music:EnableLoop()
    self.audio.loop = true
end
function Music:DisableLoop()
    self.audio.loop = false
end
function Music:paused()
    return self.audio.paused
end
function Music:finished()
    return self.audio.ended
end
function Music:muted()
    return self.audio.muted
end
function Music:EnablePreload()
    self.audio.preload = "auto"
end
function Music:DisablePreload()
    self.audio.preload = "none"
end