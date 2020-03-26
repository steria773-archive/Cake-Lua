-- Created By Rabia Alhaffar In 26/March/2020
-- Lua Port Of Cake's Video Core
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

PlayVideo = function(src)
    video = window.document:createElement("video")
    video.src = src
    video.loop = false
    cakepen:drawImage(video,0,0,cakecanvas.width,cakecanvas.height)
    video.onended = function()
        video.parentNode:removeChild(video)
    end
end

Video = { source = "" }
function Video:new(src)
    setmetatable(Video, self)
    self.src = src
    self.video = window.document:createElement("video")
    self.video.src = self.src
    self.video.src = self.src
    self.video.loop = false
    self.video.controls = false
    self.removeonfinish = false
    return Video
end
function Video:Play()
    if not self.video.autoplay then self.video:play() end
    cakepen:drawImage(self.video,0,0,cakecanvas.width,cakecanvas.height) 
    if self.removeonfinish then
        self.video.onended = function()
            self.video.parentNode:removeChild(self.video)
        end
    end
end
function Video:Pause()
    self.video:pause()
end
function Video:Resume()
    self.video:play()
end
function Video:Reload()
    self.video:load()
end
function Video:SetVolume(v)
    self.video.volume = v
end
function Video:SetSource(src)
    self.video.src = src
    self.video:load()
end
function Video:ShowControls()
    self.video.controls = true
end
function Video:HideControls()
    self.video.controls = false
end
function Video:Mute()
    self.video.muted = true
end
function Video:UnMute()
    self.video.muted = false
end
function Video:EnableLoop()
    self.video.loop = true
end
function Video:DisableLoop()
    self.video.loop = false
end
function Video:paused()
    return self.video.paused
end
function Video:finished()
    return self.video.ended
end
function Video:muted()
    return self.video.muted
end
function Video:EnablePreload()
    self.video.preload = "auto"
end
function Video:DisablePreload()
    self.video.preload = "none"
end
function Video:RemoveWhenFinish()
    self.removeonfinish = true
end