-- Created By Rabia Alhaffar In 10/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

Level =
{
    played = false,
    resumed = false,
    paused = false,
    started = false,
    callback = 0,
    interval = 0
}

function Level:new(code,frames_per_second)
    setmetatable(Level, self)
    self.fps = frames_per_second
    self.callback = code
    self.resumed = false 
    self.played = false 
    self.paused = false
    self.started = false
    return Level
end

function Level:Play()
    self.interval = window:setInterval(self.callback,1000 / self.fps); 
    self.started = true
    self.played = true
end

function Level:Pause()
    window:clearInterval(self.interval);
    self.started = true
    self.played = false
    self.resumed = false
    self.paused = true
end

function Level:Start() 
    self:Play()
    self.started = true
    self.played = true
end

function Level:Resume()
    self:Start();
    self.started = true
    self.played = true
    self.resumed = true
end

function Level:Unlimit()
    self.fps = 1
end

function Level:Switch(level)
    self:Pause()
    level:Start()
end

function Level:SetFPS(new_fps)
    self.fps = new_fps
end

SetFPS = function(level,new_fps)
    level.fps = new_fps
end

DrawFPS = function(level)
    cakepen.font = "20px arial"
    cakepen.fillStyle = "black"
    cakepen:fillText("FPS: " + level.fps,30,30)
end
