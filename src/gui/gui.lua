-- Created By Rabia Alhaffar In 17/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

-- Tables For OOPs 
Button = { x = 0,y = 0,width = 0,height = 0 }
RoundedButton = { x = 0,y = 0,width = 0,height = 0,radius = 0 }
CircleButton = { x = 0,y = 0,radius = 0 }
ImagedButton = { x = 0,y = 0,width = 0,height = 0 }
Checkbox = { x = 0,y = 0,size = 0 }
Bar = { x = 0,y = 0,width = 0,height = 0 }


-- Bar
function Bar:new(x,y,width,height,color)
    setmetatable(Bar,self)
    self.x = x
    self.y = y
    self.height = height
    self.width = width
    self.color = color
    self.resizeAmount = 0
    self.resizeMode = "none"
    self.alpha = 1
    self.destroyed = false
    if Unknown(self.color) then self.color = "black" end
    return Bar
end

function Bar:UpdatePosition()
    if self.resizeMode == "width" then
        self.width = self.width + self.resizeAmount
    end
    if self.resizeMode == "height" then
        self.height = self.height + self.resizeAmount
    end    
end

function Bar:Draw()
    if Unknown(self.x) then self.x = 0 end
    if Unknown(self.y) then self.y = 0 end
    if Unknown(self.height) then self.height = 0 end
    if Unknown(self.width) then self.width = 0 end
    cakepen.fillStyle = self.color
    if self.destroyed then cakepen.globalAlpha = 0 end
    cakepen:fillRect(self.x,self.y,self.width,self.height)
    cakepen.globalAlpha = self.alpha
end

function Bar:Destroy()
    self.destroyed = true
end

function Bar:Update(resizing_way,amount)
    self.resizeMode = resizing_way
    self.resizeAmount = self.resizeAmount + amount
    self:UpdatePosition()
    self:Draw()
end

-- Buttons
-- Rectangle Button
function Button:new(x,y,width,height,text,colors,clickCB) 
    setmetatable(Button,self)
    self.x = x
    self.y = y
    self.width = width
    self.clickCB = clickCB
    self.height = height
    self.colors = colors
    self.textColor = "black"
    self.text = text
    self.alpha = 1
    self.destroyed = false
    self.state = "default"
    self.isClicking = false
    self.isTouching = false
    self.mousePosition = { x = 0, y = 0 }
    self.touchPosition = { x = 0, y = 0 }
    self.mousePressed = false
    self.canvasTouched = false
    self:Add()
    return Button
end

function Button:Add()
    cakecanvas:addEventListener('mousemove',function(event)
        self.mousePosition.x = event.offsetX or event.layerX
        self.mousePosition.y = event.offsetY or event.layerY 
    end)
    cakecanvas:addEventListener("touchmove",function(event)
        self.touchPosition.x = event.pageX or event.clientX
        self.touchPosition.y = event.pageY or event.clientY
    end)
    cakecanvas:addEventListener("touchstart",function()
        self.canvasTouched = true 
    end)
    cakecanvas:addEventListener("touchend",function()
        self.canvasTouched = false 
    end)
    cakecanvas:addEventListener('mousedown',function()
        mousePressed = true
    end)
    cakecanvas:addEventListener('mouseup',function()
        mousePressed = false
    end)
end

function Button:UpdatePosition()
    if self.mousePosition.x >= self.x and self.mousePosition.x <= self.x + self.width and
       self.mousePosition.y >= self.y and self.mousePosition.y <= self.y + self.height or
       self.touchPosition.x >= self.x and self.touchPosition.x <= self.x + self.width and
       self.touchPosition.y >= self.y and self.touchPosition.y <= self.y + self.height then
        self.state = 'hover' 
    end

    if self.mousePressed or self.canvasTouched then
        self.state = 'active'
        if type(self.clickCB) == "function" and not self.isClicking or not self.isTouching then
            self.clickCB()
            self.isClicking = true
            self.isTouching = true
        end
        if not type(self.clickCB) == "function" and not self.isClicking or not self.isTouching then 
            self.isClicking = false
            self.isTouching = false
        else self.state = "default"
        end
    end
end

function Button:Draw() 
    colors = self.colors[self.state]
    halfH = self.height / 2
    if self.destroyed then cakepen.globalAlpha = 0 end

    cakepen.fillStyle = self.colors.top
    cakepen:fillRect(self.x,self.y,self.width,halfH)
    cakepen.fillStyle = self.colors.bottom
    cakepen:fillRect(self.x,self.y + halfH,self.width, halfH)

    size = cakepen:measureText(self.text)
    x = self.x + (self.width - size.width) / 2
    y = self.y + (self.height - 15) / 2 + 12
    cakepen.fillStyle = self.textColor
    cakepen:fillText(self.text, x, y)
    cakepen.globalAlpha = self.alpha
end

function Button:Update()
    self:UpdatePosition()
    self:Draw()
end

function Button:Destroy()
    self.destroyed = true
end

-- Circled Button
function CircleButton:new(x,y,radius,text,colors,clickCB) 
    setmetatable(CircleButton,self)
    self.x = x
    self.y = y
    self.radius = radius
    self.clickCB = clickCB
    self.colors = colors
    self.textColor = "black"
    self.text = text
    self.alpha = 1
    self.destroyed = false
    self.state = "default"
    self.isClicking = false
    self.isTouching = false
    self.mousePosition = { x = 0, y = 0 }
    self.touchPosition = { x = 0, y = 0 }
    self.mousePressed = false
    self.canvasTouched = false
    self:Add()
    return CircleButton
end

function CircleButton:Add()
    cakecanvas:addEventListener('mousemove',function(event)
        self.mousePosition.x = event.offsetX or event.layerX
        self.mousePosition.y = event.offsetY or event.layerY 
    end)
    cakecanvas:addEventListener("touchmove",function(event)
        self.touchPosition.x = event.pageX or event.clientX
        self.touchPosition.y = event.pageY or event.clientY
    end)
    cakecanvas:addEventListener("touchstart",function()
        self.canvasTouched = true 
    end)
    cakecanvas:addEventListener("touchend",function()
        self.canvasTouched = false 
    end)
    cakecanvas:addEventListener('mousedown',function()
        mousePressed = true
    end)
    cakecanvas:addEventListener('mouseup',function()
        mousePressed = false
    end)
end

function CircleButton:UpdatePosition()
    if self.mousePosition.x >= self.x and self.mousePosition.x <= self.x + self.radius and
       self.mousePosition.y >= self.y and self.mousePosition.y <= self.y + self.radius or
       self.touchPosition.x >= self.x and self.touchPosition.x <= self.x + self.radius and
       self.touchPosition.y >= self.y and self.touchPosition.y <= self.y + self.radius then
        self.state = 'hover' 
    end

    if self.mousePressed or self.canvasTouched then
        self.state = 'active'
        if type(self.clickCB) == "function" and not self.isClicking or not self.isTouching then
            self.clickCB()
            self.isClicking = true
            self.isTouching = true
        end
        if not type(self.clickCB) == "function" and not self.isClicking or not self.isTouching then 
            self.isClicking = false
            self.isTouching = false
        else self.state = "default"
        end
    end
end

function CircleButton:Draw() 
    colors = self.colors[self.state]
    if self.destroyed then cakepen.globalAlpha = 0 end
    cakepen.fillStyle = colors.top
    cakepen:arc(self.x, self.y, self.radius,90,180 * math.pi)
    cakepen.fillStyle = colors.bottom
    cakepen:arc(self.x, self.y + self.radius / 2, self.radius,90,180 * math.pi)
    size = cakepen:measureText(self.text)
    x = self.x + (self.radius - size.width) / 2
    y = self.y + (self.radius - 15) / 2 + 12
    cakepen.fillStyle = self.textColor
    cakepen:fillText(self.text, x, y)
    cakepen.globalAlpha = self.alpha
end

function CircleButton:Update()
    self:UpdatePosition()
    self:Draw()
end

function CircleButton:Destroy()
    self.destroyed = true
end


-- Rounded Rectangle Button
function RoundedButton:new(x,y,width,height,radius,text,colors,clickCB) 
    setmetatable(RoundedButton,self)
    self.x = x
    self.y = y
    self.radius = radius
    self.width = width
    self.clickCB = clickCB
    self.height = height
    self.colors = colors
    self.textColor = "black"
    self.text = text
    self.alpha = 1
    self.destroyed = false
    self.state = "default"
    self.isClicking = false
    self.isTouching = false
    self.mousePosition = { x = 0, y = 0 }
    self.touchPosition = { x = 0, y = 0 }
    self.mousePressed = false
    self.canvasTouched = false
    self:Add()
    return RoundedButton
end

function RoundedButton:Add()
    cakecanvas:addEventListener('mousemove',function(event)
        self.mousePosition.x = event.offsetX or event.layerX
        self.mousePosition.y = event.offsetY or event.layerY 
    end)
    cakecanvas:addEventListener("touchmove",function(event)
        self.touchPosition.x = event.pageX or event.clientX
        self.touchPosition.y = event.pageY or event.clientY
    end)
    cakecanvas:addEventListener("touchstart",function()
        self.canvasTouched = true 
    end)
    cakecanvas:addEventListener("touchend",function()
        self.canvasTouched = false 
    end)
    cakecanvas:addEventListener('mousedown',function()
        mousePressed = true
    end)
    cakecanvas:addEventListener('mouseup',function()
        mousePressed = false
    end)
end

function RoundedButton:UpdatePosition()
    if self.mousePosition.x >= self.x and self.mousePosition.x <= self.x + self.width and
       self.mousePosition.y >= self.y and self.mousePosition.y <= self.y + self.height or
       self.touchPosition.x >= self.x and self.touchPosition.x <= self.x + self.width and
       self.touchPosition.y >= self.y and self.touchPosition.y <= self.y + self.height then
        self.state = 'hover' 
    end

    if self.mousePressed or self.canvasTouched then
        self.state = 'active'
        if type(self.clickCB) == "function" and not self.isClicking or not self.isTouching then
            self.clickCB()
            self.isClicking = true
            self.isTouching = true
        end
        if not type(self.clickCB) == "function" and not self.isClicking or not self.isTouching then 
            self.isClicking = false
            self.isTouching = false
        else self.state = "default"
        end
    end
end

function RoundedButton:Draw()
    colors = self.colors[self.state]
    halfR = self.radius / 2
    
    if self.destroyed then cakepen.globalAlpha = 0 end
    cakepen:beginPath()

     -- Part 1 Of Button
    cakepen.fillStyle = colors.top
    cakepen:moveTo(self.x + self.radius,self.y)
    cakepen:lineTo(self.x + self.width - self.radius,self.y)
    cakepen:quadraticCurveTo(self.x + self.width,self.y,self.x + self.width,self.y + self.radius)
    cakepen:lineTo(self.x + self.width,self.y + self.height - self.radius)
    cakepen:quadraticCurveTo(self.x + self.width,self.y + self.height,self.x + self.width - self.radius,self.y + self.height)

    -- Part 2 Of Button
    cakepen.fillStyle = colors.bottom
    cakepen:lineTo(self.x + self.radius,self.y + self.height)
    cakepen:quadraticCurveTo(self.x,self.y + self.height,self.x,self.y + self.height - self.radius)
    cakepen:lineTo(self.x,self.y + self.radius)
    cakepen:quadraticCurveTo(self.x,self.y,self.x + self.radius,self.y)
    cakepen:closePath()
    
    -- Text
    size = cakepen:measureText(self.text)
    x = self.x + (self.radius - size.width) / 2
    y = self.y + (self.radius - 15) / 2 + 12
    cakepen.fillStyle = self.textColor
    cakepen:fillText(self.text, x, y)
    cakepen.globalAlpha = self.alpha
end

function RoundedButton:Update()
    self:UpdatePosition()
    self:Draw()
end

function RoundedButton:Destroy()
    self.destroyed = true
end

-- Imaged Button
function ImagedButton:new(x,y,width,height,text,img_src,clickCB) 
    setmetatable(ImagedButton,self)
    self.x = x
    self.y = y
    self.width = width
    self.clickCB = clickCB
    self.height = height
    self.img = document:createElement("image")
    self.img.src = img_src
    self.textColor = "black"
    self.text = text
    self.alpha = 1
    self.radius = 1
    self.destroyed = false
    self.state = "default"
    self.isClicking = false
    self.isTouching = false
    self.mousePosition = { x = 0, y = 0 }
    self.touchPosition = { x = 0, y = 0 }
    self.mousePressed = false
    self.canvasTouched = false
    self:Add()
    return ImagedButton
end

function ImagedButton:Add()
    cakecanvas:addEventListener('mousemove',function(event)
        self.mousePosition.x = event.offsetX or event.layerX
        self.mousePosition.y = event.offsetY or event.layerY 
    end)
    cakecanvas:addEventListener("touchmove",function(event)
        self.touchPosition.x = event.pageX or event.clientX
        self.touchPosition.y = event.pageY or event.clientY
    end)
    cakecanvas:addEventListener("touchstart",function()
        self.canvasTouched = true 
    end)
    cakecanvas:addEventListener("touchend",function()
        self.canvasTouched = false 
    end)
    cakecanvas:addEventListener('mousedown',function()
        mousePressed = true
    end)
    cakecanvas:addEventListener('mouseup',function()
        mousePressed = false
    end)
end

function ImagedButton:UpdatePosition()
    if self.mousePosition.x >= self.x and self.mousePosition.x <= self.x + self.width and
       self.mousePosition.y >= self.y and self.mousePosition.y <= self.y + self.height or
       self.touchPosition.x >= self.x and self.touchPosition.x <= self.x + self.width and
       self.touchPosition.y >= self.y and self.touchPosition.y <= self.y + self.height then
        self.state = 'hover' 
    end

    if self.mousePressed or self.canvasTouched then
        self.state = 'active'
        if type(self.clickCB) == "function" and not self.isClicking or not self.isTouching then
            self.clickCB()
            self.isClicking = true
            self.isTouching = true
        end
        if not type(self.clickCB) == "function" and not self.isClicking or not self.isTouching then 
            self.isClicking = false
            self.isTouching = false
        else self.state = "default"
        end
    end
end

function ImagedButton:Draw() 
    if self.destroyed then cakepen.globalAlpha = 0 end
    
    -- Image
    cakepen:drawImage(self.img, self.x , self.y, self.width, self.height)

    -- Text
    size = cakepen:measureText(self.text)
    x = self.x + (self.radius - size.width) / 2
    y = self.y + (self.radius - 15) / 2 + 12
    cakepen.fillStyle = self.textColor
    cakepen:fillText(self.text, x, y)
    cakepen.globalAlpha = self.alpha
end

function ImagedButton:Update()
    self:UpdatePosition()
    self:Draw()
end

function ImagedButton:Destroy()
    self.destroyed = true
end

-- Checkbox
function Checkbox:new(x,y,size,color,clickCB) 
    setmetatable(Checkbox,self)
    self.x = x
    self.y = y
    self.size = size
    self.width = self.size
    self.height = self.size
    self.color = color
    self.alpha = 1
    self.lineSize = self.size / 5
    self.destroyed = false
    self.clicked = false
    self.touched = false
    self.hovered = false
    self.checked = false
    self.state = "default"
    self.isTouching = false
    self.mousePosition = { x = 0, y = 0 }
    self.touchPosition = { x = 0, y = 0 }
    self.mousePressed = false
    self.canvasTouched = false
    self:Add()
    return Checkbox
end

function Checkbox:Add()
    cakecanvas:addEventListener('mousemove',function(event)
        self.mousePosition.x = event.offsetX or event.layerX
        self.mousePosition.y = event.offsetY or event.layerY 
    end)
    cakecanvas:addEventListener("touchmove",function(event)
        self.touchPosition.x = event.pageX or event.clientX
        self.touchPosition.y = event.pageY or event.clientY
    end)
    cakecanvas:addEventListener("touchstart",function()
        self.canvasTouched = true 
    end)
    cakecanvas:addEventListener("touchend",function()
        self.canvasTouched = false 
    end)
    cakecanvas:addEventListener('mousedown',function()
        mousePressed = true
    end)
    cakecanvas:addEventListener('mouseup',function()
        mousePressed = false
    end)
end

function Checkbox:UpdatePosition()
    if self.mousePosition.x >= self.x and self.mousePosition.x <= self.x + self.width and
       self.mousePosition.y >= self.y and self.mousePosition.y <= self.y + self.height or
       self.touchPosition.x >= self.x and self.touchPosition.x <= self.x + self.width and
       self.touchPosition.y >= self.y and self.touchPosition.y <= self.y + self.height then
        self.state = 'hover' 
    end

    if self.mousePressed or self.canvasTouched then
        self.state = 'active'
        if type(self.clickCB) == "function" and not self.isClicking or not self.isTouching then
            self.clickCB()
            self.isClicking = true
            self.isTouching = true
            self.clicked = true
            self.touched = true
            self.checked = true
        end
        if not type(self.clickCB) == "function" and not self.isClicking or not self.isTouching then 
            self.isClicking = false
            self.isTouching = false
            self.clicked = false
            self.touched = false
        else self.state = "default"
        end
    end
end

function Checkbox:Draw() 
    if self.destroyed then cakepen.globalAlpha = 0 end
    cakepen.fillStyle = self.color
    cakepen.strokeStyle = self.color
    cakepen.lineHeight = self.lineSize
    cakepen.lineWidth = self.lineSize
    if self.checked then
        cakepen:fillRect(self.x,self.y,self.size,self.size)
    end
    if not self.checked then
        cakepen:strokeRect(self.x,self.y,self.size,self.size)
    end
    cakepen.globalAlpha = self.alpha;
end

function Checkbox:Update()
    self:UpdatePosition()
    self:Draw()
end

function Checkbox:Destroy()
    self.destroyed = true
end
