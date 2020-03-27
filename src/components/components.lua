-- Created By Rabia Alhaffar In 20/March/2020
-- Components Part For Lua
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local math = require("math")
local localStorage = window.localStorage
local JSON = window.JSON

Rectangle = {}
Text = {}
Texture = {}
Circle = {}
Square = {}
RoundedRect = {}
Polygon = {}
Sprite = {}
PolygonLineSides = {}
LinearGradient = {}
RadialGradient = {}
Line = {}
Triangle = {}

function Line:new(pos1,pos2,size,color)
    setmetatable(Line,self)
    self.pos1 = pos1
    self.pos2 = pos2
    self.size = size
    self.color = color
    self.destroyed = false
    self.alpha = 1.0
    if Unknown(self.pos1[1]) then self.pos1[0] = 0 end
    if Unknown(self.pos1[2]) then self.pos1[1] = 0 end
    if Unknown(self.pos2[1]) then self.pos2[0] = 0 end
    if Unknown(self.pos2[2]) then self.pos2[1] = 0 end
    if Unknown(self.size) then self.size = 1 end
    if Unknown(self.color) then self.color = "black" end
    return Line
end

function Line:Draw()
    cakepen.strokeStyle = self.color
    cakepen.lineHeight = self.size
    cakepen.lineWidth = self.size
    if self.destroyed then cakepen.globalAlpha = 0 end
    cakepen:beginPath()
    cakepen:moveTo(self.pos1[1],self.pos1[2])
    cakepen:lineTo(self.pos2[1],self.pos2[2])
    cakepen:stroke()
    cakepen:closePath()
    cakepen.globalAlpha = self.alpha
end

function Line:Update()
    self:Draw()
end

function Line:Resize(size)
    if Unknown(size) then size = self.size end
    self.size = size
end

function Line:Translate(position1,position2)
    self.pos1[1] = position1[1];
    self.pos1[2] = position1[2];
    self.pos2[1] = position2[1];
    self.pos2[2] = position2[2];
end

function Line:Destroy()
    self.destroyed = true
end


function RadialGradient:new(x,y,w,h,r,content)
    setmetatable(RadialGradient,self)
    self.x = x
    self.y = y
    self.width = w
    self.height = h
    self.size = r
    self.radius = r
    self.content = content
    self.gradient = cakepen:createRadialGradient(self.x, self.y, self.radius, self.width, self.height, self.radius)
    for loopdrg in ipairs(content) do
        self.gradient:addColorStop(content[loopdrg][1],content[loopdrg][2])
    end
    return RadialGradient
end

function LinearGradient:new(x,y,w,h,content)
    setmetatable(LinearGradient,self)
    self.x = x
    self.y = y
    self.width = w
    self.height = h
    self.content = content
    self.gradient = cakepen:createRadialGradient(self.x, self.y, self.radius, self.width, self.height, self.radius)
    for loopdlg in ipairs(content) do
        self.gradient:addColorStop(content[loopdlg][1],content[loopdlg][2])
    end
    return LinearGradient
end

function Triangle:new(pos1,pos2,pos3,color)
    setmetatable(Triangle,self)
    self.pos1 = pos1
    self.pos2 = pos2
    self.pos3 = pos3
    self.color = color
    self.destroyed = false
    self.rotated = false
    self.rotationAngle = 0
    self.alpha = 1.0
    if Unknown(self.pos1[1]) then self.pos1[1] = 0 end
    if Unknown(self.pos1[2]) then self.pos1[2] = 0 end
    if Unknown(self.pos2[1]) then self.pos2[1] = 0 end
    if Unknown(self.pos2[2]) then self.pos2[2] = 0 end
    if Unknown(self.pos3[1]) then self.pos3[1] = 0 end
    if Unknown(self.pos3[2]) then self.pos3[2] = 0 end
    if Unknown(self.color) then self.color = "black" end
    return Triangle
end

function Triangle:Draw()
    cakepen.strokeStyle = self.color
    if self.destroyed then cakepen.globalAlpha = 0 end
    if self.rotated then cakepen.rotate(self.rotationAngle) end
    cakepen:beginPath()
    cakepen:moveTo(self.pos1[1],self.pos1[2])
    cakepen:lineTo(self.pos2[1],self.pos2[2])
    cakepen:lineTo(self.pos3[1],self.pos3[2])
    cakepen:lineTo(self.pos1[1],self.pos1[2])
    cakepen:stroke()
    cakepen:closePath()
    cakepen.globalAlpha = self.alpha
    cakepen:rotate(-self.rotationAngle)
end

function Triangle:Update()
    self:Draw()
end

function Triangle:Rotate(angle)
    if Unknown(angle) then angle = 0 end
    self.rotated = true
    self.rotationAngle = angle
end
    
function Triangle:Destroy()
    self.destroyed = true
end

function Triangle:Translate(position1,position2,position3)
    self.pos1[1] = position1[1];
    self.pos1[2] = position1[2];
    self.pos2[1] = position2[1];
    self.pos2[2] = position2[2];
    self.pos3[1] = position3[1];
    self.pos3[2] = position3[2];
end

function PolygonLineSides:new(x,y,size,sides,color,stroke_color,start_angle,anticlockwise,autoupdate)
    setmetatable(PolygonLineSides,self)
    self.x = x
    self.y = y
    self.size = size
    self.sides = sides
    self.color = color
    self.stroke_color = stroke_color
    self.speedX = 0
    self.alpha = 0
    self.rotated = false
    self.name = ""
    self.rotationAngle = 0
    self.speedY = 0
    self.gravitySpeed = 0
    self.gravity = 0
    self.destroyed = false
    self.startangle = start_angle
    self.anticlockwise = anticlockwise
    if autoupdate then self:Update() end
    return PolygonLineSides
end

function PolygonLineSides:UpdatePosition()
    self.gravitySpeed = self.gravitySpeed + self.gravity 
    self.x = self.x + self.speedX
    self.y = self.y + self.speedY
end

function PolygonLineSides:Draw()
    cakepen.globalAlpha = self.alpha
    if Unknown(self.x) then self.x = 0 end
    if Unknown(self.y) then self.y = 0 end
    if Unknown(self.size) then self.size = 1 end
    if Unknown(self.color) then self.color = "black" end
    if Unknown(self.sides) then self.sides = 1 end
    if Unknown(self.anticlockwise) then self.anticlockwise = false end
    if Unknown(self.startangle) then self.startangle = 90 end
    if Unknown(self.stroke) then self.stroke = self.color end
    if self.destroyed then cakepen.globalAlpha = 0 end
    if self.rotated then cakepen:rotate(self.rotationAngle) end
    cakepen.fillStyle = self.color
    cakepen.strokeStyle = self.stroke_color
    cakepen:beginPath()
    a = 360 / self.sides
    if self.anticlockwise then a = -a else a = a end
    cakepen:moveTo(self.x,self.y)
    for i = 1,self.sides,1 do
        cakepen:lineTo(self.size * math.cos(a * i),self.size * math.sin(a * i))
    end
    cakepen:closePath()
    cakepen:fill()
    cakepen.globalAlpha = self.alpha
    cakepen:rotate(-self.rotationAngle)
end
    
function PolygonLineSides:Translate(position_x,position_y)
    if Unknown(position_x) then position_x = self.x end
    if Unknown(position_y) then position_y = self.y end
    self.x = position_x
    self.y = position_y
end

function PolygonLineSides:Rotate(angle)
    self.rotated = true
    self.rotationAngle = angle
end

function PolygonLineSides:Destroy()
    self.destroyed = true
end

function PolygonLineSides:Resize(s)
    self.size = s
end

function PolygonLineSides:Force(force_x,force_y)
    if Unknown(force_x) then force_x = self.speedX end
    if Unknown(force_y) then force_y = self.speedY end
    self.speedX = force_x
    self.speedY = force_y   
end

function PolygonLineSides:Stop()
    self.speedX = 0
    self.speedY = 0
end
    
function PolygonLineSides:Move(position,force)
       if Unknown(force) then force = 0 end
       if position == "up" then self.speedY = math.abs(force) end
       if position == "down" then self.speedY = force end
       if position == "left" then self.speedX = math.abs(force) end
       if position == "right" then self.speedX = force end
end

function PolygonLineSides:AddFeature(feature,code)
    self.feature = code
end

function PolygonLineSides:InPosition(x_pos,y_pos)
    return self.x == x_pos and self.y == y_pos
end

function PolygonLineSides:Update()
    self:UpdatePosition()
    self:Draw()
end

function Text:new(x,y,text,color,font,textAlign,autoupdate)
    setmetatable(Text,self)
    self.x = x
    self.y = y
    self.speedX = 0
    self.speedY = 0
    self.text = text
    self.textAlign = textAlign
    self.alpha = 1
    self.stroke_color = "black"
    self.font = font
    self.color = color
    self.name = ""
    self.rotationAngle = 0
    self.rotated = false
    self.destroyed = false
    self.autoupdate = autoupdate
    if autoupdate then self:Update() end
    return Text
end

function Text:Name(name)
    self.name = name
end

function Text:Destroy()
    self.Destroy = true
end

function Text:Rotate(angle)
    self.rotated = true
    self.rotationAngle = angle
end

    
function Text:Draw()
    if Unknown(self.x) then self.x = 0 end
    if Unknown(self.y) then self.y = 0 end
    if Unknown(self.text) then self.text = "" end
    if Unknown(self.font) then self.font = "12px arial" end
    if Unknown(self.autoupdate) then self.autoupdate = false end
    if Unknown(self.textAlign) then self.textAlign = "" end
    cakepen.globalAlpha = self.alpha
    if Unknown(self.color) then self.color = "black" end
    if Unknown(self.stroke_color) then self.stroke_color = self.color end
    cakepen.fillStyle = self.color
    cakepen.strokeStyle = self.stroke_color
    cakepen.font = self.font
    cakepen.textAlign = self.textAlign
    cakepen.globalAlpha = self.alpha
    if self.destroyed then cakepen.globalAlpha = 0 end
    if self.rotated then cakepen:rotate(self.rotationAngle) end
    cakepen:fillText(self.text,self.x,self.y)
    cakepen:strokeText(self.text,self.x,self.y)
    cakepen.globalAlpha = self.alpha
    cakepen:rotate(-self.rotationAngle)
end
   
function Text:Highlight(text_color)
    self.color = text_color
end

function Text:UpdatePosition()
    self.x = self.x + self.speedX
    self.y = self.y + self.speedY
end

function Text:Update()
    self:UpdatePosition()
    self:Draw()
end

function Text:Stop()
    self.speedX = 0
    self.speedY = 0
end
 
function Text:Translate(pos_x,pos_y)
    if Unknown(pos_x) then pos_x = self.x end
    if Unknown(pos_y) then pos_y = self.y end
    self.x = pos_x
    self.y = pos_y
end

function Text:Force(force_x,force_y)
    if Unknown(force_x) then force_x = self.speedX end
    if Unknown(force_y) then force_y = self.speedY end
    self.speedX = force_x
    self.speedY = force_y
end


function Text:Move(position,force)
    if Unknown(force) then force = 0 end
    if position == "up" then self.speedY = math.abs(force) end
    if position == "down" then self.speedY = force end
    if position == "left" then self.speedX = math.abs(force) end
    if position == "right" then self.speedX = force end
end

function Text:AddFeature(feature,code)
    feature = code
    self.feature = feature
    self.feature.code = code
end

function Text:InPosition(x_pos,y_pos)
    return self.x == x_pos and self.y == y_pos
end

function Polygon:new(points,color,autoupdate)
    setmetatable(Polygon,self)
    self.points = points
    self.x = self.points[1][1]
    self.y = self.points[1][2]
    self.speedX = 0
    self.speedY = 0
    self.color = color
    self.stroke = self.color
    self.gravity = 0
    self.gravitySpeed = 0
    self.color = color
    self.alpha = 1
    self.destroyed = false
    self.autoupdate = autoupdate
    self.rotated = false
    self.rotationAngle = 0
    self.name = ""
    if autoupdate then self:Update() end
    return Polygon
end

function Polygon:Name(name)
    self.name = name
end

function Polygon:UpdatePosition()
    self.gravitySpeed = self.gravitySpeed + self.gravity
    self.x = self.x + self.speedX
    self.y = self.y + self.speedY + self.gravitySpeed
end

function Polygon:Draw()
    if Unknown(self.color) then self.color = "black" end
    if Unknown(self.autoupdate) then self.autoupdate = false end
    cakepen.globalAlpha = self.alpha
    cakepen.fillStyle = self.color
    cakepen.strokeStyle = self.stroke
    if self.destroyed then cakepen.globalAlpha = 0 end
    if self.rotated then cakepen:rotate(self.rotationAngle) end
    cakepen:moveTo(self.points[1][1], self.points[1][2]);
    for i in ipairs(self.points) do
        cakepen:lineTo(self.points[i][1], self.points[i][2])
    end
    cakepen.fill();
    cakepen.stroke();
    cakepen.globalAlpha = self.alpha;
    cakepen.rotate(-self.rotationAngle);
end

function Polygon:Update()
    self:UpdatePosition()
    self:Draw()
end

function Polygon:Accelerate(g)
    self.gravity = g
end

function Polygon:Destroy()
    self.destroyed = true
end

function Polygon:Rotate(a)
    self.rotated = true
    self.rotationAngle = a
end

function Polygon:Stop()
    self.speedX = 0
    self.speedY = 0
end
    
function Polygon:Translate(position_x,position_y)
    if Unknown(position_x) then position_x = self.x end
    if Unknown(position_y) then position_y = self.y end
    self.x = position_x
    self.y = position_y
end
   
function Polygon:Force(force_x,force_y)
    if Unknown(force_x) then force_x = self.speedX end
    if Unknown(force_y) then force_y = self.speedY end
    self.speedX = force_x
    self.speedY = force_y
end

function Polygon:Move(position,force)
    if Unknown(force) then force = 0 end
    if position == "up" then self.speedY = math.abs(force) end
    if position == "down" then self.speedY = force end
    if position == "left" then self.speedX = math.abs(force) end
    if position == "right" then self.speedX = force end
end
    
function Polygon:AddFeature(feature,code)
    feature = code
    self.feature = feature
    self.feature.code = code 
end


function Polygon:InPosition(x_pos,y_pos)
    return self.x == x_pos and self.y == y_pos
end

function Square:new(x,y,size,color,autoupdate)
    setmetatable(Square,self)
    self.x = x
    self.autoupdate = autoupdate
    self.y = y
    self.size = size
    self.height = self.size
    self.width = self.size
    self.h = self.height
    self.w = self.width
    self.speedX = 0
    self.speedY = 0
    self.speed = 0
    self.color = color
    self.gravity = 0
    self.bounce = 0
    self.gravitySpeed = 0
    self.destroyed = false
    self.rotated = false
    self.collidable = true
    self.alpha = 1
    self.stroke = self.color
    self.clicked = false
    self.touched = false
    self.hovered = false
    self.state = "default"
    self.clickFunction = 0
    self.rotationAngle = 0
    self.name = ""
    self.touchPosition = { x = 0,y = 0 }
    self.mousePosition = { x = 0,y = 0 }
    self.isClicking = false
    self.isTouching = false
    self.mousePressed = false
    self.canvasTouched = false
    self:Add()
    if self.autoupdate then self:Update() end
    return Square
end

function Square:SetInteractions(clickF) 
    if Unknown(clickF) then clickF = 0 end
    self.clickFunction = clickF;
end

function Square:Add()
    document:addEventListener("mousemove",function(e) 
        self.mousePosition.x = e.offsetX or e.layerX
        self.mousePosition.x = e.offsetY or e.layerY
    end)

    document:addEventListener("touchmove",function(e)
        self.touchPosition.x = e.pageX or e.clientX
        self.touchPosition.y = e.pageY or e.clientY
    end)
    cakecanvas:addEventListener("touchstart",function()self.canvasTouched = true end)
    cakecanvas:addEventListener("touchend",function() self.canvasTouched = false end)
    cakecanvas:addEventListener('mousedown',function() self.mousePressed = true end)
    cakecanvas:addEventListener('mouseup',function() self.mousePressed = false end)
end

function Square:Name(x)
    self.name = x
end
  
function Square:Draw()
    if Unknown(self.x) then self.x = 0 end
    if Unknown(self.y) then self.y = 0 end
    if Unknown(self.size) then self.size = 0 end
    if Unknown(self.autoupdate) then self.autoupdate = false end
    if Unknown(self.color) then self.color = "black" end		
    cakepen.globalAlpha = self.alpha
    cakepen.strokeStyle = self.stroke
    cakepen.fillStyle = self.color
    if self.destroyed then cakepen.globalAlpha = 0 end
    if self.rotated then cakepen:rotate(self.rotationAngle) end
    cakepen:fillRect(self.x,self.y,self.size,self.size)
    cakepen.globalAlpha = self.alpha
    cakepen:rotate(-self.rotationAngle)
end

function Square:UpdatePosition()
    self.gravitySpeed = self.gravitySpeed + self.gravity
    self.x = self.x + self.speedX
    self.y = self.x + self.speedY + self.gravitySpeed
    if self.mousePosition.x >= self.x and self.mousePosition.x <= self.x + self.size and
       self.mousePosition.y >= self.y and self.mousePosition.y <= self.y + self.size or
       self.touchPosition.x >= self.x and self.touchPosition.x <= self.x + self.size and
       self.touchPosition.y >= self.y and self.touchPosition.y <= self.y + self.size then
       self.state = 'hover'
       self.hovered = true

    if self.mousePressed or self.canvasTouched then
        self.state = 'active'
        if type(self.clickFunction) == "function" and not self.isClicking or not self.isTouching
            then
                self:clickFunction()
            end
        self.isClicking = true
        self.isTouching = true
        self.clicked = true
        self.touched = true
    else self.isClicking = false; self.isTouching = false; self.clicked = false; self.touched = false
    end
else self.state = 'default'
end
end

function Square:Floor()
    if self.y > cakecanvas.height - self.size then self.y = cakecanvas.height - self.size end
end

function Square:FloorAndBounce()
    if self.y > cakecanvas.height - self.size then self.y = cakecanvas.height - self.size;self.gravitySpeed = -(self.gravitySpeed * self.bounce) end
end

function Square:Accelerate(g)
    self.gravity = g
end

function Square:Destroy()
    self.destroyed = true
end

function Square:Rotate(a)
    self.rotated = true
    self.rotationAngle = a
end

function Square:Update()
    self:UpdatePosition()
    self:Draw()
end

function Square:Stop()
    self.speedX = 0
    self.speedY = 0
end

function Square:Translate(position_x,position_y)
    if Unknown(position_x) then position_x = self.x end
    if Unknown(position_y) then position_y = self.y end
    self.x = position_x
    self.y = position_y
end

function Square:Force(force_x,force_y)
    if Unknown(force_x) then force_x = self.speedX end
    if Unknown(force_y) then force_y = self.speedY end
    self.speedX = force_x
    self.speedY = force_y
end

function Square:Move(position,force)
    if Unknown(force) then force = 0 end
    if position == "up" then self.speedY = math.abs(force) end
    if position == "down" then self.speedY = force end
    if position == "left" then self.speedX = math.abs(force) end
    if position == "right" then self.speedX = force end
end

function Square:AddFeature(feature,code)
    feature = code
    self.feature = feature
    self.feature.code = code
end

function Square:InPosition(x_pos,y_pos)
    return self.x == x_pos and self.y == y_pos
end

function Square:Resize(s)
    if Unknown(s) then s = self.size end
    self.size = s
end

function Rectangle:new(x,y,width,height,color,autoupdate)
    setmetatable(Rectangle,self)
    self.x = x
    self.autoupdate = autoupdate
    self.y = y
    self.height = width
    self.width = height
    self.h = self.height
    self.w = self.width
    self.speedX = 0
    self.speedY = 0
    self.speed = 0
    self.color = color
    self.gravity = 0
    self.bounce = 0
    self.gravitySpeed = 0
    self.destroyed = false
    self.rotated = false
    self.collidable = true
    self.alpha = 1
    self.stroke = self.color
    self.clicked = false
    self.touched = false
    self.hovered = false
    self.state = "default"
    self.clickFunction = 0
    self.rotationAngle = 0
    self.name = ""
    self.touchPosition = { x = 0,y = 0 }
    self.mousePosition = { x = 0,y = 0 }
    self.isClicking = false
    self.isTouching = false
    self.mousePressed = false
    self.canvasTouched = false
    self:Add()
    if self.autoupdate then self:Update() end
    return Rectangle
end

function Rectangle:SetInteractions(clickF) 
    if Unknown(clickF) then clickF = 0 end
    self.clickFunction = clickF;
end

function Rectangle:Add()
    document:addEventListener("mousemove",function(e) 
        self.mousePosition.x = e.offsetX or e.layerX
        self.mousePosition.x = e.offsetY or e.layerY
    end)

    document:addEventListener("touchmove",function(e)
        self.touchPosition.x = e.pageX or e.clientX
        self.touchPosition.y = e.pageY or e.clientY
    end)
    cakecanvas:addEventListener("touchstart",function()self.canvasTouched = true end)
    cakecanvas:addEventListener("touchend",function() self.canvasTouched = false end)
    cakecanvas:addEventListener('mousedown',function() self.mousePressed = true end)
    cakecanvas:addEventListener('mouseup',function() self.mousePressed = false end)
end

function Rectangle:Name(x)
    self.name = x
end
  
function Rectangle:Draw()
    if Unknown(self.x) then self.x = 0 end
    if Unknown(self.y) then self.y = 0 end
    if Unknown(self.height) then self.height = 0 end
    if Unknown(self.width) then self.width = 0 end
    if Unknown(self.autoupdate) then self.autoupdate = false end
    if Unknown(self.color) then self.color = "black" end		
    cakepen.globalAlpha = self.alpha
    cakepen.strokeStyle = self.stroke
    cakepen.fillStyle = self.color
    if self.destroyed then cakepen.globalAlpha = 0 end
    if self.rotated then cakepen:rotate(self.rotationAngle) end
    cakepen:fillRect(self.x,self.y,self.width,self.height)
    cakepen.globalAlpha = self.alpha
    cakepen:rotate(-self.rotationAngle)
end

function Rectangle:UpdatePosition()
    self.gravitySpeed = self.gravitySpeed + self.gravity
    self.x = self.x + self.speedX
    self.y = self.x + self.speedY + self.gravitySpeed
    if self.mousePosition.x >= self.x and self.mousePosition.x <= self.x + self.width and
       self.mousePosition.y >= self.y and self.mousePosition.y <= self.y + self.height or
       self.touchPosition.x >= self.x and self.touchPosition.x <= self.x + self.width and
       self.touchPosition.y >= self.y and self.touchPosition.y <= self.y + self.height then
       self.state = 'hover'
       self.hovered = true

    if self.mousePressed or self.canvasTouched then
        self.state = 'active'
        if type(self.clickFunction) == "function" and not self.isClicking or not self.isTouching
            then
                self:clickFunction()
            end
        self.isClicking = true
        self.isTouching = true
        self.clicked = true
        self.touched = true
    else self.isClicking = false; self.isTouching = false; self.clicked = false; self.touched = false
    end
else self.state = 'default'
end
end

function Rectangle:Floor()
    if self.y > cakecanvas.height - self.height then self.y = cakecanvas.height - self.height end
end

function Rectangle:FloorAndBounce()
    if self.y > cakecanvas.height - self.height then self.y = cakecanvas.height - self.height;self.gravitySpeed = -(self.gravitySpeed * self.bounce) end
end

function Rectangle:Accelerate(g)
    self.gravity = g
end

function Rectangle:Destroy()
    self.destroyed = true
end

function Rectangle:Rotate(a)
    self.rotated = true
    self.rotationAngle = a
end

function Rectangle:Update()
    self:UpdatePosition()
    self:Draw()
end

function Rectangle:Stop()
    self.speedX = 0
    self.speedY = 0
end

function Rectangle:Translate(position_x,position_y)
    if Unknown(position_x) then position_x = self.x end
    if Unknown(position_y) then position_y = self.y end
    self.x = position_x
    self.y = position_y
end

function Rectangle:Force(force_x,force_y)
    if Unknown(force_x) then force_x = self.speedX end
    if Unknown(force_y) then force_y = self.speedY end
    self.speedX = force_x
    self.speedY = force_y
end

function Rectangle:Move(position,force)
    if Unknown(force) then force = 0 end
    if position == "up" then self.speedY = math.abs(force) end
    if position == "down" then self.speedY = force end
    if position == "left" then self.speedX = math.abs(force) end
    if position == "right" then self.speedX = force end
end

function Rectangle:AddFeature(feature,code)
    feature = code
    self.feature = feature
    self.feature.code = code
end

function Rectangle:InPosition(x_pos,y_pos)
    return self.x == x_pos and self.y == y_pos
end

function Rectangle:Resize(width,height)
    if Unknown(width) then width = self.width end
    if Unknown(height) then height = self.height end
    self.width = width
    self.height = height
end



function Texture:new(url,x,y,width,height,autoupdate)
    setmetatable(Texture,self)
    self.x = x
    self.autoupdate = autoupdate
    self.y = y
    self.height = width
    self.img = window:eval("new Image();")
    self.img.src = url
    self.width = height
    self.h = self.height
    self.w = self.width
    self.speedX = 0
    self.speedY = 0
    self.speed = 0
    self.gravity = 0
    self.bounce = 0
    self.gravitySpeed = 0
    self.destroyed = false
    self.rotated = false
    self.collidable = true
    self.alpha = 1
    self.stroke = self.color
    self.clicked = false
    self.touched = false
    self.hovered = false
    self.state = "default"
    self.clickFunction = 0
    self.rotationAngle = 0
    self.name = ""
    self.touchPosition = { x = 0,y = 0 }
    self.mousePosition = { x = 0,y = 0 }
    self.isClicking = false
    self.isTouching = false
    self.mousePressed = false
    self.canvasTouched = false
    self:Add()
    if self.autoupdate then self:Update() end
    return Texture
end

function Texture:SetInteractions(clickF) 
    if Unknown(clickF) then clickF = 0 end
    self.clickFunction = clickF;
end

function Texture:Add()
    document:addEventListener("mousemove",function(e) 
        self.mousePosition.x = e.offsetX or e.layerX
        self.mousePosition.x = e.offsetY or e.layerY
    end)

    document:addEventListener("touchmove",function(e)
        self.touchPosition.x = e.pageX or e.clientX
        self.touchPosition.y = e.pageY or e.clientY
    end)
    cakecanvas:addEventListener("touchstart",function()self.canvasTouched = true end)
    cakecanvas:addEventListener("touchend",function() self.canvasTouched = false end)
    cakecanvas:addEventListener('mousedown',function() self.mousePressed = true end)
    cakecanvas:addEventListener('mouseup',function() self.mousePressed = false end)
end

function Texture:Name(x)
    self.name = x
end
  
function Texture:Draw()
    if Unknown(self.x) then self.x = 0 end
    if Unknown(self.y) then self.y = 0 end
    if Unknown(self.autoupdate) then self.autoupdate = false end
    cakepen.globalAlpha = self.alpha
    if self.destroyed then cakepen.globalAlpha = 0 end
    if self.rotated then cakepen:rotate(self.rotationAngle) end
    cakepen:drawImage(self.img,self.x,self.y,self.height,self.width)
    cakepen.globalAlpha = self.alpha
    cakepen:rotate(-self.rotationAngle)
end

function Texture:UpdatePosition()
    self.gravitySpeed = self.gravitySpeed + self.gravity
    self.x = self.x + self.speedX
    self.y = self.x + self.speedY + self.gravitySpeed
    if self.mousePosition.x >= self.x and self.mousePosition.x <= self.x + self.width and
       self.mousePosition.y >= self.y and self.mousePosition.y <= self.y + self.height or
       self.touchPosition.x >= self.x and self.touchPosition.x <= self.x + self.width and
       self.touchPosition.y >= self.y and self.touchPosition.y <= self.y + self.height then
       self.state = 'hover'
       self.hovered = true

    if self.mousePressed or self.canvasTouched then
        self.state = 'active'
        if type(self.clickFunction) == "function" and not self.isClicking or not self.isTouching
            then
                self:clickFunction()
            end
        self.isClicking = true
        self.isTouching = true
        self.clicked = true
        self.touched = true
    else self.isClicking = false; self.isTouching = false; self.clicked = false; self.touched = false
    end
else self.state = 'default'
end
end

function Texture:Floor()
    if self.y > cakecanvas.height - self.height then self.y = cakecanvas.height - self.height end
end

function Texture:FloorAndBounce()
    if self.y > cakecanvas.height - self.height then self.y = cakecanvas.height - self.height;self.gravitySpeed = -(self.gravitySpeed * self.bounce) end
end

function Texture:Accelerate(g)
    self.gravity = g
end

function Texture:Destroy()
    self.destroyed = true
end

function Texture:Rotate(a)
    self.rotated = true
    self.rotationAngle = a
end

function Texture:Update()
    self:UpdatePosition()
    self:Draw()
end

function Texture:Stop()
    self.speedX = 0
    self.speedY = 0
end

function Texture:Translate(position_x,position_y)
    if Unknown(position_x) then position_x = self.x end
    if Unknown(position_y) then position_y = self.y end
    self.x = position_x
    self.y = position_y
end

function Texture:Force(force_x,force_y)
    if Unknown(force_x) then force_x = self.speedX end
    if Unknown(force_y) then force_y = self.speedY end
    self.speedX = force_x
    self.speedY = force_y
end

function Texture:Move(position,force)
    if Unknown(force) then force = 0 end
    if position == "up" then self.speedY = math.abs(force) end
    if position == "down" then self.speedY = force end
    if position == "left" then self.speedX = math.abs(force) end
    if position == "right" then self.speedX = force end
end

function Texture:AddFeature(feature,code)
    feature = code
    self.feature = feature
    self.feature.code = code
end

function Texture:InPosition(x_pos,y_pos)
    return self.x == x_pos and self.y == y_pos
end

function Texture:Resize(width,height)
    if Unknown(width) then width = self.width end
    if Unknown(height) then height = self.height end
    self.width = width
    self.height = height
end



function Circle:new(x,y,radius,color,autoupdate)
    setmetatable(Circle,self)
    self.x = x
    self.autoupdate = autoupdate
    self.y = y
    self.size = radius
    self.a = 90
	self.b = 180 * math.pi
	self.radius = radius
	self.r = self.radius
    self.speedX = 0
    self.speedY = 0
    self.speed = 0
    self.color = color
    self.gravity = 0
    self.bounce = 0
    self.gravitySpeed = 0
    self.destroyed = false
    self.rotated = false
    self.collidable = true
    self.alpha = 1
    self.stroke = self.color
    self.clicked = false
    self.touched = false
    self.hovered = false
    self.state = "default"
    self.clickFunction = 0
    self.rotationAngle = 0
    self.name = ""
    self.touchPosition = { x = 0,y = 0 }
    self.mousePosition = { x = 0,y = 0 }
    self.isClicking = false
    self.isTouching = false
    self.mousePressed = false
    self.canvasTouched = false
    self:Add()
    if self.autoupdate then self:Update() end
    return Circle
end

function Circle:SetInteractions(clickF) 
    if Unknown(clickF) then clickF = 0 end
    self.clickFunction = clickF;
end

function Circle:Add()
    document:addEventListener("mousemove",function(e) 
        self.mousePosition.x = e.offsetX or e.layerX
        self.mousePosition.x = e.offsetY or e.layerY
    end)

    document:addEventListener("touchmove",function(e)
        self.touchPosition.x = e.pageX or e.clientX
        self.touchPosition.y = e.pageY or e.clientY
    end)
    cakecanvas:addEventListener("touchstart",function()self.canvasTouched = true end)
    cakecanvas:addEventListener("touchend",function() self.canvasTouched = false end)
    cakecanvas:addEventListener('mousedown',function() self.mousePressed = true end)
    cakecanvas:addEventListener('mouseup',function() self.mousePressed = false end)
end

function Circle:Name(x)
    self.name = x
end
  
function Circle:Draw()
    if Unknown(self.x) then self.x = 0 end
	if Unknown(self.y) then self.y = 0 end
	if Unknown(self.radius) then self.radius = 1 end
	if Unknown(self.color) then self.color = "black" end
	if Unknown(self.a) then self.a = 90 end
	if Unknown(self.autoupdate) then self.autoupdate = false end
	if Unknown(self.b) then self.b = 180 end
	cakepen.fillStyle = self.color
	cakepen.globalAlpha = self.alpha
	cakepen.strokeStyle = self.stroke
    if self.destroyed then cakepen.globalAlpha = 0 end
    if self.rotated then cakepen:rotate(self.rotationAngle) end
    cakepen:beginPath()
    cakepen:arc(self.x, self.y, self.radius, self.a, self.b)
    cakepen:stroke()
    cakepen:fill()
    cakepen:closePath()
    cakepen.globalAlpha = self.alpha
    cakepen:rotate(-self.rotationAngle)
end

function Circle:UpdatePosition()
    self.gravitySpeed = self.gravitySpeed + self.gravity
    self.x = self.x + self.speedX
    self.y = self.x + self.speedY + self.gravitySpeed
    if self.mousePosition.x >= self.x and self.mousePosition.x <= self.x + self.radius and
       self.mousePosition.y >= self.y and self.mousePosition.y <= self.y + self.radius or
       self.touchPosition.x >= self.x and self.touchPosition.x <= self.x + self.radius and
       self.touchPosition.y >= self.y and self.touchPosition.y <= self.y + self.radius then
       self.state = 'hover'
       self.hovered = true

    if self.mousePressed or self.canvasTouched then
        self.state = 'active'
        if type(self.clickFunction) == "function" and not self.isClicking or not self.isTouching
            then
                self:clickFunction()
            end
        self.isClicking = true
        self.isTouching = true
        self.clicked = true
        self.touched = true
    else self.isClicking = false; self.isTouching = false; self.clicked = false; self.touched = false
    end
else self.state = 'default'
end
end

function Circle:Floor()
    if self.y > cakecanvas.height - self.radius then self.y = cakecanvas.height - self.radius end
end

function Circle:FloorAndBounce()
    if self.y > cakecanvas.height - self.radius then self.y = cakecanvas.height - self.radius;self.gravitySpeed = -(self.gravitySpeed * self.bounce) end
end

function Circle:Accelerate(g)
    self.gravity = g
end

function Circle:Destroy()
    self.destroyed = true
end

function Circle:Rotate(a)
    self.rotated = true
    self.rotationAngle = a
end

function Circle:Update()
    self:UpdatePosition()
    self:Draw()
end

function Circle:Stop()
    self.speedX = 0
    self.speedY = 0
end

function Circle:Resize(r)
    self.radius = r
    self.size = r
end



function Sprite:new(url,x,y,width,height,autoupdate)
    setmetatable(Sprite,self)
    self.x = x
    self.autoupdate = autoupdate
    self.y = y
    self.height = width
    self.url = url
    self.sprites = self.url
    self.img = document:createElement("image")
    self.width = height
    self.h = self.height
    self.w = self.width
    self.speedX = 0
    self.speedY = 0
    self.speed = 0
    self.gravity = 0
    self.bounce = 0
    self.gravitySpeed = 0
    self.destroyed = false
    self.rotated = false
    self.collidable = true
    self.alpha = 1
    self.stroke = self.color
    self.clicked = false
    self.touched = false
    self.hovered = false
    self.state = "default"
    self.clickFunction = 0
    self.rotationAngle = 0
    self.name = ""
    self.touchPosition = { x = 0,y = 0 }
    self.mousePosition = { x = 0,y = 0 }
    self.isClicking = false
    self.isTouching = false
    self.mousePressed = false
    self.canvasTouched = false
    self:Add()
    if self.autoupdate then self:Update() end
    for ps in ipairs(self.sprites) do
        self.sprites.push(self.url[ps])
    end
    self.img.src = self.sprites[0]
    return Sprite
end

function Sprite:SetInteractions(clickF) 
    if Unknown(clickF) then clickF = 0 end
    self.clickFunction = clickF;
end

function Sprite:Add()
    document:addEventListener("mousemove",function(e) 
        self.mousePosition.x = e.offsetX or e.layerX
        self.mousePosition.x = e.offsetY or e.layerY
    end)

    document:addEventListener("touchmove",function(e)
        self.touchPosition.x = e.pageX or e.clientX
        self.touchPosition.y = e.pageY or e.clientY
    end)
    cakecanvas:addEventListener("touchstart",function()self.canvasTouched = true end)
    cakecanvas:addEventListener("touchend",function() self.canvasTouched = false end)
    cakecanvas:addEventListener('mousedown',function() self.mousePressed = true end)
    cakecanvas:addEventListener('mouseup',function() self.mousePressed = false end)
end

function Sprite:Name(x)
    self.name = x
end
  
function Sprite:Draw()
    cakepen.globalAlpha = self.alpha
    if Unknown(self.x) then self.x = 0 end
    if Unknown(self.y) then self.y = 0 end
    if Unknown(self.height) then self.height = 0 end
    if Unknown(self.width) then self.width = 0 end
    if Unknown(self.autoupdate) then self.autoupdate = false end
    if self.destroyed then cakepen.globalAlpha = 0 end
    if self.rotated then cakepen:rotate(self.rotationAngle) end
    cakepen:drawImage(self.img,self.x,self.y,self.height,self.width)
    cakepen.globalAlpha = self.alpha
    cakepen:rotate(-self.rotationAngle)
end

function Sprite:Animate()
    if self.destroyed then cakepen.globalAlpha = 0 end
    if self.rotated then cakepen:rotate(self.rotationAngle) end
    for imgs in ipairs(self.sprites.length) do
        self.img.src = self.sprites[imgs]
        cakepen:drawImage(self.img,self.x,self.y,self.height,self.width)
    end
    cakepen.globalAlpha = 1
    cakepen:rotate(-self.rotationAngle)
end

function Sprite:UpdatePosition()
    self.gravitySpeed = self.gravitySpeed + self.gravity
    self.x = self.x + self.speedX
    self.y = self.x + self.speedY + self.gravitySpeed
    if self.mousePosition.x >= self.x and self.mousePosition.x <= self.x + self.width and
       self.mousePosition.y >= self.y and self.mousePosition.y <= self.y + self.height or
       self.touchPosition.x >= self.x and self.touchPosition.x <= self.x + self.width and
       self.touchPosition.y >= self.y and self.touchPosition.y <= self.y + self.height then
       self.state = 'hover'
       self.hovered = true

    if self.mousePressed or self.canvasTouched then
        self.state = 'active'
        if type(self.clickFunction) == "function" and not self.isClicking or not self.isTouching
            then
                self:clickFunction()
            end
        self.isClicking = true
        self.isTouching = true
        self.clicked = true
        self.touched = true
    else self.isClicking = false; self.isTouching = false; self.clicked = false; self.touched = false
    end
else self.state = 'default'
end
end

function Sprite:Floor()
    if self.y > cakecanvas.height - self.height then self.y = cakecanvas.height - self.height end
end

function Sprite:FloorAndBounce()
    if self.y > cakecanvas.height - self.height then self.y = cakecanvas.height - self.height;self.gravitySpeed = -(self.gravitySpeed * self.bounce) end
end

function Sprite:Accelerate(g)
    self.gravity = g
end

function Sprite:Destroy()
    self.destroyed = true
end

function Sprite:Rotate(a)
    self.rotated = true
    self.rotationAngle = a
end

function Sprite:Update()
    self:UpdatePosition()
    self:Draw()
end

function Sprite:Stop()
    self.speedX = 0
    self.speedY = 0
end

function Sprite:Translate(position_x,position_y)
    if Unknown(position_x) then position_x = self.x end
    if Unknown(position_y) then position_y = self.y end
    self.x = position_x
    self.y = position_y
end

function Sprite:Force(force_x,force_y)
    if Unknown(force_x) then force_x = self.speedX end
    if Unknown(force_y) then force_y = self.speedY end
    self.speedX = force_x
    self.speedY = force_y
end

function Sprite:Move(position,force)
    if Unknown(force) then force = 0 end
    if position == "up" then self.speedY = math.abs(force) end
    if position == "down" then self.speedY = force end
    if position == "left" then self.speedX = math.abs(force) end
    if position == "right" then self.speedX = force end
end

function Sprite:AddFeature(feature,code)
    feature = code
    self.feature = feature
    self.feature.code = code
end

function Sprite:InPosition(x_pos,y_pos)
    return self.x == x_pos and self.y == y_pos
end

function Sprite:Resize(width,height)
    if Unknown(width) then width = self.width end
    if Unknown(height) then height = self.height end
    self.width = width
    self.height = height
end


function RoundedRect:new(x,y,width,height,radius,color,autoupdate)
    setmetatable(RoundedRect,self)
    self.x = x
    self.autoupdate = autoupdate
    self.y = y
    self.width = width
    self.height = height
    self.h = self.height
	self.w = self.width
	self.radius = radius
	self.r = self.radius
    self.speedX = 0
    self.speedY = 0
    self.speed = 0
    self.color = color
    self.gravity = 0
    self.bounce = 0
    self.gravitySpeed = 0
    self.destroyed = false
    self.rotated = false
    self.collidable = true
    self.alpha = 1
    self.stroke = self.color
    self.clicked = false
    self.touched = false
    self.hovered = false
    self.state = "default"
    self.clickFunction = 0
    self.rotationAngle = 0
    self.name = ""
    self.touchPosition = { x = 0,y = 0 }
    self.mousePosition = { x = 0,y = 0 }
    self.isClicking = false
    self.isTouching = false
    self.mousePressed = false
    self.canvasTouched = false
    self:Add()
    if self.autoupdate then self:Update() end
    return RoundedRect
end

function RoundedRect:SetInteractions(clickF) 
    if Unknown(clickF) then clickF = 0 end
    self.clickFunction = clickF;
end

function RoundedRect:Add()
    document:addEventListener("mousemove",function(e) 
        self.mousePosition.x = e.offsetX or e.layerX
        self.mousePosition.x = e.offsetY or e.layerY
    end)

    document:addEventListener("touchmove",function(e)
        self.touchPosition.x = e.pageX or e.clientX
        self.touchPosition.y = e.pageY or e.clientY
    end)
    cakecanvas:addEventListener("touchstart",function()self.canvasTouched = true end)
    cakecanvas:addEventListener("touchend",function() self.canvasTouched = false end)
    cakecanvas:addEventListener('mousedown',function() self.mousePressed = true end)
    cakecanvas:addEventListener('mouseup',function() self.mousePressed = false end)
end

function RoundedRect:Name(x)
    self.name = x
end
  
function RoundedRect:Draw()
    if Unknown(self.x) then self.x = 0 end
	if Unknown(self.y) then self.y = 0 end
	if Unknown(self.height) then self.height = 0 end
	if Unknown(self.width) then self.width = 0 end
	if Unknown(self.color) then self.color = "black" end
	if Unknown(self.radius) then self.radius = 1 end
	if Unknown(self.autoupdate) then self.autoupdate = false end
    cakepen.fillStyle = self.color
    cakepen.strokeStyle = self.stroke
    cakepen.globalAlpha = self.alpha
	if self.destroyed then cakepen.globalAlpha = 0 end
	if self.rotated then cakepen:rotate(self.rotationAngle) end
	cakepen:beginPath()
    cakepen:moveTo(self.x + self.radius,self.y)
    cakepen:lineTo(self.x + self.width - self.radius,self.y)
    cakepen:quadraticCurveTo(self.x + self.width,self.y,self.x + self.width,self.y + self.radius)
    cakepen:lineTo(self.x + self.width,self.y + self.height - self.radius)
    cakepen:quadraticCurveTo(self.x + self.width,self.y + self.height,self.x + self.width - self.radius,self.y + self.height)
    cakepen:lineTo(self.x + self.radius,self.y + self.height)
    cakepen:quadraticCurveTo(self.x,self.y + self.height,self.x,self.y + self.height - self.radius)
    cakepen:lineTo(self.x,self.y + self.radius)
    cakepen:quadraticCurveTo(self.x,self.y,self.x + self.radius,self.y)
    cakepen:closePath()
	cakepen:fill()
	cakepen.globalAlpha = self.alpha
	cakepen:rotate(-self.rotationAngle)
end

function RoundedRect:UpdatePosition()
    self.gravitySpeed = self.gravitySpeed + self.gravity
    self.x = self.x + self.speedX
    self.y = self.x + self.speedY + self.gravitySpeed
    if self.mousePosition.x >= self.x and self.mousePosition.x <= self.x + self.width and
       self.mousePosition.y >= self.y and self.mousePosition.y <= self.y + self.height or
       self.touchPosition.x >= self.x and self.touchPosition.x <= self.x + self.width and
       self.touchPosition.y >= self.y and self.touchPosition.y <= self.y + self.height then
       self.state = 'hover'
       self.hovered = true

    if self.mousePressed or self.canvasTouched then
        self.state = 'active'
        if type(self.clickFunction) == "function" and not self.isClicking or not self.isTouching
            then
                self:clickFunction()
            end
        self.isClicking = true
        self.isTouching = true
        self.clicked = true
        self.touched = true
    else self.isClicking = false; self.isTouching = false; self.clicked = false; self.touched = false
    end
else self.state = 'default'
end
end

function RoundedRect:Floor()
    if self.y > cakecanvas.height - self.height then self.y = cakecanvas.height - self.height end
end

function RoundedRect:FloorAndBounce()
    if self.y > cakecanvas.height - self.height then self.y = cakecanvas.height - self.height;self.gravitySpeed = -(self.gravitySpeed * self.bounce) end
end

function RoundedRect:Accelerate(g)
    self.gravity = g
end

function RoundedRect:Destroy()
    self.destroyed = true
end

function RoundedRect:Rotate(a)
    self.rotated = true
    self.rotationAngle = a
end

function RoundedRect:Update()
    self:UpdatePosition()
    self:Draw()
end

function RoundedRect:Stop()
    self.speedX = 0
    self.speedY = 0
end

function RoundedRect:Translate(position_x,position_y)
    if Unknown(position_x) then position_x = self.x end
    if Unknown(position_y) then position_y = self.y end
    self.x = position_x
    self.y = position_y
end

function RoundedRect:Force(force_x,force_y)
    if Unknown(force_x) then force_x = self.speedX end
    if Unknown(force_y) then force_y = self.speedY end
    self.speedX = force_x
    self.speedY = force_y
end

function RoundedRect:Move(position,force)
    if Unknown(force) then force = 0 end
    if position == "up" then self.speedY = math.abs(force) end
    if position == "down" then self.speedY = force end
    if position == "left" then self.speedX = math.abs(force) end
    if position == "right" then self.speedX = force end
end

function RoundedRect:AddFeature(feature,code)
    feature = code
    self.feature = feature
    self.feature.code = code
end

function RoundedRect:InPosition(x_pos,y_pos)
    return self.x == x_pos and self.y == y_pos
end

function RoundedRect:Resize(width,height)
    if Unknown(width) then width = self.width end
    if Unknown(height) then height = self.height end
    self.width = width
    self.height = height
end