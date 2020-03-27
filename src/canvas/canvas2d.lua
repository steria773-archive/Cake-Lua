-- Created By Rabia Alhaffar In 13/March/2020
local js = require("js")
local math = require("math")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

mode = "fill"
_canvas = 0
WindowHeight = window.innerHeight
WindowWidth = window.innerWidth
ScreenHeight = window.screen.height
ScreenWidth = window.screen.width
RandomAlpha = function()
    return math.random()
end
RandomColor = function()
    return "rgb("..math.random(256)..","..math.random(256)..","..math.random(256)..")"
end
CanvasHeight = 0
CanvasWidth = 0
RandomX = 0
RandomY = 0
HalfCanvasHeight = 0
HalfCanvasWidth = 0
texture = ""
cakecanvas = 0
cakepen = 0

-- Game Graphics Functions
DrawText = function(x,y,text,color,stroke_color,textAlign,alpha)
    if Unknown(x) then x = 0 end
    if Unknown(y) then y = 0 end
    if Unknown(text) then text = "" end
    if Unknown(color) then color = "black" end
    if Unknown(stroke_color) then stroke_color = "black" end
    if Unknown(textAlign) then textAlign = "left" end
    if Unknown(alpha) then alpha = 1 end
    cakepen.globalAlpha = alpha
    cakepen.fillStyle = color
    cakepen.strokeStyle = stroke_color
    cakepen.textAlign = textAlign
    if mode == "fill" then
        cakepen:fillText(text,x,y)
    end
    if mode == "stroke" then
        cakepen:strokeText(text,x,y)
    end
    if mode == "custom" then
        cakepen:fillText(text,x,y)
        cakepen:strokeText(text,x,y)
    end 
end

SetFont = function(textfont)
    if Unknown(textfont) then
        textfont = "20px arial"
    end
    cakepen.font = textfont
end

SetShadowProperties = function(shadowOffsetX,shadowOffsetY,shadowcolor,shadowblur)
    if Unknown(shadowOffsetX) then cakepen.shadowOffsetX = 0 end
    if Unknown(shadowOffsetY) then cakepen.shadowOffsetY = 0 end
    if Unknown(shadowcolor) then cakepen.shadowColor = "black" end
    if Unknown(shadowblur) then cakepen.shadowBlur = "0px" end
    cakepen.shadowOffsetX = shadowOffsetX
    cakepen.shadowOffsetY = shadowOffsetY
    cakepen.shadowColor = shadowcolor
    cakepen.shadowBlur = shadowblur
end

SetLineProperties = function(line_width,line_height)
    if Unknown(line_height) then line_height = 1 end
    if Unknown(line_width) then line_width = 1 end
    cakepen.lineHeight = line_height
    cakepen.lineWidth = line_width
end

DrawRect = function(x,y,width,height,color,stroke_color,alpha)
    if Unknown(x) then x = 0 end
    if Unknown(y) then y = 0 end
    if Unknown(height) then height = 0 end
    if Unknown(width) then width = 0 end
    if Unknown(color) then color = "black" end
    if Unknown(stroke_color) then stroke_color = color end
    if Unknown(alpha) then alpha = 1 end
    cakepen.fillStyle = color
    cakepen.globalAlpha = alpha
    cakepen.strokeStyle = stroke_color    
    if mode == "fill" then
        cakepen:fillRect(x,y,width,height)
    end
    if mode == "stroke" then 
        cakepen:strokeRect(x,y,width,height)
    end
    if mode == "custom" then 
        cakepen:fillRect(x,y,width,height)
        cakepen:strokeRect(x,y,width,height)
    end
end

DrawLine = function(pos1,pos2,line_size,color,alpha)
    if Unknown(pos1[1]) then pos1[1] = 0 end
    if Unknown(pos1[2]) then pos1[2] = 0 end
    if Unknown(pos2[1]) then pos2[1] = 0 end
    if Unknown(pos2[2]) then pos2[2] = 0 end
    if Unknown(line_size) then line_size = 1 end
    if Unknown(alpha) then alpha = 1 end
    if Unknown(color) then color = "black" end
    cakepen.strokeStyle = color
    cakepen.globalAlpha = alpha
    cakepen.lineHeight = line_size
    cakepen.lineWidth = line_size
    cakepen:beginPath()    
    cakepen:moveTo(pos1[1],pos1[2])
    cakepen:lineTo(pos2[2],pos2[2])
    cakepen:stroke()
    cakepen:closePath()
end

DrawGrid = function(size,color,alpha)
    if Unknown(size) then size = 10 end
    if Unknown(color) then color = "black" end
    if Unknown(alpha) then alpha = 1 end
    cakepen.globalAlpha = alpha
    cakepen.fillStyle = color
    grid_loop_width = cakecanvas.width / size
    grid_loop_height = cakecanvas.height / size
    x = 0
    y = 0
    for i = 0,grid_loop_height,1 do
        for z = 0,grid_loop_width,1 do
            cakepen:strokeRect(x,y,size,size)
            cakepen:strokeRect(x + size,y,size,size)
            x = x + size
            x = 0 
        end
        y = y + size
    end
end

DrawCircle = function(x,y,radius,color,stroke_color,alpha)
    if Unknown(x) then x = 0 end
    if Unknown(y) then y = 0 end
    if Unknown(radius) then radius = 1 end
    if Unknown(color) then color = "black" end
    if Unknown(stroke_color) then stroke_color = "black" end
    if Unknown(alpha) then alpha = 1 end
    cakepen.globalAlpha = alpha
    cakepen.fillStyle = color
    cakepen.strokeStyle = stroke_color
    cakepen:beginPath()
    cakepen:arc(x, y, radius, 90, 180 * math.pi)
    if mode == "fill" then
        cakepen:fill()
    end
    if mode == "stroke" then
        cakepen:stroke()
    end
    if mode == "custom" then
        cakepen:stroke()
        cakepen:fill()
    end
    cakepen:closePath()
end

DrawArc = function(x,y,radius,color,stroke_color,startAngle,endAngle,alpha)
    if Unknown(x) then x = 0 end
    if Unknown(y) then y = 0 end
    if Unknown(radius) then radius = 1 end
    if Unknown(startAngle) then startAngle = 90 end
    if Unknown(endAngle) then endAngle = 180 end
    if Unknown(color) then color = "black" end
    if Unknown(stroke_color) then stroke_color = "black" end
    if Unknown(alpha) then alpha = 1 end
    cakepen.globalAlpha = alpha
    cakepen.fillStyle = color
    cakepen.strokeStyle = stroke_color
    cakepen:beginPath()
    cakepen:arc(x,y,radius,startAngle,endAngle)
    if mode == "fill"  then 
        cakepen:fill()
    end
    if mode == "stroke" then 
        cakepen:stroke()
    end
    if mode == "custom" then
        cakepen:stroke()
        cakepen:fill()
    end
    cakepen:closePath()
end

DrawTri = function(a,b,c,size,color,stroke_color,alpha)
    if Unknown(a) then a = 0 end
    if Unknown(b) then b = 0 end
    if Unknown(c) then c = 0 end
    if Unknown(size) then size = 0 end
    if Unknown(color) then color = "black" end
    if Unknown(stroke_color) then stroke_color = color end
    if Unknown(alpha) then alpha = 1 end
    cakepen.globalAlpha = alpha
    cakepen.fillStyle = color
    cakepen.strokeStyle = stroke_color
    cakepen:beginPath()
    cakepen:moveTo(a,b)
    cakepen:lineTo(b,c)
    cakepen:lineTo(c,a)
    cakepen:moveTo(a,b)
    if mode == "fill" then
        cakepen:fill()
    end
    if mode == "stroke" then
        cakepen:stroke()
    end    
    if mode == "custom" then 
        cakepen:stroke()
        cakepen:fill()
    end
    cakepen:closePath()
end

DrawTriangle = function(pos1,pos2,pos3,color,stroke_color,alpha)
    if Unknown(pos1[1]) then pos1[1] = 0 end
    if Unknown(pos1[2]) then pos1[2] = 0 end
    if Unknown(pos2[1]) then pos2[1] = 0 end
    if Unknown(pos2[2]) then pos2[2] = 0 end
    if Unknown(pos3[1]) then pos3[1] = 0 end
    if Unknown(pos3[2]) then pos3[2] = 0 end
    if Unknown(color) then color = "black" end
    if Unknown(stroke_color) then stroke_color = color end
    if Unknown(alpha) then alpha = 1 end
    cakepen.globalAlpha = alpha
    cakepen.fillStyle = color
    cakepen.strokeStyle = stroke_color
    cakepen:beginPath()
    cakepen:moveTo(pos1[1],pos1[2])
    cakepen:lineTo(pos2[1],pos2[2])
    cakepen:lineTo(pos3[1],pos3[2])
    cakepen:lineTo(pos1[1],pos1[2])
    if mode == "fill" then
        cakepen:fill()
    end
    if mode == "stroke" then
        cakepen:stroke()
    end    
    if mode == "custom" then
        cakepen:stroke()
        cakepen:fill()
    end
    cakepen:closePath()
end

ClearCanvas = function()
    cakepen:clearRect(0,0,cakecanvas.width,cakecanvas.height)
    cakecanvas.height = cakecanvas.height
    cakecanvas.width = cakecanvas.width
end

DrawPolygon = function(points,color,stroke_color,alpha)
    if Unknown(color) then color = "black" end
    if Unknown(stroke_color) then stroke_color = color end 
    if Unknown(alpha) then alpha = 1 end
    cakepen.globalAlpha = alpha
    cakepen.fillStyle = color
    cakepen.strokeStyle = stroke_color
    cakepen:beginPath()
    cakepen:moveTo(points[1][1], points[1][2])
    for i in pairs(points) do
        cakepen:lineTo(points[i + 1][1],points[i + 1][2])
    end
    if mode == "fill" then
        cakepen:fill()
    end
    if mode == "stroke" then
        cakepen:stroke()
    end
    if mode == "custom" then
        cakepen:fill()
        cakepen:stroke()
    end
    cakepen:closePath()
end

DrawPolygonLineSides = function(x,y,size,sides,color,stroke_color,start_angle,end_angle,alpha)
    if Unknown(x) then x = 0 end
    if Unknown(y) then y = 0 end
    if Unknown(size) then size = 1 end
    if Unknown(color) then color = "black" end
    if Unknown(sides) then sides = 1 end
    if Unknown(start_angle) then start_angle = 90 end
    if Unknown(end_angle) then end_angle = 180 * math.pi end
    if Unknown(stroke_color) then stroke_color = color end
    if Unknown(alpha) then alpha = 1 end
    cakepen.globalAlpha = alpha
    cakepen.fillStyle = color
    cakepen.strokeStyle = stroke_color
    cakepen:beginPath()
    awheel = 360 / sides
    cakepen:moveTo(x,y)
    for i = 1,sides,1 do
        cakepen:lineTo(size * math.cos(awheel * i),size * math.sin(awheel * i))
    end
    cakepen:closePath()
    cakepen:fill()
end

DrawTexture = function(source,x,y,width,height,alpha)
    texture = window:eval("new Image();")
    texture.src = source
	if Unknown(x) then x = 0 end
	if Unknown(y) then y = 0 end
    if Unknown(height) then height = 0 end
    if Unknown(width) then width = 0 end
    if Unknown(alpha) then alpha = 1 end
    cakepen.globalAlpha = alpha
	cakepen:drawImage(texture,x,y,width,height)
end

Scale = function(scale_width,scale_height)
    if Unknown(scale_height) then scale_height = 0 end
	if Unknown(scale_width) then scale_width = 0 end
	cakepen:scale(scale_width,scale_height)
end

Rotate = function(angle)
    if Unknown(angle) then
        angle = 0
    end
    cakepen:rotate(angle)
end

Translate = function(x,y)
    if Unknown(x) then x = 0 end
	if Unknown(y) then y = 0 end
	cakepen:translate(x,y)
end
     
Transform = function(a,b,mode)
    if Unknown(a) then a = 0 end
    if Unknown(b) then b = 0 end
    if mode == "translate" then cakepen:translate(a,b) end
    if mode == "rotate" then cakepen:rotate(a) end
    if mode == "scale" then cakepen:scale(a,b) end
end

RemoveAlpha = function()
    cakepen.globalAlpha = 0
end

DrawFilledGrid = function(gridsize,color,stroke_color,alpha)
    if Unknown(gridsize) then gridsize = 10 end
	if Unknown(color) then color = "black" end
	if Unknown(stroke_color) then stroke_color = color end
    if Unknown(alpha) then alpha = 1 end
    cakepen.globalAlpha = alpha
    cakepen.strokeStyle = stroke_color
    cakepen.fillStyle = color
    grid_loop_width = cakecanvas.width / gridsize
    grid_loop_height = cakecanvas.height / gridsize
    x = 0
    y = 0
    for i = 0,grid_loop_height,1 do
        for z = 0,grid_loop_width,1 do
            cakepen:fillRect(x,y,gridsize,gridsize)
            cakepen:strokeRect(x,y,gridsize,gridsize)
            cakepen:fillRect(x + gridsize,y,gridsize,gridsize)
            cakepen:strokeRect(x + gridsize,y,gridsize,gridsize)
            x = x + gridsize
        end
        x = 0
        y = y + gridsize
    end
end

DrawSuperFilledGrid = function(gridsize,alpha)
    if Unknown(gridsize) then gridsize = 0 end
    if Unknown(alpha) then alpha = 1 end
    cakepen.globalAlpha = alpha
    grid_loop_width = cakecanvas.width / gridsize
    grid_loop_height = cakecanvas.height / gridsize
    x = 0
    y = 0
    for i = 0,grid_loop_height,1 do
        for z = 0,grid_loop_width,1 do
            cakepen.fillStyle = RandomColor()
			cakepen.fillRect(x,y,gridsize,gridsize)
			cakepen.fillStyle = RandomColor()
			cakepen.fillRect(x + gridsize,y,gridsize,gridsize)
			x = x + gridsize
        end
        x = 0
        y = y + gridsize
    end
end

SetTransform = function(horizontal_scaling,horizontal_skewing,vertical_skewing,vertical_scaling,horizontal_moving,vertical_moving)
    if Unknown(horizontal_scaling) then horizontal_scaling = 0 end
    if Unknown(horizontal_skewing) then horizontal_skewing = 0 end		
    if Unknown(vertical_skewing) then vertical_skewing = 0 end
    if Unknown(vertical_scaling) then vertical_scaling = 0 end		 
	if Unknown(horizontal_moving) then horizontal_moving = 0 end
	if Unknown(vertical_moving) then vertical_moving = 0 end
	cakepen:setTransform(horizontal_scaling, horizontal_skewing, vertical_skewing, vertical_scaling, horizontal_moving, vertical_moving)
end

DoTransform = function(horizontal_scaling,horizontal_skewing,vertical_skewing,vertical_scaling,horizontal_moving,vertical_moving)
    if Unknown(horizontal_scaling) then horizontal_scaling = 0 end
    if Unknown(horizontal_skewing) then horizontal_skewing = 0 end		
    if Unknown(vertical_skewing) then vertical_skewing = 0 end
    if Unknown(vertical_scaling) then vertical_scaling = 0 end		 
	if Unknown(horizontal_moving) then horizontal_moving = 0 end
	if Unknown(vertical_moving) then vertical_moving = 0 end
	cakepen:Transform(horizontal_scaling, horizontal_skewing, vertical_skewing, vertical_scaling, horizontal_moving, vertical_moving)
end

DrawPixel = function(x,y,size,color,alpha,show_grid)
    if Unknown(color) then color = "black" end
	if Unknown(x) then x = 0 end
	if Unknown(y) then y = 0 end
	if Unknown(size) then size = 5 end
	if Unknown(show_grid) then show_grid = true end
	if Unknown(alpha) then alpha = 1 end
    cakepen.globalAlpha = alpha
    cakepen.fillStyle = color
    cakepen.strokeStyle = "black"
	cakepen:fillRect(x,y,size,size)
    if show_grid then
        cakepen:strokeRect(x,y,size,size)
    end	
end

ClearColor = function(color)
    if Unknown(color) then color = "black" end
	cakepen.fillStyle = color
    cakepen:clearRect(0,0,cakecanvas.width,cakecanvas.height)
    cakecanvas.height = cakecanvas.height
    cakecanvas.width = cakecanvas.width
    cakepen:fillRect(0,0,cakecanvas.width,cakecanvas.height)
end

SetAlpha = function(alpha)
    if Unknown(alpha) then 
        alpha = 1 
    end
    cakepen.globalAlpha = alpha
end

SetBackgroundImage = function(url)
    document.body.style.backgroundImage = "url("..tostring(url)..")"
end

SetBackgroundColor = function(color)
    if Unknown(color) then 
        color = "white" 
    end
    document.body.style.color = color
    document.body.style.backgroundColor = color
end

SetCanvasBackgroundImage = function(url)
    cakecanvas.style.backgroundImage = "url("..tostring(url)..")"
end

RemoveCanvasBackgroundImage = function()
    cakecanvas.style.backgroundImage = "none"
end

RemoveCanvasBackgroundColor = function()
    cakecanvas.style.backgroundColor = "none"
end

SetCanvasBackgroundColor = function(color)
    if Unknown(color) then 
        color = "white" 
    end 
    cakecanvas.style.backgroundColor = color
end

MakeCanvasFullSize = function()
    cakecanvas.style.height = "100%"
    cakecanvas.style.width = "100%"
end

CreateCanvas = function(width,height,bgcolor,border_style)
    if Unknown(height) then height = 150 end
	if Unknown(width) then width = 150 end
	if Unknown(border_style) then border_style = "none" end
    if Unknown(bgcolor) then bgcolor = "none" end
    _canvas = document:createElement("canvas")
    _canvas.id = "cake-canvas"
    _canvas.height = height
    _canvas.width = width
    _canvas.style.backgroundColor = bgcolor
    _canvas.style.border = border_style
	document.body:appendChild(_canvas)
end

CreateGame = function(context,width,height,gametitle)
    document.title = gametitle
	if Unknown(height) then height = 150 end
	if Unknown(width) then width = 150 end
	cakecanvas = document:createElement("canvas")
    cakecanvas.id = tostring(gametitle) + "-game-canvas"
    cakecanvas.height = height
    cakecanvas.width = width
	document.body:appendChild(cakecanvas)
	cakecanvas = document:getElementById(tostring(gametitle) + "-game-canvas")
    cakepen	= cakecanvas:getContext(context)
    if cakepen then
        if context == "2d" then
            console:info("CAKE GAME ENGINE: INITIALIZING CanvasRenderingContext2D...")
        else console:info("CAKE GAME ENGINE: INITIALIZING WebGLRenderingContext...")
        end
    end
    if not cakepen then 
        RemoveCanvas()
        window:alert("CAKE IS NOT SUPPORTED ON THIS BROWSER/DEVICE,WE ARE SORRY!!!")
        console:error("ERROR: CAKE_NOT_SUPPORTED")
    end
end

DrawSquare = function(x,y,size,color,stroke_color,alpha)
    if Unknown(x) then x = 0 end
	if Unknown(y) then y = 0 end
	if Unknown(size) then size = 0 end
	if Unknown(color) then color = "black" end
	if Unknown(stroke_color) then stroke_color = color end
	if Unknown(alpha) then alpha = 1 end
    cakepen.globalAlpha = alpha
    cakepen.fillStyle = color
    cakepen.strokeStyle = stroke_color
    if mode == "fill" then
        cakepen:fillRect(x,y,size,size)
    end			
    if mode == "stroke" then
        cakepen:strokeRect(x,y,size,size)
    end	
    if mode == "custom" then
        cakepen:fillRect(x,y,size,size)
        cakepen:strokeRect(x,y,size,size)
    end
end

DrawRoundedRect = function(x,y,width,height,radius,color,stroke_color,alpha)
    if Unknown(x) then x = 0 end
	if Unknown(y) then y = 0 end
	if Unknown(width) then width = 0 end
	if Unknown(height) then height = 0 end
	if Unknown(color) then color = "black" end
	if Unknown(stroke_color) then stroke_color = color end
	if Unknown(alpha) then alpha = 1 end
    cakepen.globalAlpha = alpha
    cakepen.fillStyle = color
    cakepen.strokeStyle = stroke_color
    cakepen:beginPath()
    cakepen:moveTo(x + radius,y)
    cakepen:lineTo(x + width - radius,y)
    cakepen:quadraticCurveTo(x + width,y,x + width,y + radius)
    cakepen:lineTo(x + width,y + height - radius)
    cakepen:quadraticCurveTo(x + width,y + height,x + width - radius,y + height)
    cakepen:lineTo(x + radius,y + height)
    cakepen:quadraticCurveTo(x,y + height,x,y + height - radius)
    cakepen:lineTo(x,y + radius)
    cakepen:quadraticCurveTo(x,y,x + radius,y)
    cakepen:closePath()
    if mode == "fill" then
        cakepen:fill()
    end			
    if mode == "stroke" then
        cakepen:stroke()
    end
    if mode == "custom" then
        cakepen:fill()
        cakepen:stroke()
    end
end

ResetAlpha = function()
    cakepen.globalAlpha = 1
end

Initialize = function(c)
    if Unknown(c) then c = 0 end
	cakecanvas = document:getElementsByTagName("canvas")[c]
    cakepen	= cakecanvas:getContext("2d")
    if cakepen then
        console:info("CAKE GAME ENGINE: INITIALIZING CanvasRenderingContext2D...")
    end
    if not cakepen then 
		RemoveCanvas()
		window:alert("CAKE IS NOT SUPPORTED ON THIS BROWSER/DEVICE,WE ARE SORRY!!!")
        console:error("ERROR: CAKE_NOT_SUPPORTED")
    end
        CanvasHeight = cakecanvas.height
        CanvasWidth = cakecanvas.width
        HalfCanvasHeight = CanvasHeight * 0.5
        HalfCanvasWidth = CanvasWidth * 0.5
        RandomX = math.random(CanvasWidth)
        RandomY = math.random(CanvasHeight)
end

ResizeCanvasFully = function(canvas_width,canvas_height)
    cakecanvas.height = canvas_height
    cakecanvas.width = canvas_width
    cakecanvas.style.height = canvas_height
    cakecanvas.style.width = canvas_width
end

ResizeCanvas = function(canvas_width,canvas_height)
    cakecanvas.height = canvas_height
    cakecanvas.width = canvas_width
end

SetResolution = function(canvas_width,canvas_height)
    cakecanvas.style.height = canvas_height
    cakecanvas.style.width = canvas_width
end
        
SetAntialiasing = function(enabled,quality)
    if Unknown(enabled) then enabled = true end
	if Unknown(quality) then quality = "high" end
	cakepen.imageSmoothingEnabled = enabled
    if cakepen.imageSmoothingEnabled then
        cakepen.imageSmoothingQuality = quality
    end
end

SetDrawingMode = function(drawing_mode)
    if Unknown(drawing_mode) then
        drawing_mode = "fill"
        mode = drawing_mode
    end
end

LineDash = function(dash)
    cakepen:setLineDash(dash)
end

RemoveCanvas = function(c)
    cakecanvas = document:getElementsByTagName("canvas")[c]
    cakecanvas.parentNode:removeChild(cakecanvas)
end	

MeasureText = function(text)
    cakepen:measureText(text)
end

EnableDOMInsideCanvas = function(elements)
    cakecanvas.style.position = "relative"
	elm = document:querySelectorAll(elements)
	elm.style.position = "absolute"
end

SetLineJoining = function(mode)
    cakepen.lineJoin = mode
end

DrawEllipse = function(x,y,radius,color,stroke_color,rotation,start_angle,end_angle,alpha)
    if Unknown(x) then x = 0 end
	if Unknown(y) then y = 0 end
	if Unknown(rotation) then rotation = 0 end
	if Unknown(start_angle) then start_angle = 90 end
	if Unknown(end_angle) then end_angle = 180 end
	if Unknown(anticlockwise) then anticlockwise = false end
	if Unknown(radius) then radius = 1 end
	if Unknown(color) then color = "black" end
	if Unknown(stroke_color) then stroke_color = color end
	if Unknown(alpha) then alpha = 1 end
    cakepen.globalAlpha = alpha
    cakepen.fillStyle = color
    cakepen.strokeStyle = stroke_color
	cakepen:ellipse(x,y,radius,radius,rotation,start_angle,end_angle * math.pi,false)
end
Cut = function()
    cakepen:clip()
end	

SetTextDrawingDirection = function(dir)
    cakepen.direction = dir
end

DoAroundCanvas = function(each,fun)
    if Unknown(each) then each = 0 end
    grid_loop_width = CanvasWidth / each
    grid_loop_height = CanvasHeight / each
    x = 0
    y = 0
	for i = 0,grid_loop_height,1 do
		for z = 0,grid_loop_width,1 do
			window:setTimeout(fun,0)
            x = 0
            x = x + each				
        end
        x = 0
        y = y + each
    end
end

Color = function(c)
    cakepen.fillStyle = c
end	

RGB = function(r, g, b)
    if Unknown(r) then r = 0 end
	if Unknown(g) then g = 0 end
	if Unknown(b) then b = 0 end
	return "rgb("..r..","..g..","..b..")"
end
HSL = function(h, s, l)
    if Unknown(h) then h = 0 end
	if Unknown(s) then s = 0 end
    if Unknown(l) then l = 0 end
    return "hsl("..h..","..s..","..l..")"
end

TranslateBackground = function(horizontal,vertical) 
	cakecanvas.style.backgroundAttachment = "fixed"
	cakecanvas.style.backgroundRepeat = "no-repeat"
	cakecanvas.style.backgroundPosition = tostring(horizontal.."px "..vertical.."px")
end

SetBackgroundPosition = function(pos)
    cakecanvas.style.backgroundAttachment = "fixed"
	cakecanvas.style.backgroundRepeat = "no-repeat"
	cakecanvas.style.backgroundPosition = pos
end

SwitchCanvas = function(c) 
    if Unknown(c) then c = 1 end
    cakecanvas = document:getElementsByTagName("canvas")[c]
end

SwitchContext = function(c)
    if Unknown(c) then c = "2d" end
    cakepen = cakecanvas:getContext(c)
end

SwitchContent = function(canvas,context)
    cakecanvas = document:getElementsByTagName("canvas")[canvas]
    cakepen = cakecanvas:getContext(context)
end

DrawImageAdvanced = function(url,source_x,source_y,source_width,source_height,x,y,width,height,alpha)
	texture = document:createElement("image")
	texture.src = url
	if Unknown(source_x) then source_x = 0 end
	if Unknown(source_y) then source_y = 0 end
	if Unknown(source_height) then source_height = 0 end
	if Unknown(source_width) then source_width = 0 end
	if Unknown(x) then x = 0 end
	if Unknown(y) then y = 0 end
	if Unknown(height) then height = 0 end
	if Unknown(width) then width = 0 end
	if Unknown(alpha) then alpha = 1 end
	cakepen.globalAlpha = alpha
	cakepen:drawImage(source_x,source_y,source_width,source_height,x,y,width,height)	
end

HideCanvas = function()
    cakecanvas.style.visibility = "hidden"
end

ShowCanvas = function()
    cakecanvas.style.visibility = "visible"
end

ConvertToImage = function()
    cakecanvas:toDataURL()
end

Screenshot = function()
    window:open(cakecanvas:toDataURL())
end

Fitscreen = function(res,type)
    nwidth = res[1]
    nheight = res[2]
    dwidth = window.innerWidth
    dheight = window.innerHeight
    modeused = 0
    fillnative = math.max(dwidth / nwidth, dheight / nheight)
    fitnative = math.min(dwidth / nwidth, dheight / nheight) 
    if type == "fit" then
        modeused = fitnative
    end
    if type == "fill" then
        modeused = fillnative
    end
    cakecanvas.style.width = dwidth.."px"
    cakecanvas.style.height = dheight.."px"
    cakecanvas.width = dwidth
    cakecanvas.height = dheight
    cakepen:setTransform(modeused,0,0,fitnative,math.floor(dwidth / 2),math.floor(dheight / 2))
    if fitnative < 1 then
        cakepen.imageSmoothingEnabled = true
    end
    if not fitnative < 1 then
        cakepen.imageSmoothingEnabled = false
    end 
end

Fitwindow = function()
    cakecanvas.width = document.innerWidth
    cakecanvas.height = document.innerHeight
end

UseAllCanvases = function(context)	
    if Unknown(context) then
        context = "2d"
    end
	canvases = document:getElementsByClassName("canvas")
    for i = 0,canvases.length,1 do
        cakepen = canvases[i]:getContext(context) 
    end
end

RandomBetween = function(x)
    return math.random(x)
end

HSL = function(h,s,l)
    if Unknown(h) then h = 0 end
	if Unknown(s) then s = 0 end
	if Unknown(l) then l = 0 end
	return "hsl("..h..","..s..","..l..")"
end

HSLA = function(h,s,l,a)
    if Unknown(h) then h = 0 end
	if Unknown(s) then s = 0 end
	if Unknown(l) then l = 0 end
	if Unknown(a) then a = 1 end
	return "hsla("..h..","..s..","..l..","..a..")"
end

RGBA = function(r,g,b,a)
    if Unknown(r) then r = 0 end
	if Unknown(g) then g = 0 end
	if Unknown(b) then b = 0 end
	if Unknown(a) then a = 1 end
	return "rgba("..r..","..g..","..b..","..a..")"
end

MakeCanvasCompatible = function()
    cakecanvas.width = WindowWidth
    cakecanvas.height = WindowHeight
end

DrawGradientRect = function(x,y,width,height,content,alpha)
    if Unknown(x) then x = 0 end
	if Unknown(y) then y = 0 end
	if Unknown(width) then width = 0 end
	if Unknown(height) then height = 0 end
	if Unknown(alpha) then alpha = 1 end
	linear = cakepen:createLinearGradient(x, y, width, height)
    for loopdlg = 1,content.length,1 do
        linear:addColorStop(content[loopdlg][1], content[loopdlg][2])
    end
	cakepen.fillStyle = linear
	cakepen.strokeStyle = linear
	cakepen.globalAlpha = alpha
    if mode == "fill" then
        cakepen:fillRect(x,y,width,height)
    end
    if mode == "stroke" then
        cakepen:strokeRect(x,y,width,height)
    end
    if mode == "custom" then
        cakepen:fillRect(x,y,width,height)
		cakepen:strokeRect(x,y,width,height)
    end
    
end

-- Modes For DrawArrays()
TRIANGLES = "triangles"
RECTANGLES = "rectangles"
SQUARES = "squares"
LINES = "lines"
CIRCLES = "circles"
POLYGONS = "polygons"
TEXTURES = "textures"
TEXTS = "texts"
ROUNDED_RECTANGLES = "rounded_rectangles"

DrawArrays = function(type,content)

    if type == RECTANGLES then
        for i in pairs(content) do
            if Unknown(content[i + 1][1]) then content[i + 1][1] = 0 end
			if Unknown(content[i + 1][2]) then content[i + 1][2] = 0 end
			if Unknown(content[i + 1][3]) then content[i + 1][3] = 0 end
			if Unknown(content[i + 1][4]) then content[i + 1][4] = 0 end
			if Unknown(content[i + 1][5]) then content[i + 1][5] = "black" end
			if Unknown(content[i + 1][6]) then content[i + 1][6] = "black" end
			if Unknown(content[i + 1][7]) then content[i + 1][7] = 1 end
			cakepen.fillStyle = content[i + 1][5]
			cakepen.strokeStyle = content[i + 1][6]
			cakepen.globalAlpha = content[i + 1][7]
            if mode == "fill" then
                cakepen:fillRect(content[i + 1][1],content[i + 1][2],content[i + 1][3],content[i + 1][4])
            end
            if mode == "stroke" then
                cakepen:strokeRect(content[i + 1][1],content[i + 1][2],content[i + 1][3],content[i + 1][4])
            end
            if mode == "custom" then
                cakepen:fillRect(content[i + 1][1],content[i + 1][2],content[i + 1][3],content[i + 1][4])
				cakepen:fillRect(content[i + 1][1],content[i + 1][2],content[i + 1][3],content[i + 1][4])
			end
        end
    end

    if type == SQUARES then
        for i in pairs(content) do
            if Unknown(content[i + 1][1]) then content[i + 1][1] = 0 end
			if Unknown(content[i + 1][2]) then content[i + 1][2] = 0 end
			if Unknown(content[i + 1][3]) then content[i + 1][3] = 0 end
			if Unknown(content[i + 1][4]) then content[i + 1][4] = "black" end
			if Unknown(content[i + 1][5]) then content[i + 1][5] = "black" end
			if Unknown(content[i + 1][6]) then content[i + 1][6] = 1 end
			cakepen.fillStyle = content[i + 1][4]
			cakepen.strokeStyle = content[i + 1][5]
			cakepen.globalAlpha = content[i + 1][6]
            if mode == "fill" then
                cakepen:fillRect(content[i + 1][1],content[i + 1][2],content[i + 1][3],content[i + 1][4])
            end
            if mode == "stroke" then
                cakepen:strokeRect(content[i + 1][1],content[i + 1][2],content[i + 1][3],content[i + 1][4])
            end
            if mode == "custom" then
                cakepen.fillRect(content[i + 1][1],content[i + 1][2],content[i + 1][3],content[i + 1][4])
				cakepen.fillRect(content[i + 1][1],content[i + 1][2],content[i + 1][3],content[i + 1][4])
			end
        end
    end

    if type == CIRCLES then
        for i in pairs(content) do
			if Unknown(content[i + 1][1]) then content[i + 1][1] = 0 end
			if Unknown(content[i + 1][2]) then content[i + 1][2] = 0 end
			if Unknown(content[i + 1][3]) then content[i + 1][3] = 0 end
			if Unknown(content[i + 1][4]) then content[i + 1][4] = "black" end
			if Unknown(content[i + 1][5]) then content[i + 1][5] = "black" end
			if Unknown(content[i + 1][6]) then content[i + 1][6] = 1 end
			cakepen.fillStyle = content[i + 1][4]
			cakepen.strokeStyle = content[i + 1][5]
			cakepen.globalAlpha = content[i + 1][6]
			cakepen:beginPath()
            cakepen:arc(content[i + 1][1], content[i + 1][2], content[i + 1][3], 90, 180 * math.pi)
            if mode == "fill" then
                cakepen:fill()
            end
            if mode == "stroke" then
                cakepen:stroke()
            end		
            if mode == "custom" then
                cakepen:stroke()
                cakepen:fill()
            end
            cakepen:closePath()
        end
    end

    if type == LINES then
        for i in pairs(content) do
			if Unknown(content[i + 1][1][1]) then content[i + 1][1][1] = 0 end
			if Unknown(content[i + 1][1][2]) then content[i + 1][1][2] = 0 end
			if Unknown(content[i + 1][2][1]) then content[i + 1][2][1] = 0 end
			if Unknown(content[i + 1][2][2]) then content[i + 1][2][2] = 0 end
			if Unknown(content[i + 1][3]) then content[i + 1][3] = 0 end
			if Unknown(content[i + 1][4]) then content[i + 1][4] = "black" end
			if Unknown(content[i + 1][5]) then content[i + 1][5] = 1 end
			cakepen.strokeStyle = content[i + 1][4]
			cakepen:beginPath()
			cakepen:moveTo(content[i + 1][1][1],content[i + 1][1][2])
			cakepen:lineTo(content[i + 1][2][1],content[i + 1][2][2])
			cakepen:stroke()
            cakepen:closePath()
        end 
    end
    
    if type == TRIANGLES then
		for i in pairs(content) do
			if Unknown(content[i + 1][1][1]) then content[i + 1][1][1] = 0 end
			if Unknown(content[i + 1][1][2]) then content[i + 1][1][2] = 0 end
			if Unknown(content[i + 1][2][1]) then content[i + 1][2][1] = 0 end
			if Unknown(content[i + 1][2][2]) then content[i + 1][2][2] = 0 end
			if Unknown(content[i + 1][3][1]) then content[i + 1][3][1] = 0 end
			if Unknown(content[i + 1][3][2]) then content[i + 1][3][2] = 0 end
			if Unknown(content[i + 1][4]) then content[i + 1][4] = "black" end
			if Unknown(content[i + 1][5]) then content[i + 1][5] = "black" end
			if Unknown(content[i + 1][6]) then content[i + 1][6] = 1 end
			cakepen.fillStyle = content[i + 1][4]
			cakepen.strokeStyle = content[i + 1][5]
			cakepen.globalAlpha = content[i + 1][6]
			cakepen:beginPath()
            cakepen:moveTo(content[i + 1][1][1],content[i + 1][1][2])
            cakepen:lineTo(content[i + 1][2][1],content[i + 1][2][2])
		    cakepen:lineTo(content[i + 1][3][1],content[i + 1][3][2])
			cakepen:lineTo(content[i + 1][1][1],content[i + 1][1][2])
            if mode == "fill" then
                cakepen:fill()
            end
            if mode == "stroke" then
                cakepen:stroke()
            end			
            if mode == "custom" then
                cakepen:stroke()
				cakepen:fill()
            end
            cakepen:closePath()
        end
    end
        
	if type == POLYGONS then
		for i in pairs(content) do
			if Unknown(content[i + 1][1][1]) then content[i + 1][1][1] = 0 end
			if Unknown(content[i + 1][1][2]) then content[i + 1][1][2] = 0 end
			if Unknown(content[i + 1][2]) then content[i + 1][2] = "black" end
			if Unknown(content[i + 1][3]) then content[i + 1][3] = "black" end
			if Unknown(content[i + 1][4]) then content[i + 1][4] = 1 end
			cakepen.fillStyle = content[i + 1][2]
			cakepen.strokeStyle = content[i + 1][3]
			cakepen.globalAlpha = content[i + 1][4]
			cakepen:beginPath()
			cakepen:moveTo(content[i + 1][1][1], content[i + 1][1][2])
            for o in pairs(content) do
                cakepen:lineTo(content[o + 1][o + 1][1], content[o + 1][o + 1][2])
            end
            if mode == "fill" then
                cakepen:fill()
            end
            if mode == "stroke" then
                cakepen:stroke()
            end
            if mode == "custom" then
                cakepen:fill()
				cakepen:stroke()
            end
            cakepen:closePath()	
        end
    end

	if type == TEXTURES then
		for i in pairs(content) do
			if Unknown(content[i + 1][1]) then content[i + 1][1] = "" end
			if Unknown(content[i + 1][2]) then content[i + 1][2] = 0 end
			if Unknown(content[i + 1][3]) then content[i + 1][3] = 0 end
			if Unknown(content[i + 1][4]) then content[i + 1][4] = 0 end
			if Unknown(content[i + 1][5]) then content[i + 1][5] = 0 end
			if Unknown(content[i + 1][6]) then content[i + 1][6] = 1 end
			content[i + 1][7] = document:createElement("image")
			content[i + 1][7].src = content[i + 1][1]
			cakepen.globalAlpha = content[i + 1][6]
			cakepen:drawImage(content[i + 1][7],content[i + 1][2],content[i + 1][3],content[i + 1][4],content[i + 1][5])		
        end
    end

	if type == TEXTS then
		for i in pairs(content) do
			if Unknown(content[i + 1][1]) then content[i + 1][1] = 0 end
			if Unknown(content[i + 1][2]) then content[i + 1][2] = 0 end
			if Unknown(content[i + 1][3]) then content[i + 1][3] = "" end
			if Unknown(content[i + 1][4]) then content[i + 1][4] = "black" end
			if Unknown(content[i + 1][5]) then content[i + 1][5] = "black" end
			if Unknown(content[i + 1][6]) then content[i + 1][6] = "center" end
			if Unknown(content[i + 1][7]) then content[i + 1][7] = 1 end
			if Unknown(content[i + 1][8]) then content[i + 1][8] = "12px arial" end
			cakepen.fillStyle = content[i + 1][4]
            cakepen.strokeStyle = content[i + 1][5]
            cakepen.textAlign = content[i + 1][6]
            cakepen.globalAlpha = content[i + 1][7]
			cakepen.font = content[i + 1][8]
            if mode == "fill" then
                cakepen:fillText(content[i + 1][3],content[i + 1][1],content[i + 1][2])
            end
            if mode == "stroke" then
                cakepen:strokeText(content[i + 1][3],content[i + 1][1],content[i + 1][2])
            end
            if mode == "custom" then
				cakepen.fillText(content[i + 1][2],content[i + 1][0],content[i + 1][1])
				cakepen.strokeText(content[i + 1][2],content[i + 1][0],content[i + 1][1])
			end	
		end
    end
        
    if type == ROUNDED_RECTANGLES then
        for i in pairs(content) do
			if Unknown(content[i + 1][1]) then content[i + 1][1] = 0 end
			if Unknown(content[i + 1][2]) then content[i + 1][2] = 0 end
			if Unknown(content[i + 1][3]) then content[i + 1][3] = 0 end
			if Unknown(content[i + 1][4]) then content[i + 1][4] = 0 end
			if Unknown(content[i + 1][5]) then content[i + 1][5] = 0 end
			if Unknown(content[i + 1][6]) then content[i + 1][6] = "black" end
			if Unknown(content[i + 1][7]) then content[i + 1][7] = "black" end
			if Unknown(content[i + 1][8]) then content[i + 1][8] = 1
			cakepen.fillStyle = content[i + 1][6]
			cakepen.strokeStyle = content[i + 1][7]
			cakepen.globalAlpha = content[i + 1][8]
			cakepen:beginPath()
			cakepen:moveTo(content[i + 1][1] + content[i + 1][5],content[i + 1][2])
			cakepen:lineTo(content[i + 1][1] + content[i + 1][3] - content[i + 1][5],content[i + 1][2])
			cakepen:quadraticCurveTo(content[i + 1][1] + content[i + 1][3],content[i + 1][2],content[i + 1][1] + content[i + 1][3],content[i + 1][2] + content[i + 1][5])
			cakepen:lineTo(content[i + 1][1] + content[i + 1][3],content[i + 1][2] + content[i + 1][4] - content[i + 1][5])
			cakepen:quadraticCurveTo(content[i + 1][1] + content[i + 1][3],content[i + 1][2] + content[i + 1][4],content[i + 1][1] + content[i + 1][3] - content[i + 1][5],content[i + 1][2] + content[i + 1][4])
			cakepen:lineTo(content[i + 1][1] + content[i + 1][5],content[i + 1][2] + content[i + 1][4])
			cakepen:quadraticCurveTo(content[i + 1][1],content[i + 1][3] + content[i + 1][4],content[i + 1][1],content[i + 1][2] + content[i + 1][4] - content[i + 1][5])
			cakepen:lineTo(content[i + 1][1],content[i + 1][2] + content[i + 1][5])
			cakepen:quadraticCurveTo(content[i + 1][1],content[i + 1][2],content[i + 1][1] + content[i + 1][5],content[i + 1][2])
			cakepen:closePath()
            if mode == "fill" then
                cakepen:fill()
            end			
            if mode == "stroke" then
                cakepen:stroke()
            end
            if mode == "custom" then
                cakepen:fill()
				cakepen:stroke()
            end
        end
    end
		cakepen.globalAlpha = 1
    end
end

FlipHorizontally = function()
    cakepen:scale(-1,1)
end

FlipVertically = function()
    cakepen:scale(1,-1)
end

FlipContent = function()
    cakepen:scale(-1,-1)
end

ResetFlipping = function()
    cakepen:scale(1,1)
end

Shear = function(x,y) 
    if Unknown(x) then x = 0 end
	if Unknown(y) then y = 0 end
	cakepen:shear(x,y)
end

ClearShadows = function()
	if Safari then cakepen:clearShadow() end
end