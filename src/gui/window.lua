-- Created By Rabia Alhaffar In 16/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

Window = 
{ 
    x = 0,
    y = 0,
    width = 0,
    height = 0,
    src = ""
}
function Window:new(source,x,y,width,height)
    setmetatable(Window, self)
    self.src = source
    self.w = width
    self.h = height
    self.x = x
    self.y = y
    self.Win = 0
    self.resizable = "yes"
    self.height = "height="..self.h
    self.width = "width="..self.w
    self.left = "left="..self.x
    self.top = "top="..self.y
    return Window
end

function Window:Init()
    self.Win = window:open(self.src,"",self.width..","..self.height..","..self.left..","..self.top..",".."resizable="..self.resizable)
end

function Window:Translate(x,y)
    if Unknown(x) then x = 0 end
    if Unknown(y) then y = 0 end
    self.Win:moveTo(x,y)
end

function Window:Move(x,y)
    if Unknown(x) then x = 0 end
    if Unknown(y) then y = 0 end
    self.Win:moveBy(x,y)
end

function Window:Resize(width,height)
    if Unknown(h) then h = 0 end
    if Unknown(w) then w = 0 end
    self.Win:resizeTo(width,height) 
end

function Window:Scale(width,height)
    if Unknown(h) then h = 0 end
    if Unknown(w) then w = 0 end
    self.Win:resizeBy(width,height)
end

function Window:Close()
    self.Win:close()
end

function Window:Pause()
    self.Win:stop()
end

function Window:Write(w)
    if Unknown(w) then w = "" end 
    self.Win.document:write(w)
end

function Window:WriteLine(wl)
    if Unknown(wl) then wl = "" end
    self.Win.document:writeln(wl)
end
