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
    game_song = window.document:createElement("audio")
    game_song.src = source
    game_song:play()
end

Music = { source = "" }
function Music:new(source)
    setmetatable(Music, self)
    self.src = source
    self.music = window.document:createElement("audio")
    self.music.src = self.src
    return Music
end
function Music:Play()
    self.music:play()
end
function Music:Pause()
    self.music:pause()
end
function Music:Resume()
    self.music:play()
end