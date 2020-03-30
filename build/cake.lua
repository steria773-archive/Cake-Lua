-- Cake 2D And 3D Game Engine,Lua Binding Build
-- Copyright (c)2019-Present Rabia Alhaffar,All Rights Reserved!!!
-- NOTES: You Need To Use Fengari Lua VM (JavaScript Library) For Using Cake In Lua
-- Grab It Here: https://fengari.io
-- Build Date: 30/March/2020

local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON
local math = require("math")

-- Module: Utilities
RandomAlpha = math.random()
u = nil

-- Colors
RED = "red"
ORANGE = "orange"
YELLOW = "yellow"
GREEN = "green"
BLUE = "blue"
PINK = "pink"
PURPLE = "purple"
WHITE = "white"
BLACK = "black"
GREY = "grey"
SILVER = "silver"
CYAN = "cyan"

-- XBOX Gamepad Keys
XBKey = 
{
    A = 0,
    B = 1,
    X = 2,
    Y = 3,
    LB = 4,
    RB = 5,
    LT = 6,
    RT = 7,
    Back = 8,
    Start = 9,
    LeftAnalogStick = 10,
    RightAnalogStick = 11,
    Up = 12,
    Down = 13,
    Left = 14,
    Right = 15
}

-- PlayStation Gamepad Keys
PSKey = 
{
    X = 0,
    O = 1,
    Square = 2,
    Triangle = 3,
    L1 = 4,
    R1 = 5,
    L2 = 6,
    R2 = 7,
    Select = 8,
    Start = 9,
    LeftAnalogStick = 10,
    RightAnalogStick = 11,
    Up = 12,
    Down = 13,
    Left = 14,
    Right = 15
}

-- TV Keys (Tested Well On Panasonic,Smart TV Remotes)
TVKey =
{
    Panasonic =
    {
        Up = 38,
        Down = 40,
        Left = 37,
        Right = 39,
        ChannelUp = 516,
        ChannelDown = 517,
        F0 = 588,
        F1 = 589,
        F2 = 590,
        F3 = 591,
        Enter = 13,
        Aspect = 642,
        Info = 615,
        Return = 8,
        Option = 623,
        ZERO = 48,
        ONE = 49,
        TWO = 50,
        THREE = 51,
        FOUR = 52,
        FIVE = 53,
        SIX = 54,
        SEVEN = 55,
        EIGHT = 56,
        NINE = 57,
        LastView = 651,
        Play = 250,
        Pause = 19,
        Stop = 178,
        Record = 603,
        SkipToNext = 176,
        SkipToPrevious = 177,
        Next = 228,
        Previous = 227
    },
    Tizen =
    {
        Up = 38,
        Down = 40,
        Left = 37,
        Right = 39,
        Enter = 13,
        Back = 10009,
        VolumeUp = 447,
        VolumeDown = 448,
        VolumeMute = 449,
        ChannelUp = 427,
        ChannelDown = 428,
        ChannelList = 10073,
        F0 = 403,
        F1 = 404,
        F2 = 405,
        F3 = 406,
        MediaPlayPause = 10252,
        MediaRewind = 412,
        MediaFastForward = 417,
        MediaPlay = 415,
        MediaPause = 19,
        MediaStop = 413,
        MediaRecord = 416,
        MediaTrackPrevious = 10232,
        MediaTrackNext = 10233,
        ZERO = 48,
        ONE = 49,
        TWO = 50,
        THREE = 51,
        FOUR = 52,
        FIVE = 53,
        SIX = 54,
        SEVEN = 55,
        EIGHT = 56,
        NINE = 57,
        Minus = 189,
        PreviousChannel = 10190,
        Menu = 18,
        Tools = 10135,
        Info = 457,
        Source = 10072,
        Exit = 10182,
        Caption = 10221,
        EManual = 10146,
        _3D = 10199,
        Extra = 10253,
        PictureSize = 10140,
        Soccer = 10228,
        Teletext = 10200,
        MTS = 10195,
        Search = 10225,
        Guide = 458 
    },
    WebOS =
    {
        Up = 0x26,
        Down = 0x28,
        Left = 0x25,
        Right = 0x27,
        OK = 0x0D,
        Back = 0x1CD,
        F0 = 0x193,
        F1 = 0x194,
        F2 = 0x195,
        F3 = 0x196
    },
    LG_HDCP =
    {
        Power = 0x08,
        Energy = 0x95,
        AV = 0x30,
        Input = 0x0B,
        TVRAD = 0xF0,
        ZERO = 0x10,
        ONE = 0x11,
        TWO = 0x12,
        THREE = 0x13,
        FOUR = 0x14,
        FIVE = 0x15,
        SIX = 0x16,
        SEVEN = 0x17,
        EIGHT = 0x18,
        NINE = 0x19,
        List = 0x53,
        QView = 0x1A,
        VolumeUp = 0x02,
        VolumeDown = 0x03,
        Favorites = 0x1E,
        Ratio = 0x79,
        Mute = 0x09,
        ChannelUp = 0x00,
        ChannelDown = 0x01,
        Menu = 0x43,
        Home = 0x23,
        Widgets = 0x58,
        Netcast = 0x59,
        QMenu = 0x45,
        _3D = 0xDC,
        Up = 0x40,
        Down = 0x41,
        Left = 0x07,
        Right = 0x06,
        OK = 0x44,
        Back = 0x28,
        Guide = 0xA9,
        Exit = 0x5B,
        F0 = 0x72,
        F1 = 0x71,
        F2 = 0x63,
        F3 = 0x61,
        _3DSetup = 0x61,
        Text = 0x20,
        TextOptions = 0x21,
        Subtitles = 0x39,
        LiveTV = 0x9E,
        Record = 0xBD,
        Stop = 0xB1,
        Play = 0xB0,
        Pause = 0xBA,
        Next = 0x8E,
        Previous = 0x8F,
        Simplink = 0x7E,
        Info = 0xAA,
        App = 0x9F,
        AD =91
    }
};

KeyboardKey = 
{
    Key = 
    {
        A = "a",
        B = "b",
        C = "c",
        D = "d",
        E = "e",
        F = "f",
        G = "g",
        H = "h",
        I = "i",
        J = "j",
        K = "k",
        L = "l",
        M = "m",
        N = "n",
        O = "o",
        P = "p",
        Q = "q",
        R = "r",
        S = "s",
        T = "t",
        U = "u",
        V = "v",
        W = "w",
        X = "x",
        Y = "y",
        Z = "z",
        ZERO = "0",
        ONE = "1",
        TWO = "2",
        THREE = "3",
        FOUR = "4",
        FIVE = "5",
        SIX = "6",
        SEVEN = "7",
        EIGHT = "8",
        NINE = "9",
        UP = "ArrowUp",
        DOWN = "ArrowDown",
        LEFT = "ArrowLeft",
        Right = "ArrowRight",
        SPACE = 32,
        TAB = "Tab",
        SHIFT = "Shift",
        CONTROL = "Control",
        ALT = "Alt",
        BACKSPACE = "Backspace",
        ENTER = "Enter",
        OS = "OS",
        UNIDENTIFIED = "Unidentified",
        HOME = "Home",
        PGUP = "PageUp",
        PGDN = "PageDown",
        CLEAR = "Clear",
        DELETE = "Delete",
        ESCAPE = "Escape",
        INSERT = "Insert"
    },

    KeyCode =
    {
        A = 65,
        B = 66,
        C = 67,
        D = 68,
        E = 69,
        F = 70,
        G = 71,
        H = 72,
        I = 73,
        J = 74,
        K = 75,
        L = 76,
        M = 77,
        N = 78,
        O = 79,
        P = 80,
        Q = 81,
        R = 82,
        S = 83,
        T = 84,
        U = 85,
        V = 86,
        W = 87,
        X = 88,
        Y = 89,
        Z = 90,
        ZERO = 48,
        ONE = 49,
        TWO = 50,
        THREE = 51,
        FOUR = 52,
        FIVE = 53,
        SIX = 54,
        SEVEN = 55,
        EIGHT = 56,
        NINE = 57,
        UP = 38,
        DOWN = 40,
        LEFT = 37,
        RIGHT = 39,
        SPACE = 32,
        TAB = 9,
        SHIFT = 16,
        CONTROL = 17,
        ALT = 18,
        BACKSPACE = 8,
        ENTER = 13,
        NUMLOCK = 144,
        OS = 91,
        UNIDENTIFIED = 0,
        HOME = 36,
        PGUP = 33,
        PGDN = 34,
        CLEAR = 12,
        DELETE = 46,
        ESCAPE = 27,
        INSERT = 45
    }
}

MouseButton =
{
    LEFT = 0,
    RIGHT = 2,
    MIDDLE = 1
}

Swap = function(a,b)
    disposed = a
    a = b
    b = disposed
end

-- Module: Browser
Opera = navigator.userAgent:indexOf("Opera") > -1 or navigator.userAgent:indexOf("OPR") > -1
Firefox = navigator.userAgent:indexOf("Firefox") > -1
Safari = navigator.userAgent:indexOf("Safari") > -1
IE = navigator.userAgent:indexOf("Trident") > -1
Chrome = navigator.userAgent:indexOf("Chrome") > -1
Edge = navigator.userAgent:indexOf("Edge") > -1
SamsungInternet = navigator.userAgent:indexOf("SamsungBrowser") > -1

JRE = navigator:javaEnabled()
Language = navigator.language
Online = navigator.onLine

OpenURL = function(url)
    window:open(tostring(url))
end

ReloadHistory = function()
    window.location:reload()
end 

NextHistory = function()
    window.history:forward()
end

BackHistory = function()
    window.history:back()
end


-- Module: Cursor
HideCursor = function()
    cakecanvas.style.cursor = "none"
end

ShowCursor = function()
    cakecanvas.style.cursor = "auto"
end

SetCursor = function(img_src,type,cursor_size)
    cursor_image = ""
    if Unknown(cursor_size) then cursor_size = 10 end
    if type == "color" then 
        cakepen.fillStyle = img_src
        cakecanvas:addEventListener("mouseenter",function()
            HideCursor()
        end)
        cakecanvas:addEventListener("click",function() HideCursor() end)
        cakecanvas:addEventListener("mousemove",function(e)
            cakepen:arc(e.clientX, e.clientY, cursor_size, 90, 180 * math.pi)
            cakepen:fill() 
        end) 
        cakecanvas:addEventListener("mouseover",function(e)
            cakepen:arc(e.clientX, e.clientY, cursor_size, 90, 180 * math.pi)
            cakepen:fill() 
        end)  
        cakecanvas:addEventListener("mousedown",function(e)
            cakepen:arc(e.clientX, e.clientY, cursor_size, 90, 180 * math.pi)
            cakepen:fill() 
        end) 
        cakecanvas:addEventListener("touchmove",function(e)
            cakepen:arc(e.clientX or e.pageX, e.clientY or e.pageY, cursor_size, 90, 180 * math.pi)
            cakepen:fill()
        end) 
        cakecanvas:addEventListener("touchstart",function(e)
            cakepen:arc(e.clientX or e.pageX, e.clientY or e.pageY, cursor_size, 90, 180 * math.pi)
            cakepen:fill() 
        end)   
    end
    
    if type == "image" then
        cakecanvas:addEventListener("mouseenter",function() HideCursor() end) 
        cakecanvas:addEventListener("click",function() HideCursor() end)
        
        cursor_image = document:createElement("image")
        cursor_image.src = img_src
        cursor_image.height = cursor_size
        cursor_image.width = cursor_size
        
        cakecanvas:addEventListener("mousemove",function(e) 
            cakepen:drawImage(cursor_image,e.clientX,e.clientY)
        end) 
        cakecanvas:addEventListener("mouseover",function(e) 
            cakepen:drawImage(cursor_image,e.clientX,e.clientY)
        end) 
        cakecanvas:addEventListener("mousedown",function(e) 
            cakepen:drawImage(cursor_image,e.clientX,e.clientY)
        end)
        cakecanvas:addEventListener("touchmove",function(e) 
            cakepen:drawImage(cursor_image,e.clientX or e.pageX,e.clientY or e.pageY)
        end)
        cakecanvas:addEventListener("touchstart",function(e) 
            cakepen:drawImage(cursor_image,e.clientX or e.pageX,e.clientY or e.pageY)
        end)  
    end
    
    if type == "icon" then
        cakecanvas.style.cursor = img_src
    end
end

-- Module: Fullscreen
Fullscreen = window.fullscreen

ToggleFullscreen = function()
    screen = document.documentElement
    if screen.requestFullscreen then screen:requestFullscreen() end 
    if screen.mozRequestFullScreen then screen:mozRequestFullScreen() end
    if screen.webkitRequestFullscreen then screen:webkitRequestFullscreen() end 
    if screen.msRequestFullscreen then screen:msRequestFullscreen() end
end

ExitFullscreen = function()
    if document.exitFullscreen then document:exitFullscreen() end
	if document.mozCancelFullScreen then document:mozCancelFullScreen() end
	if document.webkitExitFullscreen then document:webkitExitFullscreen() end
	if document.msExitFullscreen then document:msExitFullscreen() end
end

-- Module: performance.now
calltime = window.performance:now()

GetPerformance = function()
    print("Calling Functions Performance: "..tostring(calltime).." Milliseconds");
end


-- Module: Pointer
LockPointer = function()
    if cakecanvas.requestPointerLock then cakecanvas:requestPointerLock() end
    if document.pointerLockElement.localName == "canvas" then cakecanvas:requestPointerLock() end
end

UnlockPointer = function()
    document:exitPointerLock()
end

-- Module: Testwall
Is = function(a,b,c)
    if a == b then 
        window:setTimeout(c,0)
    end
    return a == b,a,b,c
end


-- Module: localStorage
Save = function(variable_name,value)
    localStorage:setItem(variable_name,JSON:stringify(value))
end

Load = function(variable_name)
    JSON:parse(localStorage:getItem(variable_name))
end

Modify = function(variable_name,new_value)
    localStorage[variable_name] = new_value;
end 

ClearData = function()
    localStorage:clear()
end

-- Module: 2D Graphics
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

SetLineProperties = function(line_width)
    if Unknown(line_width) then line_width = 1 end
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

ClearAlpha = function()
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

SetCanvasBackground = function(bg)
    cakecanvas.style.background = bg
end

RemoveCanvasBackground = function()
    cakecanvas.style.background = "none"
end

-- Module: CanvasRenderingContext2D
-- Sorry But I Needed This Backend From CanvasRenderingContext2D.js
window:eval([[
    if(!CanvasRenderingContext2D.prototype.clear) 
{
    CanvasRenderingContext2D.prototype.clear = function() 
    {
        this.clearRect(0,0,this.canvas.width,this.canvas.height);
    };
}

if(!CanvasRenderingContext2D.prototype.fillCircle)
{
    CanvasRenderingContext2D.prototype.fillCircle = function(x,y,radius)
    {
        this.beginPath();
        this.arc(x,y,radius,90,180 * Math.PI);
        this.closePath();
        this.fill();
    };
}

if(!CanvasRenderingContext2D.prototype.strokeCircle)
{
    CanvasRenderingContext2D.prototype.strokeCircle = function(x,y,radius)
    {
        this.beginPath();
        this.arc(x,y,radius,90,180 * Math.PI);
        this.closePath();
        this.stroke();
    };
}


if(!CanvasRenderingContext2D.prototype.fillTriangle)
{
    CanvasRenderingContext2D.prototype.fillTriangle = function(x1,y1,x2,y2,x3,y3)
    {
        this.beginPath();
        this.moveTo(x1,y1);
        this.lineTo(x2,y2);
        this.lineTo(x3,y3);
        this.lineTo(x1,y1);
        this.closePath();
        this.fill();
    };
}

if(!CanvasRenderingContext2D.prototype.strokeTriangle)
{
    CanvasRenderingContext2D.prototype.strokeTriangle = function(x1,y1,x2,y2,x3,y3)
    {
        this.beginPath();
        this.moveTo(x1,y1);
        this.lineTo(x2,y2);
        this.lineTo(x3,y3);
        this.lineTo(x1,y1);
        this.closePath();
        this.stroke();
    };
}

if(!CanvasRenderingContext2D.prototype.fillPolygon)
{
    CanvasRenderingContext2D.prototype.fillPolygon = function(points)
    {
        this.beginPath();
        this.moveTo(points[0][0], points[0][1]);
    for(var i = 0; i < points.length; i++) this.lineTo(points[i][0], points[i][1]);
        this.closePath();
        this.fill();
    };
}

if(!CanvasRenderingContext2D.prototype.strokePolygon)
{
    CanvasRenderingContext2D.prototype.strokePolygon = function(points)
    {
        this.beginPath();
        this.moveTo(points[0][0], points[0][1]);
    for(var i = 0; i < points.length; i++) this.lineTo(points[i][0], points[i][1]);
        this.closePath();
        this.stroke();
    };
}

if(!CanvasRenderingContext2D.prototype.fillRoundedRect)
{
    CanvasRenderingContext2D.prototype.fillRoundedRect = function(x,y,width,height,radius)
    {
        this.beginPath();
        this.moveTo(x + radius,y);
        this.lineTo(x + width - radius,y);
        this.quadraticCurveTo(x + width,y,x + width,y + radius);
        this.lineTo(x + width,y + height - radius);
        this.quadraticCurveTo(x + width,y + height,x + width - radius,y + height);
        this.lineTo(x + radius,y + height);
        this.quadraticCurveTo(x,y + height,x,y + height - radius);
        this.lineTo(x,y + radius);
        this.quadraticCurveTo(x,y,x + radius,y);
        this.closePath();
        this.fill();
    };
}

if(!CanvasRenderingContext2D.prototype.strokeRoundedRect)
{
    CanvasRenderingContext2D.prototype.strokeRoundedRect = function(x,y,width,height,radius)
    {
        this.beginPath();
        this.moveTo(x + radius,y);
        this.lineTo(x + width - radius,y);
        this.quadraticCurveTo(x + width,y,x + width,y + radius);
        this.lineTo(x + width,y + height - radius);
        this.quadraticCurveTo(x + width,y + height,x + width - radius,y + height);
        this.lineTo(x + radius,y + height);
        this.quadraticCurveTo(x,y + height,x,y + height - radius);
        this.lineTo(x,y + radius);
        this.quadraticCurveTo(x,y,x + radius,y);
        this.closePath();
        this.stroke();
    };
}

if(!CanvasRenderingContext2D.prototype.fillAndStroke)
{
    CanvasRenderingContext2D.prototype.fillAndStroke = function()
    {
        this.fill();
        this.stroke();
    };
}

if(!CanvasRenderingContext2D.prototype.blur) 
{
    CanvasRenderingContext2D.prototype.blur = function(px) 
    { 
        this.canvas.style.filter += " blur(" + px + "px) "; 
    };
}

if(!CanvasRenderingContext2D.prototype.bright) 
{
    CanvasRenderingContext2D.prototype.bright = function(percentage) 
    {
        this.canvas.style.filter += " brightness(" + percentage + "%) ";
    };
}

if(!CanvasRenderingContext2D.prototype.contrast) 
{
    CanvasRenderingContext2D.prototype.contrast = function(percentage) 
    {
        this.canvas.style.filter += " contrast(" + percentage + "%) ";
    };
}


if(!CanvasRenderingContext2D.prototype.invert) 
{
    CanvasRenderingContext2D.prototype.invert = function(percentage)
    {
        this.canvas.style.filter += " invert(" + percentage + "%) ";
    };
}


if(!CanvasRenderingContext2D.prototype.grayscale) 
{
    CanvasRenderingContext2D.prototype.grayscale = function(percentage)
    {
        this.canvas.style.filter += " grayscale(" + percentage + "%) ";
    };
}

if(!CanvasRenderingContext2D.prototype.opacity) 
{
    CanvasRenderingContext2D.prototype.opacity = function(percentage) 
    {
        this.canvas.style.filter += " opacity(" + percentage + "%) ";
    };
}

if(!CanvasRenderingContext2D.prototype.saturate) 
{
    CanvasRenderingContext2D.prototype.saturate = function(percentage)
    {
        this.canvas.style.filter += " saturate(" + percentage + "%) ";
    };
}

if(!CanvasRenderingContext2D.prototype.sepia) 
{
    CanvasRenderingContext2D.prototype.sepia = function(percentage)
    {
        this.canvas.style.filter += " sepia(" + percentage + "%) ";
    };
}

if(!CanvasRenderingContext2D.prototype.rotateHue) 
{
    CanvasRenderingContext2D.prototype.rotateHue = function(percentage) 
    {
        this.canvas.style.filter += " hue-rotate(" + percentage + "%) ";
    };
}

if(!CanvasRenderingContext2D.prototype.setFilters) 
{
    CanvasRenderingContext2D.prototype.setFilters = function(filters)
    {
        this.canvas.style.filter = filters.toString();
    };
}

if(!CanvasRenderingContext2D.prototype.applyFilters) 
{
    CanvasRenderingContext2D.prototype.applyFilters = function(filters)
    {
        this.canvas.style.filter += filters.toString();
    };
}


if(!CanvasRenderingContext2D.prototype.clearFilters) 
{
    CanvasRenderingContext2D.prototype.clearFilters = function()
    {
        this.canvas.style.filter = "none";
    };
}

if(!CanvasRenderingContext2D.prototype.fillSquare) 
{
    CanvasRenderingContext2D.prototype.fillSquare = function(x,y,size)
    {
        this.fillRect(x,y,size,size);
    };
}

if(!CanvasRenderingContext2D.prototype.strokeSquare) 
{
    CanvasRenderingContext2D.prototype.strokeSquare = function(x,y,size)
    {
        this.strokeRect(x,y,size,size);
    };
}      

if(!CanvasRenderingContext2D.prototype.hideCanvas) 
{
    CanvasRenderingContext2D.prototype.hideCanvas = function()
    {
        this.canvas.style.visibility = "hidden";
    };
}


if(!CanvasRenderingContext2D.prototype.showCanvas) 
{
    CanvasRenderingContext2D.prototype.showCanvas = function()
    {
        this.canvas.style.visibility = "visible";
    };
}

if(!CanvasRenderingContext2D.prototype.removeCanvas) 
{
    CanvasRenderingContext2D.prototype.removeCanvas = function()
    {
        this.canvas.parentNode.removeChild(this.canvas);
    };
}

if(!CanvasRenderingContext2D.prototype.shear)
{
    CanvasRenderingContext2D.prototype.shear = function(sx,sy)
    {
        this.transform(1,sy,sx,1,0,0);
    };
}

if(!CanvasRenderingContext2D.prototype.flipHorizontally)
{
    CanvasRenderingContext2D.prototype.flipHorizontally = function()
    {
        this.scale(-1,1);
    };
}


if(!CanvasRenderingContext2D.prototype.flipVertically)
{
    CanvasRenderingContext2D.prototype.flipVertically = function()
    {
        this.scale(1,-1);
    };
}

if(!CanvasRenderingContext2D.prototype.flipContent)
{
    CanvasRenderingContext2D.prototype.flipContent = function()
    {
        this.scale(-1,-1);
    };
}


if(!CanvasRenderingContext2D.prototype.resetFlipping)
{
    CanvasRenderingContext2D.prototype.resetFlipping = function()
    {
        this.scale(1,1);
    };
}

if(!CanvasRenderingContext2D.prototype.line)
{
    CanvasRenderingContext2D.prototype.line = function(x1,y1,x2,y2,size)
    {
        this.lineWidth = size;
        this.beginPath();
        this.moveTo(x1,y1);
        this.lineTo(x2,y2);
        this.closePath();
        this.stroke();
    };
}

]])

-- Module: Filters
SetFilters = function(filters)
    cakecanvas.style.filter = filters
end

AddFilters = function(filters)
    cakecanvas.style.filter = cakecanvas.style.filter + filters
end

SetBlur = function(pixels)
    cakecanvas.style.filter = cakecanvas.style.filter + " blur("..pixels.."px) "
end

SetBrightness = function(percentage)
    cakecanvas.style.filter = cakecanvas.style.filter + " brightness("..percentage.."%) "
end

SetContrast = function(percentage)
    cakecanvas.style.filter = cakecanvas.style.filter + " contrast("..percentage.."%) "
end

SetGrayscale = function(percentage)
    cakecanvas.style.filter = cakecanvas.style.filter + " grayscale("..percentage.."%) "
end

SetInvert = function(percentage)
    cakecanvas.style.filter = cakecanvas.style.filter + " invert("..percentage.."%) "
end

SetOpacity = function(percentage)
    cakecanvas.style.filter = cakecanvas.style.filter + " opacity("..percentage.."%) "
end

SetSaturation = function(percentage)
    cakecanvas.style.filter = cakecanvas.style.filter + " saturate("..percentage.."%) "
end

SetSepia = function(percentage)
    cakecanvas.style.filter = cakecanvas.style.filter + " sepia("..percentage.."%) "
end

SetHueRotation = function(degrees)
    cakecanvas.style.filter = cakecanvas.style.filter + " hue-rotate("..degrees.."deg) "
end

RemoveFilters = function()
    cakecanvas.style.filter = "none"
end

Filter = {}

function Filter:new(name,px,per,deg)
    setmetatable(Filter,self)
    self.name = name
    self.pixels = px
    self.percentage = per
    self.degrees = deg
    self.filtervalue = 0
    return Filter
end

function Filter:Add()
    if not self.name == "blur" and not self.name == "hue-rotate" then
        self.filtervalue = self.percentage.."%"
    end
    if self.name == "blur" then
        self.filtervalue = self.pixels.."px"
    end
    if self.name == "hue-rotate" then
        self.filtervalue = self.degrees.."deg"
    end
	cakecanvas.style.filter = cakecanvas.style.filter + " "..self.name.."("..self.filtervalue..") "
end

-- Module: Media(Audio And Video)
-- Audio
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

-- Video
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

-- Module: Game Levels And window.update
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

window.update = function()
    return window.requestAnimationFrame or 
           window.webkitRequestAnimationFrame or
           window.msRequestAnimationFrame or
           window.msRequestAnimationFrame or
           window.oRequestAnimationFrame or
           function(callback,fps)
            window:setTimeout(callback, 1000 / fps);
           end
end

-- Module: Components (Game Objects)
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

-- Module: Execution
scripts_added = 0

Execute = function(code,loop,ms)
    if loop == 0 then window:setTimeout(code,0) end
    if loop == 1 then window:setTimeout(code,ms) end
    if loop == 2 then window:setInterval(code,0) end
    if loop == 3 then window:setInterval(code,ms) end
end

Import = function(script_source)
    script = document:createElement("script")
    script.src = tostring(script_source)
    script.type = "application/lua"
    script.async = true
    head = document:getElementsByTagName('head')
    head:appendChild(script)
end

AddJavaScript = function(script_source)
    script = document:createElement("script")
    script.src = tostring(script_source)
    script.type = "text/javascript"
    script.defer = true
    document:getElementsByTagName('head')[scripts_added]:appendChild(script)
    scripts_added = scripts_added + 1
end

-- Module: Game (Game Actions)
RestartGame = function()
    window.location:reload()
end
CloseGame = function()
    window:close()
end
Title = function(t)
    document.title = t
end
CrashGame = function()
    while true do console:log(0) end
end
ViewSourceCode = function(index)
    window:open(document.scripts[index].src)
end
ViewGameSourceCode = function()
    window:open(document.scripts[2].src)
end
StartProcess = function(dir)
    window:open("file:///"..tostring(dir))
end
UpdateEngine = function()
    cake_engine = document:createElement("script")
    cake_engine.src = "https://cdn.jsdelivr.net/gh/Cake-Engine/Cake@master/build/cake.js"
    cake_engine.type = 'text/javascript'
    cake_engine.defer = true
    head = document:getElementsByTagName('head')
    head:appendChild(cake_engine);
end
Destroy = function(component)
    if not component.destroyed then component:Destroy() end
end

-- Module: Game Cameras
cx = 0
cy = 0
cz = 0

SetCameraPosition = function(x,y,z) 
    if Unknown(x) then x = 0 end
    if Unknown(y) then y = 0 end
    if Unknown(z) then z = 0 end
    cx = x
    cy = y
    cz = z
end

InitializeCamera = function(mode,scene)
    if Unknown(mode) then mode = "canvas" end
    
    if mode == "canvas" then
        window:setInterval(function()
            cakepen:translate(cx,cy)
        end,0)
    end
    
    if mode == "space" then
        window:setInterval(function()
            scene.camera.x = cx
            scene.camera.y = cy
            scene.camera.z = cz
        end,0)
    end
    
    if mode == "webgl" then
        window:setInterval(function()
            cakepen:translate(cx,cy,cz)
        end,0)
    end

end

MoveCamera = function(x,y,z)
    cx = cx + x
    cy = cy + y
    cz = cz + z
end

FreezeCamera = function()
    cx = 0
    cy = 0
    cz = 0
end

-- Module: Integration
cake = 0
IntegrateWith = function(engine)

    if engine == "tululoo" then
        tu_canvas = cakecanvas
        tu_context = cakepen
    end

    if engine == "blacksmith" then
        CANVAS = cakecanvas
        CONTEXT = cakepen
    end

    if engine == "blocksjs" then
        cakecanvas = window:eval("canvasElement")
        cakepen = window:eval("layer.ctx")
    end

    if engine == "booty" then
        window:eval("b5.Display.canvas = cakecanvas;")
        window:eval("b5.Display.context = cakepen;")
        cake = window:eval("b5")
    end

    if engine == "cartridge" then
        window:eval("canvas = cakecanvas;")
        window:eval("ctx = cakepen;");
    end

    if engine == "easel" then
        window:eval("canvas = cakecanvas;")
        window:eval("Graphics._ctx = cakepen")
    end

    if engine == "pixi" then
        window:eval("PIXI.Graphics = cakepen;")
        cake = window:eval("PIXI")
    end

    if engine == "iio" then
        window:eval("iio = cake;")
    end

    if engine == "quark" then
        cake = window:eval("Quark")
        window:eval("Quark._helpContext.canvas = cakecanvas;")
        window:eval("Quark._helpContext.context = cakepen;")
    end

    if engine == "quintus" then
        cake = window:eval("Q")
        window:eval("Q.ctx.canvas = cakecanvas;")
        window:eval("Q.ctx = cakepen;")
    end

    if engine == "simplegameengine" then
        cakecanvas = window:eval("_tempCanvas2D.canvas")
        cakepen = window:eval("_tempCanvas2D")
    end

    if engine == "oversimplified" then
        cake = window:eval("Oversimplified")
        window:eval("Oversimplified.canvas = cakecanvas;")
        window:eval("Oversimplified.context = cakepen;")
    end

    if engine == "joy" then
        cake = window:eval("Joy")
        window:eval("Joy.currentEngine.context.canvas = cakecanvas;")
        window:eval("Joy.currentEngine.context.ctx = cakepen;")
    end

    if engine == "gamvas" then 
        cake = window:eval("gamvas")
        window:eval("gamvas._canvas = cakecanvas;")
        window:eval("gamvas._context2D = cakepen;")
    end

    if engine == "nini" then
        window:eval("Graphics.canvas = cakecanvas;")
        window:eval([[cakepen = Graphics.canvas:getContext("2d")]])
    end

    if engine == "squarepig" then
        window:eval("pig.canvas = cakecanvas;")
        window:eval("pig.context = cakepen;")
        cake = window:eval("pig")
    end

    if engine == "threejs" then
        window:eval("THREE = cake;")
    end

    if engine == "hilo" then
        cake = window:eval("Hilo")
    end

    if engine == "hilo3d" then
        cake = window:eval("Hilo3d")
    end

    if engine == "stage" then
        cake = window:eval("Stage")
        window:eval("ctx = cakepen;")
        window:eval("stage = cakecanvas;")
    end

    if engine == "arcadejs" then
        cake = window:eval("ArcadeJS")
        window:eval("ArcadeJS._firstGame.canvas = cakecanvas;")
        window:eval("ArcadeJS._firstGame.context = cakepen;")
    end
end

-- Module: Controls
CanvasTouched = false
CanvasClicked = false
CanvasSwiped = false
CanvasDragged = false
OverCanvas = false
Listen = function()
    cakecanvas:addEventListener("click",function()
        CanvasClicked = true
    end)
    cakecanvas:addEventListener("mouseover",function()
        OverCanvas = true
    end)
    cakecanvas:addEventListener("touchstart",function()
        CanvasTouched = true
    end)
    cakecanvas:addEventListener("touchmove",function()
        CanvasSwiped = true
    end)
    cakecanvas:addEventListener("drag",function()
        CanvasDragged = true
    end)
end

-- Module: Input Handlers
AddKeyDownHandler = function(f)
    window:addEventListener("keydown",f)
end

AddKeyUpHandler = function(f)
    window:addEventListener("keyup",f)
end

AddKeyHitHandler = function(f)
    window:addEventListener("keypress",f)
end

AddMouseDownHandler = function(f)
    window:addEventListener("mousedown",f)
end

AddMouseMoveHandler = function(f)
    window:addEventListener("mousemove",f)
end

AddClickHandler = function(f)
    window:addEventListener("click",f)
end

AddTapHandler = function(f)
    window:addEventListener("touchstart",f)
end

AddSwipeHandler = function(f)
    window:addEventListener("touchmove",f)
end

-- Module: Input
KeyUp = function() end
KeyDown = function() end
KeyHit = function() end
Tap = function() end
Swipe = function() end
Click = function() end
Hover = function() end
MouseButtonDown = function() end
MouseButtonUp = function() end

GamepadID = function(gamepad_index)
   return navigator:getGamepads()[gamepad_index].id
end

GamepadConnected = function(gamepad_index)
   return navigator:getGamepads()[gamepad_index].connected
end

GamepadButtonPressed = function(gamepad_index,button)
    return navigator:getGamepads()[gamepad_index].buttons[button].pressed
end

GamepadButtonTouched = function(gamepad_index,button)
    return navigator:getGamepads()[gamepad_index].buttons[button].touched
end

GamepadAxeValue = function(gamepad_index,axe)
    return navigator:getGamepads()[gamepad_index].axes[axe]
end

document.onkeyup = KeyUp
document.onkeydown = KeyDown
document.onkeypress = KeyHit
document.ontouchstart = Tap
document.ontouchmove = Swipe
document.onclick = Click
document.onmousedown = MouseButtonDown
document.onmouseup = MouseButtonUp
document.onmouseover = Hover

-- Module: GUI
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

-- Module: Window
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

-- Module: Physics
CheckCollisionRect = function(r1,r2)
    return r1.x < r2.x + r2.width and
           r1.x + r1.width > r2.x and 
           r1.y < r2.y + r2.height and
           r1.y + r1.height > r2.y and
           r1.collidable and
           r2.collidable
end
CheckCollisionRectAdvanced = function(r1_x,r1_y,r1_width,r1_height,r2_x,r2_y,r2_width,r2_height)
    return r1_x < r2_x + r2_width and
           r1_x + r1_width > r2_x and
           r1_y < r2_y + r2_height and
           r1_y + r1_height > r2_y
end
CheckCollisionCircle = function(c1,c2)
    return math.sqrt((c1.x - c2.x * c1.x - c2.x) + (c1.y + c2.y * c1.y + c2.y)) < c1.radius + c2.radius and
    c1.collidable and
    c2.collidable
end
CheckCollisionCircleAdvanced = function(c1_x,c1_y,c1_r,c2_x,c2_y,c2_r)
    return math.sqrt((c1_x - c2_x * c1_x - c2_x) + (c1_y + c2_y * c1_y + c2_y)) < c1_r + c2_r
end
CheckCollisionCircleRect = function(c1,r1)
    if math.abs(c1.x - r1.x - r1.width / 2) > (r1.width / 2 + c1.radius) or
    math.abs(c1.y - r1.y - r1.height / 2) > (r1.height / 2 + c1.radius) then 
        return false
    end

    if math.abs(c1.x - r1.x - r1.width / 2) <= (r1.width / 2) or
    math.abs(c1.y - r1.y - r1.height / 2) <= (r1.height / 2) then 
        return true
    end
    return (math.abs(c1.x - r1.x - r1.width / 2) - r1.width / 2 * math.abs(c1.x - r1.x - r1.width / 2) - r1.width / 2 + math.abs(c1.y - r1.y - r1.height / 2) - r1.height / 2 * math.abs(c1.y - r1.y - r1.height / 2) - r1.height / 2 <= (c1.radius * c1.radius)) and c1.collidable and r1.collidable
end
CheckCollisionCircleRectAdvanced = function(c1_x,c1_y,c1_r,r1_x,r1_y,r1_width,r1_height)

    if math.abs(c1_x - r1_x - r1_width / 2) > (r1_width / 2 + c1_r) or
    math.abs(c1_y - r1_y - r1_height / 2) > (r1_height / 2 + c1_r) then return false end
    
    if (math.abs(c1_x - r1_x - r1_width / 2) <= (r1_width / 2) or
    math.abs(c1_y - r1_y - r1_height / 2) <= (r1_height / 2)) then return true end

    return math.abs(c1_x - r1_x - r1_width / 2) - r1_width / 2 * math.abs(c1_x - r1_x - r1_width / 2) - r1_width / 2 + math.abs(c1_y - r1_y - r1_height / 2) - r1_height / 2 * math.abs(c1_y - r1_y - r1_height / 2) - r1_height / 2 <= (c1_r * c1_r) 
end
CheckCanvasCollisionLeft = function(object)
    return object.x <= object.width * 0.5
end
CheckCanvasCollisionRight = function(object)
    return object.x + object.width >= cakecanvas.width + object.width * 0.5
end
CheckCanvasCollisionTop = function(object)
    return object.y <= object.height * 0.5 
end
CheckCanvasCollisionBottom = function(object)
    return object.y + object.height >= cakecanvas.height + object.height * 0.5
end
CheckCanvasCollisionLeftAdvanced = function(object_x,object_width)
    return object_x <= object_width * 0.5
end
CheckCanvasCollisionRightAdvanced = function(object_x,object_width)
    return object_x + object_width >= cakecanvas.width + object_width * 0.5
end
CheckCanvasCollisionTopAdvanced = function(object_y,object_height)
    return object_y <= object_height * 0.5
end
CheckCanvasCollisionBottomAdvanced = function(object_y,object_height)
    return object_y + object_height >= cakecanvas.height + object_height * 0.5
end
CheckCollisionCircleLeftCanvas = function(c1)
    return c1.x + c1.speedX < c1.radius;
end
CheckCollisionCircleLeftCanvasAdvanced = function(c1_x,c1_speedX,c1_r)
    return c1_x + c1_speedX < c1_r;
end
CheckCollisionCircleRightCanvas = function(c1)
    return c1.x + c1.speedX > cakecanvas.width - c1.radius;
end
CheckCollisionCircleRightCanvasAdvanced = function(c1_x,c1_speedX,c1_r)
    return c1_x + c1_speedX > cakecanvas.width - c1_r;
end
CheckCollisionCircleTopCanvas = function(c1)
    return c1.y + c1.speedY < c1.radius;
end
CheckCollisionCircleTopCanvasAdvanced = function(c1_y,c1_speedY,c1_r)
    return c1_y + c1_speedY < c1_r;
end
CheckCollisionCircleBottomCanvas = function(c1)
    return c1.y + c1.speedY > cakecanvas.height - c1.radius;
end
CheckCollisionCircleBottomCanvasAdvanced = function(c1_y,c1_speedY,c1_r)
    return c1_y + c1_speedY > cakecanvas.height - c1_r;
end

CheckCollisionPointSphere = function(point,sphere)
    return math.sqrt((point.x - sphere.x) * (point.x - sphere.x) +
                     (point.y - sphere.y) * (point.y - sphere.y) +
                     (point.z - sphere.z) * (point.z - sphere.z)) < sphere.radius
end

CheckCollisionSpheres = function(sphere1,sphere2)
    return math.sqrt((sphere1.x - sphere2.x) * (sphere1.x - sphere2.x) +
                     (sphere1.y - sphere2.y) * (sphere1.y - sphere2.y) +
                     (sphere1.z - sphere2.z) * (sphere1.z - sphere2.z)) < (sphere1.radius + sphere2.radius)
end

CheckCollisionCubes = function(cube1,cube2)
    if math.abs(cube1.x - cube2.x) < cube1.size + cube2.size then
      if math.abs(cube1.y - cube2.y) < cube1.size + cube2.size then
          if math.abs(cube1.z - cube2.z) < cube1.size + cube2.size then return true end
        end
    end
end

CheckCollisionCuboids = function(cuboid1,cuboid2)
    if math.abs(cuboid1.x - cuboid2.x) < cuboid1.scalation[1] + cuboid2.scalation[1] then
        if math.abs(cuboid1.y - cuboid2.y) < cuboid1.scalation[2] + cuboid2.scalation[2] then
            if math.abs(cuboid1.z - cuboid2.z) < cuboid1.scalation[3] + cuboid2.scalation[3] then return true end
          end
      end
end

-- Module: Loading And Splashscreen
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

SetSplashscreen = function(src,level,time)
    cakecanvas.style.backgroundImage = "url("..tostring(src)..")"
    window:setTimeout(function()
        cakecanvas.style.backgroundImage = "none"
        level:Start()  
    end,time)
end

-- Module: Browser Compatibility
window.requestAnimationFrame = window.requestAnimationFrame or window.mozRequestAnimationFrame or window.msRequestAnimationFrame or window.oRequestAnimationFrame or window.webkitRequestAnimationFrame
window.cancelAnimationFrame = window.cancelAnimationFrame or window.mozCancelAnimationFrame or window.webkitCancelAnimationFrame
document.documentElement.requestFullscreen = document.documentElement.requestFullscreen or document.documentElement.mozRequestFullScreen or document.documentElement.msRequestFullscreen or document.documentElement.webkitRequestFullscreen
document.exitFullscreen = document.exitFullscreen or document.mozCancelFullScreen or document.msExitFullscreen or document.webkitExitFullscreen
document.requestPointerLock = document.requestPointerLock or document.mozRequestPointerLock or document.webkitRequestPointerLock
document.exitPointerLock = document.exitPointerLock or document.mozExitPointerLock or document.webkitExitPointerLock

-- Module: Cheat
cheat = 0
InputCheatCode = function()
    cheat = window:prompt("Enter Cheatcode:")
end
CheckCheatCode = function(cheatcode)
    return cheat == cheatcode
end
SetCheatCode = function(cheatcode)
    cheat = cheatcode
end

-- Module: Compiler
Unknown = function(x)
    return x == nil
end

FixValue = function(x,t)
    if x == nil and t == "bool" then
        x = false
    end
    if x == nil and t == "string" then
        x = ""
    end
    if x == nil and t == "char" then
        x = ''
    end
    if x == nil and t == "int" then
        x = 0
    end
    -- Array Here Is Table For Some Reasons
    if x == nil and t == "array" then
        x = {}
    end
end

FixValuesFromArray = function(arr,t)
    for x in pairs(arr) do
        if arr[x] == nil and t == "bool" then
            arr[x] = false
        end
        if arr[x] == nil and t == "string" then
            arr[x] = ""
        end
        if arr[x] == nil and t == "char" then
            arr[x] = ''
        end
        if arr[x] == nil and t == "int" then
            arr[x] = 0
        end
        if arr[x] == nil and t == "array" then
            arr[x] = {}
        end
    end
end

Help = function(f)
    if type(f) == "function" then console:log(f) end
end
-- Do() For Lua,Eval() For JavaScript
Do = function(lua_code)
    window:eval("fengari.load("..lua_code..")();")
end

Eval = function(js_code)
    window:eval(js_code)
end

-- Module: Game Events
OnAwake = function(f)
    window.onload = function()
        window:setTimeout(f,0)
    end
end
OnStart = function(f)
    window.onload = function()
        window:setTimeout(f,1000)
    end
end
OnUpdate = function(f)
    window.onload = function()
        window:setInterval(f,1)
    end
end
OnClose = function(f)
    window.onclose = function()
        window:setTimeout(f,0)
    end
end
OnLevelStart = function(level,f)
    if level.started or level.resumed then window:setTimeout(f,0) end
end
OnLevelPause = function(level,f)
    if level.paused then window:setTimeout(f,0) end
end
OnDestroy = function(component,f)
    if component.destroyed then window:setTimeout(f,0) end
end
OnCollision = function(component_1,component_2,f)
    if CheckCollisionRect(component_1,component_2) then window:setTimeout(f,1) end
    if CheckCollisionCircle(component_1,component_2) then window:setTimeout(f,1) end
    if CheckCollisionCircleRect(component_1,component_2) then window:setTimeout(f,1) end
end
OnRotate = function(component,f)
    if component.rotated then window:setTimeout(f,0) end
end

-- Module: Exceptions
StartConsoleTimer = function()
    console:timer()
end

EndConsoleTimer = function()
    console:timerEnd()
end

Trace = function()
    console:trace()
end

Info = function(title,info)
    console:info(tostring(title)..":\n"..tostring(info))
end

Warn = function(name,description)
    console:warn(tostring(name)..": "..tostring(description))
end

Error = function(name,code,description)
    console:error("\nERROR CODE: "..code.."\nERROR NAME: "..tostring(name) + "\nERROR DESCRIPTION: "..tostring(description))
end

Exception = function(name,code,description)
    window:eval("throw".."\nEXCEPTION CODE: " + code + "\nEXCEPTION NAME: " + tostring(name) + "\nEXCEPTION DESCRIPTION: " + tostring(description))
end

-- Module: Log And Track Input
Key = ""
KeyCode = 0
MouseX = 0
MouseY = 0
MouseButton = 0
MouseButtonName = ""
TouchX = 0
TouchY = 0

Log = function(log)
	console:log(log)
end

RecordKeyboard = function(KeyboardKey)
	Key = KeyboardKey.key
	KeyCode = KeyboardKey.keyCode
	console:info("Key Pressed: "..Key.." , KeyCode: "..KeyCode)	
end

RecordMouse = function(event)

	MouseX = event.clientX
	MouseY = event.clientY
	MouseButton = event.button
	if MouseButton == 0 then MouseButtonName = "Left" end
	if MouseButton == 1 then MouseButtonName = "Middle(Wheel)" end
	if MouseButton == 2 then MouseButtonName = "Right" end
	console:info("Mouse X Position: "..MouseX.." , Mouse Y Position: "..MouseY.." , Button Pressed: "..MouseButtonName.." Mouse Button")
end

RecordTouch = function(event)
	TouchX = event.clientX or event.pageX
	TouchY = event.clientY or event.pageY
	console.info("Touch X Position: "..TouchX.." , Touch Y Position: "..TouchY)
end

RecordMotion = function(event)
	console.log("Acceleration X: "..event.accelerationIncludingGravity.x.." , Acceleration Y: "..event.accelerationIncludingGravity.y)
end

document:addEventListener("keydown",RecordKeyboard)
document:addEventListener("keyup",RecordKeyboard)
document:addEventListener("mousemove",RecordMouse)
document:addEventListener("click",RecordMouse)
document:addEventListener("touchmove",RecordTouch)
document:addEventListener("touchstart",RecordTouch)

EnableAccelerometer = function()
	document:addEventListener("devicemotion",RecordMotion) -- Did This For Not Conflicting With Other Browsers(Other Than Chrome)
end

ClearConsole = function()
	console:clear()
end

-- Module: Modding
ApplyMod = function(mod_code)
    window:setInterval(mod_code,0)
end

-- Module: Support (Features Supporting Detection)
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

-- Module: Blackberry
BB_GetAppInfo = function()
    window:eval([[console.info(`Blackberry Application Info:\nApplication Name: ${ blackberry.app.name }\nApplication Version: ${ blackberry.app.version }\nApplication ID: ${ blackberry.app.id }\nApplication Developer: ${ blackberry.app.author }\nApplication Developer URL: ${ blackberry.app.authorURL }\nApplication Copyright: ${ blackberry.app.copyright }\nApplication Description: ${ blackberry.app.description }\nApplication State: ${ blackberry.app.windowState }\nApplication Screen Orientation: ${ blackberry.app.orientation }\nApplication Developer Email: ${ blackberry.app.authorEmail }\nApplication License: ${ blackberry.app.license }\nApplication License URL: ${ blackberry.app.licenseURL }\n`);]])
end

BB_CloseApp = function()
    window:eval("blackberry.app.exit();")
end

BB_Minimize = function()
    window:eval("blackberry.app.minimize();")
end

BB_UnlockScreenOrientation = function()
    window:eval("blackberry.app.unlock();")
end

BB_LockScreenOrientation = function(screen_orientation)
    window:eval([[blackberry.app.lock(]]..screen_orientation..[[);]])
end

BB_GetUserIDVersion = function()
    window:eval("blackberry.user.identity.getVersion();")
end

BB_GetTimezones = function()
    window:eval("blackberry.system.getTimezones();")
end

BB_GetFont = function()
    window:eval("blackberry.system.getFontInfo();")
end

BB_GetCurrentTimezone = function()
    window:eval("blackberry.system.getCurrentTimezone();")
end

BB_SetWallpaper = function(image_location)
    window:eval([[blackberry.system.setWallpaper(]]..image_location..[[);]])
end

BB_Rotate = function(screen_orientation)
    window:eval([[blackberry.app.rotate(]]..screen_orientation..[[);]])
end

-- Module: Content
AddContent = function(source,w,h)
    content = document:createElement("object")
    content.data = source
    content.width = w
    content.height = h
    body = document:getElementsByTagName("body")
    body:appendChild(content)
end

-- Module: Apache Cordova
CORDOVA_GetDeviceInfo = function()
    window:eval([[console.info(`Device Informations:\nDevice Model: ${ device.model }\nDevice Manufacturer: ${ device.manufacturer }\nDevice Version: ${ device.version }\nDevice UUID: ${ device.uuid }\nDevice Serial Number: ${ device.serial }\nOperating System: ${ device.platform }\nCordova Version: ${ device.cordova }\nEmulated: ${ device.isVirtual }`);]])
end

CORDOVA_ShowSplashscreen = function()
    navigator.splashscreen:show()
end

CORDOVA_HideSplashscreen = function()
    navigator.splashscreen:hide()
end

CORDOVA_SetStatusBar = function(color,color_name,isWebView)
    if isWebView then
        window:eval("StatusBar.overlaysWebView(true);")
    end

    if color == "default" then
        window:eval("StatusBar.styleDefault();")
    end

    if color == "name" then
        window:eval("StatusBar.backgroundColorByName("..color_name..");")
    end

    if color == "light-content" then
        window:eval("StatusBar.styleLightContent();")
    end

    if color == "black-transculent" then
        window:eval("StatusBar.styleBlackTransculent();")
    end

    if color == "black-opaque" then
        window:eval("StatusBar.styleBlackOpaque();")
    end

    if color == "hex" then
        window:eval("StatusBar.backgroundColorByHexString("..color_name..");")
    end	
end

CORDOVA_ShowStatusBar = function()
    window:eval("StatusBar.show()")
end

CORDOVA_HideStatusBar = function()
    window:eval("StatusBar.hide()")
end

CORDOVA_CancelVibration = function()
    navigator:vibrate(0)
end

CORDOVA_StatusBarVisible = function()
    window:eval("return(StatusBar.isVisible);")
end

-- Module: Mobile
Vibrate = function(x)
    navigator:vibrate(x)
end
StopVibrating = function()
    navigator:vibrate(0)
end
ShowBatteryLevel = function()
    console:info("Battery Level: "..tostring(navigator.battery.level * 100).."%")
end
UnlockDeviceRotation = function()
    window.ScreenOrientation:unlock()
end
LockDeviceRotation = function(position)
    window.ScreenOrientation:lock(tostring(position))
end

-- Module: Simulation
SimulateMobile = function()
    document.onclick = document.onclick or document.onmousedown or document.ontouchstart
    document.ontouchmove = document.ontouchmove or document.onpointermove or document.onmousemove;
    document.ontouchcancel = document.ontouchcancel or document.ontouchend or document.onmouseleave or document.onpointerleave or document.onpointerout
    document.ontouchstart = document.ontouchstart or document.onmouseenter or document.onpointerenter or document.onmouseover or document.onpointerover
end
SimulateDesktop = function()
    document.onclick = document.onclick or document.onmousedown or document.ontouchstart
    document.onmousemove = document.onmousemove or document.ontouchmove or document.onpointermove
    document.onmouseleave = document.onmouseleave or document.ontouchend or document.ontouchcancel or document.onpointerleave or document.onpointerout
    document.onmouseenter = document.onmouseenter or document.ontouchstart or document.onpointerenter or document.onmouseover or document.onpointerover
end

-- Module: System
BrowserClientPlatform = navigator.platform
OS = window.navigator.userAgent

-- Module: Target
iOS = navigator.userAgent:match("iPhone" or "iPad" or "iPod" or "Apple-iPhone")
Android = navigator.userAgent:match("Android")
Mac = navigator.userAgent:match("Macintosh" or "Intel Mac OS X")
Windows = navigator.userAgent:match("Windows" or "Windows Phone" or "Windows NT")
Windows_Phone = navigator.userAgent:match("Windows Phone")
Blackberry = navigator.userAgent:match("Blackberry" or "BB")
Linux = navigator.userAgent:match("Android" or "Linux" or "Ubuntu" or "X11")
Ubuntu = navigator.userAgent:match("Ubuntu" or "X11")
Chromecast = navigator.userAgent:match("CrKey")
Chrome_OS = navigator.userAgent:match("CrOS")
PS4 = navigator.userAgent:match("PlayStation 4")
Playstation = navigator.userAgent:match("PlayStation")
PSVita = navigator.userAgent:match("PlayStation Vita")
XB1 = navigator.userAgent:match("Xbox One")
XB1S = navigator.userAgent:match("XBOX_ONE_ED")
XBOX = navigator.userAgent:match("Xbox" or "XBOX_ONE_ED" or "Xbox One")
Nintendo = navigator.userAgent:match("Nintendo")
N_3DS = navigator.userAgent:match("Nintendo 3DS")
WiiU = navigator.userAgent:match("Nintendo WiiU")
FireTV = navigator.userAgent:match("AFTS")
Roku_Ultra = navigator.userAgent:match("Roku4640X")
Roku = navigator.userAgent:match("Roku")
Google_Nexus_Player = navigator.userAgent:match("Nexus Player")
Minix_NEO_X5 = navigator.userAgent:match("NEO-X5")
AppleTV = navigator.userAgent:match("AppleTV")
Kindle = navigator.userAgent:match("Kindle")
Google_Bot = navigator.userAgent:match("Googlebot")
ChromeDevice = navigator.userAgent:match("Cr")
Bing_Bot = navigator.userAgent:match("bingbot")
Yahoo_Bot = navigator.userAgent:match("Yahoo!")
OperaMini = navigator.userAgent:match("Opera Mini")
Desktop = navigator.userAgent:match("Windows" or "Windows Phone" or "Windows NT" or "Macintosh" or "Intel Mac OS X" or "Android" or "Linux" or "Ubuntu" or "X11" or "CrKey" or "CrOS")
Mobile = navigator.userAgent:match("Android" or "Linux" or "Ubuntu" or "iPhone" or "iPad" or "iPod" or "Apple-iPhone" or "Blackberry" or "BB" or "Windows Phone")
Console = navigator.userAgent:match("PlayStation" or "Nintendo" or "Xbox" or "XBOX")
TV = navigator.userAgent:match("AppleTV" or "CrKey" or "CrOS" or "Roku" or "AFTS" or "Nexus Player")

-- Module: Tracking
RAM = navigator.deviceMemory
OS_Codename = window.navigator.oscpu
Location = navigator.geolocation
Device_Languages = navigator.languages

TrackGameObject = function(object)
    console:info("Object "..object.name.." Properties:\nX Position: "..object.x.."\nY Position: "..object.y.."\nWidth: "..object.width.."\nHeight: "..object.width.."\nSpeed X: "..object.speedX.."\nSpeed Y: "..object.speedY.."\nGravity: "..object.gravity.."\nGravity Speed: "..object.gravitySpeed.."\nBouncing: "..object.bounce.."\n")
end

TrackWebGL = function()
    gl = document:createElement("canvas"):getContext("webgl")
    ext = gl:getExtension("WEBGL_debug_renderer_info")
	console:info("WebGL Properties:\nWebGL Version: "..gl.getParameter(gl.VERSION).."\nWebGL GLSL Version: "..gl.getParameter(gl.SHADING_LANGUAGE_VERSION).."\nWebGL Vendor/Provider: "..gl.getParameter(gl.VENDOR).."\nWebGL GPU Vendor: "..gl.getParameter(ext.UNMASKED_VENDOR_WEBGL).."\nPC GPU: "..gl.getParameter(ext.UNMASKED_RENDERER_WEBGL).."\n")
end

TrackDevice = function()
    console:info("Device Info:\nDevice OS: "..window.navigator.userAgent.."\nDevice Browser OS: "..navigator.platform.."\nDevice Language: "..navigator.language.."\nJava Enabled: "..navigator:javaEnabled().."\nIs The Device Online: "..navigator.onLine.."\nDevice RAM: "..navigator.deviceMemory.."GB\nOperating System Real Name: "..window.navigator.oscpu.."\nDevice Location: "..navigator.geolocation.."\nLanguages List: "..navigator.languages.."\n")
end

TrackCanvas = function()
    console:info("Game Canvas Info:\nCanvas Height: "..cakecanvas.height.."\nCanvas Width: "..cakecanvas.width.."\n")
end


-- Module: WebGL And LightGL 3D
window:addEventListener("load",function()
    AddJavaScript("https://cdn.jsdelivr.net/gh/Rabios/lightgl.js/lightgl.js")
end)

window:addEventListener("online",function()
    AddJavaScript("https://cdn.jsdelivr.net/gh/Rabios/lightgl.js/lightgl.js")
end)

-- NOTES: It Uses LightGL As 3rd Party
cakepen = 0
cakecanvas = 0
cake_webgl_debugger = 0
TRIANGLES = 0
LINES = 0
FAN = 0
LINELOOP = 0
POINTS = 0
LINESTRIP = 0
VERTEX = 0
FRAGMENT = 0
TRISTRIP = 0
program = 0
buffer = 0
shader = 0
GPU = 0
GLSL_VER = 0
VENDOR = 0
GL_VER = 0
UNMASKED = 0
cakecanvas2d = 0
cakepen2d = 0
current_program = 0
current_buffer = 0
current_vertex_shader = 0
current_fragment_shader = 0

-- Starting
InitializeWebGL = function(c)
    if Unknown(c) then c = 0 end
    cakecanvas = document:getElementsByTagName("canvas")[c]
    cakepen = cakecanvas:getContext('webgl2')
    if cakepen then console:info("CAKE GAME ENGINE: INITIALIZING WebGLRenderingContext...") end
    if not cakepen then console:error("WEBGL NOT SUPPORTED!!!") end
    TRIANGLES = cakepen.TRIANGLES
    LINES = cakepen.LINES
    POINTS = cakepen.POINTS
    TRIFAN = cakepen.TRIANGLE_FAN
    TRISTRIP = cakepen.TRIANGLE_STRIP
    LINELOOP = cakepen.LINE_LOOP
    LINESTRIP = cakepen.LINE_STRIP
    GL_VER = cakepen:getExtension(cakepen.VERSION)
    GLSL_VER = cakepen:getParameter(cakepen.SHADING_LANGUAGE_VERSION)
    VENDOR = cakepen:getParameter(cakepen.VENDOR)
end

InitializeLightGL = function() 
    cakepen = window:eval("GL.create()");
    cakecanvas = cakepen.canvas
    EnableScissor(true)
    TRIANGLES = cakepen.TRIANGLES
    LINES = cakepen.LINES
    POINTS = cakepen.POINTS
    VERTEX = cakepen.VERTEX_SHADER
    FRAGMENT = cakepen.FRAGMENT_SHADER
    TRIFAN = cakepen.TRIANGLE_FAN
    TRISTRIP = cakepen.TRIANGLE_STRIP
    LINELOOP = cakepen.LINE_LOOP
    LINESTRIP = cakepen.LINE_STRIP
    GL_VER = cakepen:getExtension(cakepen.VERSION)
    GLSL_VER = cakepen:getParameter(cakepen.SHADING_LANGUAGE_VERSION)
    VENDOR = cakepen:getParameter(cakepen.VENDOR)
end


-- Drawing
ClearCanvasFully = function()
    cakepen:clearColor(0,0,0,0)
    cakepen:clearDepth(1.0)
    cakepen:clear(cakepen.COLOR_BUFFER_BIT)
    cakepen:clear(cakepen.DEPTH_BUFFER_BIT)
end

WebGLClearCanvas = function(r,g,b,a)
    if Unknown(r) then r = 0 end
    if Unknown(g) then g = 0 end
    if Unknown(b) then b = 0 end
    if Unknown(a) then a = 0 end
    cakepen:clearColor(r,g,b,a)
    cakepen:clear(cakepen.COLOR_BUFFER_BIT)
end

DrawCube = function(shaders,position,rotation,size,options)
    cube_shaders = window:eval([[new GL.Shader(]]..shaders[1]..[[,]]..shaders[2]..[[);]])
    cakepen:loadIdentity()
    cakepen:translate(position[1],position[2],position[3])
    cakepen:rotate(rotation[1],rotation[2],rotation[3],rotation[4])
    cakepen:scale(size,size,-size)
    cube_shaders:draw(window:eval("GL.Mesh.cube("..options..");"))
    cakepen:translate(-position[1],-position[2],-position[3])
    cakepen:rotate(-rotation[1],-rotation[2],-rotation[3],-rotation[4])
    cakepen:scale(-size,-size,size)
end

DrawSphere = function(shaders,position,rotation,scalation,options) 
    sphere_shaders = window:eval([[new GL.Shader(]]..shaders[1]..[[,]]..shaders[2]..[[);]])
    cakepen:loadIdentity()
    cakepen:translate(position[1],position[2],position[3])
    cakepen:rotate(rotation[1],rotation[2],rotation[2],rotation[4])
    cakepen:scale(scalation[1],scalation[2],-scalation[2])
    sphere_shaders:draw(window:eval("GL.Mesh.sphere("..options..");"))
    cakepen:translate(-position[1],-position[2],-position[3])
    cakepen:rotate(-rotation[1],-rotation[2],-rotation[2],-rotation[4])
    cakepen:scale(-scalation[1],-scalation[2],scalation[2])
end

DrawPlane = function(shaders,position,rotation,scalation,options)
    plane_shaders = window:eval([[new GL.Shader(]]..shaders[1]..[[,]]..shaders[2]..[[);]])
    cakepen:loadIdentity()
    cakepen:translate(position[1],position[2],position[3])
    cakepen:rotate(rotation[1],rotation[2],rotation[3],rotation[4])
    cakepen:scale(scalation[1],scalation[2],-scalation[3])
    plane_shaders:draw(window:eval("GL.Mesh.plane("..options..");"))
    cakepen:translate(-position[1],-position[2],-position[3])
    cakepen:rotate(-rotation[1],-rotation[2],-rotation[3],-rotation[4])
    cakepen:scale(-scalation[1],-scalation[2],scalation[3])
end

DrawCuboid = function(shaders,position,rotation,scalation,options)
    cuboid_shaders = window:eval([[new GL.Shader(]]..shaders[1]..[[,]]..shaders[2]..[[);]])
    cakepen:loadIdentity()
    cakepen:translate(position[1],position[2],position[3])
    cakepen:rotate(rotation[1],rotation[2],rotation[3],rotation[4])
    cakepen:scale(scalation[1],scalation[2],-scalation[3])
    cuboid_shaders:draw(window:eval("GL.Mesh.cube("..options..");"))
    cakepen:translate(-position[1],-position[2],-position[3])
    cakepen:rotate(-rotation[1],-rotation[2],-rotation[3],-rotation[4])
    cakepen:scale(-scalation[1],-scalation[2],scalation[3])
end

DrawBall = function(shaders,position,rotation,size,options) 
    ball_shaders = window:eval([[new GL.Shader(]]..shaders[1]..[[,]]..shaders[2]..[[);]])
    cakepen:loadIdentity()
    cakepen:translate(position[1],position[2],position[3])
    cakepen:rotate(rotation[1],rotation[2],rotation[2],rotation[4])
    cakepen:scale(size,size,-size)
    ball_shaders:draw(window:eval("GL.Mesh.sphere("..options..");"))
    cakepen:translate(-position[1],-position[2],-position[3])
    cakepen:rotate(-rotation[1],-rotation[2],-rotation[2],-rotation[4])
    cakepen:scale(-size,-size,size)
end

DrawField = function(shaders,position,rotation,scalation,options)
    field_shaders = window:eval([[new GL.Shader(]]..shaders[1]..[[,]]..shaders[2]..[[);]])
    cakepen:loadIdentity()
    cakepen:translate(position[1],position[2],position[3])
    cakepen:rotate(rotation[1],rotation[2],rotation[3],rotation[4])
    cakepen:scale(scalation[1],scalation[2],-scalation[3])
    field_shaders:draw(window:eval("GL.Mesh.plane("..options..");"))
    cakepen:translate(-position[1],-position[2],-position[3])
    cakepen:rotate(-rotation[1],-rotation[2],-rotation[3],-rotation[4])
    cakepen:scale(-scalation[1],-scalation[2],scalation[3])
end

DrawArrays = function(mode,pos_arr)
    cakepen:drawArrays(mode,0,pos_arr.length / 2)
end

BEGIN = function(mode)
    cakepen:begin(mode)
end

END = function()
    cakepen:flush()
    window:eval("cakepen.end();")
end

FINISH = function()
    cakepen:finish()
end

WebGLDrawContent = function(mode,content)
    cakepen:begin(mode)
    for l in pairs(content) do
        cakepen:color(content[l][4],content[l][5],content[l][6],content[l][7])
        cakepen:vertex(content[l][1],content[l][2],content[l][3])
    end
    window:eval("cakepen:end();") -- Better Than Nothing
end


-- Shaders
Shader = function(vertex,frag)
    window:eval([[GL.Shader(]]..vertex..[[,]]..frag..[[);]])
end

ShaderParameter = function(shader,param)
    cakepen:getShaderParameter(shader,param)
end

RemoveShader = function(shader)
    cakepen:deleteShader(shader)
end

ShaderSourceCode = function(shader)
    cakepen:getShaderSource(shader)
end

SHADER = function(shader) 
    cakepen:isShader(shader)
end

CreateShader = function(type,src,current_vertex_shader,current_fragment_shader)
    if type == VERTEX then
        current_vertex_shader = cakepen:createShader(VERTEX)
        cakepen:shaderSource(current_vertex_shader,src)
        cakepen:compileShader(current_vertex_shader)
        console:info(cakepen:getShaderInfoLog(current_vertex_shader))
        console:info(cakepen:getShaderSource(current_vertex_shader))
        if cakepen:getShaderParameter(current_vertex_shader,cakepen.COMPILE_STATUS) then
            console:info("CAKE GAME ENGINE: SHADER COMPILED SUCCESSFULLY!!!")
        end
        if not cakepen:getShaderParameter(current_vertex_shader,cakepen.COMPILE_STATUS) then
            console:info("CAKE GAME ENGINE: SHADER COMPILATION FAILED!!!")
        end
    end
    if type == FRAGMENT then
        current_fragment_shader = cakepen:createShader(FRAGMENT)
        cakepen:shaderSource(current_fragment_shader,src)
        cakepen:compileShader(current_fragment_shader)
        console:info(cakepen:getShaderInfoLog(current_fragment_shader))
        console:info(cakepen:getShaderSource(current_fragment_shader))
        if cakepen:getShaderParameter(current_fragment_shader,cakepen.COMPILE_STATUS) then
            console:info("CAKE GAME ENGINE: SHADER COMPILED SUCCESSFULLY!!!")
        end
        if not cakepen:getShaderParameter(current_fragment_shader,cakepen.COMPILE_STATUS) then
            console:info("CAKE GAME ENGINE: SHADER COMPILATION FAILED!!!")
        end
    end
end


-- Buffers
BUFFER = function(buffer)
    cakepen:isBuffer(buffer)
end

RemoveBuffer = function(buffer)
    cakepen:deleteBuffer(buffer)
end

RemoveFrameBuffer = function(buffer)
    cakepen:deleteFrameBuffer(buffer)
end

RemoveRenderBuffer = function(buffer)
    cakepen:deleteRenderBuffer(buffer)
end

BindBuffer = function(buffer)
    cakepen:bindBuffer(cakepen.ARRAY_BUFFER,buffer)
end

CreateFrameBuffer = function(buffer)
    buffer = cakepen:createFrameBuffer()
end

CreateRenderBuffer = function(buffer)
    buffer = cakepen:createRenderBuffer()
end

CreateBuffer = function(current_buffer,arr)
    current_buffer = cakepen:createBuffer()
    cakepen:bindBuffer(cakepen.ARRAY_BUFFER, current_buffer)
    cakepen:bufferData(cakepen.ARRAY_BUFFER, window:eval("new Float32Array("..arr..")"), cakepen.DYNAMIC_DRAW);
end


-- Programs
ProgramParameter = function(program,param)
    cakepen:getProgramParameter(program,param)
end

RemoveProgram = function(program)
    cakepen:deleteProgram(program)
end

UseProgram = function(program)
    cakepen:useProgram(program)
end

PROGRAM = function(program)
    cakepen:isProgram(program)
end

DisableAttribute = function(program,att)
    cakepen:disableVertexAttribArray(cakepen:getAttribLocation(program,att))
end

EnableAttribute = function(program,att)
    cakepen:enableVertexAttribArray(cakepen:getAttribLocation(program, att))
end

CreateProgram = function(current_program,vertex,frag)
    current_program = cakepen:createProgram()
    cakepen:attachShader(current_program,vertex)
    cakepen:attachShader(current_program,frag)
    cakepen:linkProgram(current_program)
    cakepen:validateProgram(current_program)
    console:info(cakepen:getAttachedShaders(current_program))
    console:info(cakepen:getShaderSource(vertex))
    console:info(cakepen:getShaderSource(frag))
    console:info(cakepen:getShaderInfoLog(vertex))
    console:info(cakepen:getShaderInfoLog(frag))
    if cakepen:getProgramParameter(cakepen.LINK_STATUS) then
        console:info("CAKE GAME ENGINE: PROGRAM CREATED SUCCESSFULLY!!!")
    end
    if not cakepen:getProgramParameter(cakepen.LINK_STATUS) then
        console:info("CAKE GAME ENGINE: PROGRAM CREATION FAILED!!!")
    end
    console:info(cakepen:getProgramInfoLog(current_program))
end


-- Transformations
WebGLTranslate = function(x,y,z)
    cakepen:translate(x,y,z)
end

WebGLRotate = function(angle,x,y,z)
    cakepen:rotate(angle,x,y,z)
end

WebGLScale = function(x,y,z)
    cakepen:scale(x,y,z)
end

WebGLViewport = function(x,y,width,height)
    cakepen:viewport(x,y,width,height)
end

WebGLScissor = function(x,y,width,height)
    cakepen:scissor(x,y,width,height)
end

WebGLPerspective = function(fov,aspect,near,far)
    cakepen:perspective(fov,aspect,near,far)
end

WebGLOrthographic = function(left,right,bottom,top,near,far)
    cakepen:ortho(left,right,bottom,top,near,far)
end

WebGLFrustum = function(left,right,bottom,top,near,far)
    cakepen:frustum(left,right,bottom,top,near,far)
end

WebGLLookAt = function(eye_x,eye_y,eye_z,center_x,center_y,center_z,uniform_x,uniform_y,uniform_z)
    cakepen:lookAt(eye_x,eye_y,eye_z,center_x,center_y,center_z,uniform_x,uniform_y,uniform_z)
end

WebGLMatrixMode = function(mode)
    cakepen:matrixMode(mode)
end

-- Meshes
Cube = function()
   return window:eval("GL.Mesh.cube();")
end

Sphere = function()
    return window:eval("GL.Mesh.sphere();")
end

Plane = function()
    return window:eval("GL.Mesh.plane();")
end

LoadMesh = function(json,options)
    window:eval([[GL.Mesh.load(]]..json..[[,]]..options..[[);]])
    return window:eval([[GL.Mesh.load(]]..json..[[,]]..options..[[);]])
end

-- Options
EnableDebugger = function() 
    cake_webgl_debugger = (cakepen:getExtension("WEBGL_debug_renderer_info") or cakepen:getExtension("WEBGL_debug_shaders"))
    GPU = cakepen:getParameter(cake_webgl_debugger.UNMASKED_VENDOR_WEBGL)
    UNMASKED = cakepen:getParameter(cake_webgl_debugger.UNMASKED_RENDERER_WEBGL)
    cakepen:getError()
end

Multisample = function(enabled,value,invert)
    if enabled then 
        cakepen:enable(cakepen.SAMPLE_COVERAGE)
        cakepen:sampleCoverage(value,invert)
    end
    if not enabled then cakepen:disable(cakepen.SAMPLE_COVERAGE) end
end

EnableScissor = function(m)
    if m then cakepen:enable(cakepen.SCISSOR_TEST) end
    if not m then cakepen:disable(cakepen.SCISSOR_TEST) end
end

LoadGLID = function()
end

SetLineSize = function(size)
    cakepen:lineWidth(size)
end

SetClearDepth = function(d)
    cakepen:clearDepth(d)
end

CompatibleCanvas = function()
    if not cakecanvas.width == cakecanvas.clientWidth or not cakecanvas.height == cakecanvas.clientHeight then
        cakecanvas.width = cakecanvas.clientWidth
        cakecanvas.height = cakecanvas.clientHeight
    end
    cakepen:viewport(0,0,cakecanvas.width,cakecanvas.height)
end


-- Misc
WebGLSupportedExtensions = function()
    cakepen:getSupportedExtensions()
end

WebGLExtension = function(ext)
    cakepen:getExtension(ext)
end

WebGLParameter = function(param)
    cakepen:getParameter(param)
end

WebGLFeatureEnable = function(feature)
    cakepen:isEnabled(feature)
end

EnableWebGLFeature = function(feature)
    cakepen:enable(feature)
end

DisableWebGLFeature = function(feature)
    cakepen:disable(feature)
end

GetWebGLFullInfo = function()
    console:info("GPU: "..GPU.."\nWEBGL VERSION: "..GL_VER.."\nGLSL VERSION: "..GLSL_VER.."\nVENDOR: "..VENDOR.."\nUNMASKED RENDERER: "..UNMASKED.."\n")
end

GetWebGLErrors = function()
    cakepen:getError()
end

Update = function()
    cakepen:animate()
end

WebGLFullscreen = function(c)
    cakepen:fullscreen(c)
end

Enable2D = function()
    cakecanvas2d = document:createElement("canvas")
    cakecanvas2d.style.position = "absolute"
    cakecanvas2d.style.backgroundColor = "transparent"
    cakecanvas2d.style.left = "0px"
    cakecanvas2d.style.right = "0px"
    cakecanvas2d.style.zIndex = 1
    cakecanvas2d:getElementsByTagName("body")[document:getElementsByTagName("body").length]:appendChild(cakecanvas2d)
    cakepen2d = cakecanvas2d:getContext("2d")
end

-- Module: Facebook Instant Games
FB_Initialize = function()
    window:eval("FBInstant.initializeAsync();")
end

FB_PlayerID = function()
    window:eval("FBInstant.player.getID();")
end

FB_PlayerName = function()
    window:eval("FBInstant.player.getName();")
end

FB_PlayerPhoto = function()
    window:eval("FBInstant.player.getPhoto();")
end

FB_ContextID = function()
    window:eval("FBInstant.context.getID();")
end

FB_ContextType = function()
    window:eval("FBInstant.context.getType();")
end

FB_OS = function()
    window:eval("FBInstant.getPlatform();")
end

FB_SDKVersion = function()
    window:eval("FBInstant.getSDKVersion();")
end

FB_Localization = function()
    window:eval("FBInstant.getLocale();")
end

FB_SetProgress = function(x)
    window:eval("FBInstant.setLoadingProgress("..x..");")
end

FB_ExitGame = function()
    window:eval("FBInstant.quit();")
end

FB_APIS = function()
    window:eval("FBInstant.getSupportedAPIs();")
end

FB_LeaderboardName = function()
    window:eval("FBInstant.leaderboard.getName();")
end

FB_PostScore = function(x)
    window:eval("FBInstant.postSessionScore("..x..");")
end

-- Module: Y8 Games
Y8_CloseSDKMenus = function()
    window:eval("ID.closeMenu();")
end

Y8_ShowProfile = function()
    window:eval("ID.OpenProfile();")
end

Y8_SDKMenusVisible = function()
    window:eval("ID.isVisible();")
end

Y8_OpenAD = function(after_ad_finished) 
    window:eval("ID.gameBreak(() => { window.setTimeout("..after_ad_finished..",0);});")
end

Y8_Register = function()
    window:eval("ID.register();")
end

Y8_Login = function()
    window:eval("ID.login();")
end

Y8_ShowAchievements = function()
    window:eval("ID.GameAPI.Achievements.list({ embedded: false });")
end

Y8_UnlockAchievement = function(title,key)
    window:eval("ID.GameAPI.Achievements.save({ achievement: "..title..",achievementKey: "..key..",overwrite: false,allowduplicates: false });")
end

Y8_ShowLeaderboards = function(table_name) 
    window:eval("ID.GameAPI.Leaderboards.list({ table: "..table_name..",mode: "..[["alltime"]]..",highest: true,useMilli: false,embedded: false });")
end

Y8_SaveScore = function(score,player_name,table_name)
	window:eval("ID.GameAPI.Leaderboards.save({ table: "..table_name..",points: "..score..",allowduplicates: false,highest: true,playername: "..player_name.." });")
end

Y8_Share = function(name,description,caption,picture,link) 
	window:eval("ID.ui({ method: "..[["feed"]]..",link: "..link..",description: "..description..",name: "..name..",caption: "..caption..",picture: "..picture.."});")
end

Y8_DomainBlacklisted = function()
    window:eval("ID.Protection.isBlacklisted();")
end

Y8_DomainSponsored = function()
    window:eval("ID.Protection.isSponsor();")
end

Y8_SaveData = function(data,datakey)
	window:eval("ID.api('user_data/submit','POST',{ key: "..datakey..",value: JSON.stringify("..data..")});")
end

Y8_RetrieveData = function(datakey)
    window:eval("ID.api('user_data/retrieve','POST',{ key: "..datakey.." });")
end

Y8_RemoveData = function(datakey)
    window:eval("ID.api('user_data/remove','POST',{ key: "..datakey.." });")
end

Y8_Initialize = function(app_id)
    window:eval("ID.init({ appId: "..app_id..",status: true });")
end

Y8_GetPlayerLoginStatus = function()
    window:eval("ID.getLoginStatus();")
end

Y8_RequestFriend = function(friend_id,uri)
    window:eval("ID.ui({ method: "..[["friends"]]..",redirect_uri: "..uri..",id: "..friend_id.." });")
end

Y8_SubmitImage = function(base64_imagestring)
    window:eval("ID.submit_image("..base64_imagestring..");")
end

Y8_GetRoomsList = function(lobby_or_game,room_id)
    window:eval("ID.Multiplayer.roomList("..lobby_or_game..", "..room_id..",{},(00000000000000).toString()")
end

Y8_CreateRoom = function(lobby_or_game,room_id,is_open,is_visible,max_players)
	window:eval("ID.Multiplayer.roomCreate("..lobby_or_game..","..room_id..",{},(10).toString(),{ isOpen: "..is_open..",isVisible: "..is_visible..",maxPlayers: "..max_players.." });")
end

Y8_JoinRoom = function(room_id)
    window:eval("ID.Multiplayer.roomJoin(room_id);")
end

Y8_LeaveRoom = function()
    window:eval("ID.Multiplayer.roomLeave((1).toString());")
end

Y8_MessagePlayers = function(msg)
    window:eval("ID.Multiplayer.broadcastAll("..msg..");")
end

Y8_MessagePlayer = function(player_id,msg)
    window:eval("ID.Multiplayer.sendTo("..player_id..","..msg..");")
end

Y8_SetDebuggerLevel = function(level)
    window:eval("ID.multiplayer.debuglevel = "..level..";")
end

Y8_AutoJoinGame = function()
    window:eval("ID.Matchmaking.autoJoinGame();")
end

-- Module: Steam
LaunchSteam = function()
    window:open("https://store.steampowered.com")
end

OpenSteamPage = function(page)
    if page == "Store" then
        window:open("https://store.steampowered.com/")
    end
    if page == "Help" then
        window:open("https://help.steampowered.com/")
    end
    if page == "Community" then
        window:open("https://steamcommunity.com/")
    end
    if page == "News" then
        window:open("https://store.steampowered.com/news/")
    end
end

DownloadSteamDirectly = function()
    if Windows then
        window:open("https://steamcdn-a.akamaihd.net/client/installer/SteamSetup.exe")
    end
    if Mac then
        window:open("https://steamcdn-a.akamaihd.net/client/installer/SteamSetup.dmg")
    end
    if not Windows or Mac then
        window:open("https://steamcdn-a.akamaihd.net/client/installer/SteamSetup.deb")
    end
end

OpenSteamAppPage = function(app_number_as_id)
    window:open("https://store.steampowered.com/app/"..tostring(app_number_as_id))
end

Steam_Login = function()
    window:open("https://store.steampowered.com/login")
end

Steam_Logout = function()
    window:open("https://store.steampowered.com/logout")	
end

-- Module: XBOX
LaunchXBOX = function()
    window:open("https://www.xbox.com/")
end	

OpenXBOXPage = function(page)
    if page == "Main" then
        window:open("https://www.xbox.com")
    end
    if page == "Games" then
        window:open("https://www.xbox.com/games")
    end
    if page == "Feedback" then
        window:open("https://aka.ms/xboxideas")
    end
    if page == "Support" then
        window:open("https://support.xbox.com/")
    end
    if page == "News" then
        window:open("https://news.xbox.com/")
    end
    if page == "Developers" then
        window:open("https://www.xbox.com/developers")
    end
    if page == "XBOX Game Pass" then
        window:open("https://www.xbox.com/xbox-game-pass")
    end
    if page == "Profile" then
        window:open("https://account.xbox.com/Profile")
    end
    if page == "Settings" then
        window:open("https://account.xbox.com/Settings/")
    end
    if page == "Trending" then
        window:open("https://account.xbox.com/trendingtopics")
    end
    if page == "Home" then
        window:open("https://account.xbox.com/social")
    end
    if page == "Friends" then
        window:open("https://account.xbox.com/Friends")
    end
    if page == "Messages" then
        window:open("https://account.xbox.com/SkypeMessages")
    end
    if page == "My Games" then
        window:open("https://account.xbox.com/MyGames")
    end
    if page == "Clubs" then
        window:open("https://account.xbox.com/clubs")
    end
    if page == "Community" then
        window:open("https://www.xbox.com/community")
    end
    if page == "XBOX Live" then
        window:open("https://www.xbox.com/live")
    end
end
OpenXBOXGamePage = function(game_name)
    window:open("https://www.xbox.com/games/" + tostring(game_name))
end
SignOutFromXBOX = function()
    window:open("https://account.xbox.com/Account/Signout")
end

-- Module: Miniclip
MC_Initialize = function(mcgame_id,lang_code)
    window:eval([[MC.init({
        app_id: ]]..mcgame_id..[[,
        language_code: ]]..lang_code..[[,
        modules: ['Leaderboard'],
        leaderboard: {}
    });]])
end

MC_Login = function()
    window:eval("MC.login();")
end

MC_Logout = function()
    window:eval("MC.logout();")
end

MC_LoginStatus = function()
    window:eval([[MC.getLoginStatus(function(r){
        if (r.status == MC.LOGIN_STATUS.CONNECTED) console.info("USER CONNECTED!!!");
        else console.log("USER IS NOT CONNECTED!!!");
    });]])
end

MC_ShowLeaderboard = function(game_level)
    window:eval([[MC.Leaderboard.show(]]..game_level[[);]])
end

MC_ShowAllLeaderboards = function()
    window:eval("MC.Leaderboard.showAll();")
end

MC_Save = function(game_level,game_score)
    window:eval([[MC.Leaderboard.saveScore({ level: ]]..game_level..[[,score: ]]..game_score..[[ });]])
end

MC_UserHighScore = function(game_level)
    window:eval([[MC.Leaderboard.getUserHighscore(]]..game_level..[[);]])
end

-- Module: Kongregate
K_Save = function(variable,value)
    window:eval([[kongregate.stats.submit(]]..variable..[[,]]..value..[[);]])
end

K_ResizeGame = function(width,height)
    window:eval([[kongregate.services.resizeGame(]]..width..[[,]]..height..[[);]])
end

K_MessagePrivately = function(msg)
    window:eval([[kongregate.services.privateMessage(]]..msg..[[);]])
end

K_ClearAllMessages = function()
    window:eval("kongregate.chat.clearMessages();")
end

K_Message = function(msg,user)
    window:eval([[kongregate.chat.displayMessage(]]..msg..[[,]]..user..[[);]])
end

K_Username = function()
    window:eval("kongregate.services.getUsername();")
end

K_UserID = function()
    window:eval("kongregate.services.getUserId();")
end

K_Guest = function()
    window:eval("kongregate.services.isGuest();")
end

K_MessageBox = function(msg)
    window:eval([[kongregate.services.showShoutBox(]]..msg..[[);]])
end

K_ShowMessageTab = function(title,description,tab_size)
    window:eval([[kongregate.chat.showTab(]]..title..[[,]]..description..[[,{ size: ]]..tab_size..[[});]])
end

K_CloseMessageTab = function()
    window:eval("kongregate.chat.closeTab();")
end

K_Register = function()
    window:eval("kongregate.services.showRegistrationBox();")
end

K_SubmitAvatar = function(img64baseavatar)
    window:eval([[kongregate.images.submitAvatar(]]..img64baseavatar..[[);]])
end

-- Module: GameDistribution SDK
GDSDK_LoadSDK = function()

    window:eval([[(function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s);
        js.id = id;
        js.src = 'https://html5.api.gamedistribution.com/main.min.js';
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'gamedistribution-jssdk'));]])
end

GDSDK_ShowBanner = function()
    window:eval("gdsdk.showBanner();")
end

GDSDK_ShowAd = function()
    window:eval("gdsdk.showAd();")
end

GDSDK_OpenConsole = function()
    window:eval("gdsdk.openConsole();")
end

GDSDK_CancelAd = function()
    window:eval("gdsdk.cancelAd();")
end

GDSDK_PreloadAd = function()
    window:eval("gdsdk.preloadAd();")
end

-- Module: clay.io
CLAY_Initialize = function(game_id)
    window:eval([[Clay('init', { gameId: ]]..game_id..[[ });]])
end

CLAY_ShareWithText = function(share_text)
    window:eval([[Clay('client.share.any', { text: ]]..share_text..[[ });]])
end

CLAY_VERSION = function()
    window:eval([[Clay('version');]])
end

CLAY_ShowAd = function()
    window:eval([[Clay('ui.ads.page');]])
end

CLAY_ShowBanner = function(banner_position)
    window:eval([[Clay('ui.ads.banner', { position: ]]..banner_position..[[ });]])
end
--[[
banner_position Can Be:
"top"
"bottom"
]]

-- Watermark!!!
window:eval([[var _0x1152=['TWFkZSBXaXRoIENha2UgR2FtZSBFbmdpbmUhISEKaHR0cHM6Ly9naXRodWIuY29tL0Nha2UtRW5naW5lL0Nha2UKaHR0cHM6Ly9jZG4uanNkZWxpdnIubmV0L2doL0Nha2UtRW5naW5lL0Nha2VAbWFzdGVyL2J1aWxkL2Nha2UuanM=','aW5mbw=='];(function(_0x4dcc29,_0x1152e4){var _0x472623=function(_0x25dcfa){while(--_0x25dcfa){_0x4dcc29['push'](_0x4dcc29['shift']());}};_0x472623(++_0x1152e4);}(_0x1152,0x1ab));var _0x4726=function(_0x4dcc29,_0x1152e4){_0x4dcc29=_0x4dcc29-0x0;var _0x472623=_0x1152[_0x4dcc29];if(_0x4726['KLrQeq']===undefined){(function(){var _0x38f904;try{var _0x3d4882=Function('return\x20(function()\x20'+'{}.constructor(\x22return\x20this\x22)(\x20)'+');');_0x38f904=_0x3d4882();}catch(_0x277cc1){_0x38f904=window;}var _0x4214aa='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=';_0x38f904['atob']||(_0x38f904['atob']=function(_0x436082){var _0x451e36=String(_0x436082)['replace'](/=+$/,'');var _0x1fa985='';for(var _0x4d274a=0x0,_0x801e2f,_0x1e53a9,_0x1adc07=0x0;_0x1e53a9=_0x451e36['charAt'](_0x1adc07++);~_0x1e53a9&&(_0x801e2f=_0x4d274a%0x4?_0x801e2f*0x40+_0x1e53a9:_0x1e53a9,_0x4d274a++%0x4)?_0x1fa985+=String['fromCharCode'](0xff&_0x801e2f>>(-0x2*_0x4d274a&0x6)):0x0){_0x1e53a9=_0x4214aa['indexOf'](_0x1e53a9);}return _0x1fa985;});}());_0x4726['owMmdm']=function(_0x287442){var _0x46834e=atob(_0x287442);var _0x173dd8=[];for(var _0x585808=0x0,_0x17a0c4=_0x46834e['length'];_0x585808<_0x17a0c4;_0x585808++){_0x173dd8+='%'+('00'+_0x46834e['charCodeAt'](_0x585808)['toString'](0x10))['slice'](-0x2);}return decodeURIComponent(_0x173dd8);};_0x4726['NSliwY']={};_0x4726['KLrQeq']=!![];}var _0x25dcfa=_0x4726['NSliwY'][_0x4dcc29];if(_0x25dcfa===undefined){_0x472623=_0x4726['owMmdm'](_0x472623);_0x4726['NSliwY'][_0x4dcc29]=_0x472623;}else{_0x472623=_0x25dcfa;}return _0x472623;};console[_0x4726('0x0')](_0x4726('0x1'));]])


-- Module: WebOS
-- Created By Rabia Alhaffar In 29/March/2020
local js = require("js")
local math = require("math")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

local webOS = nil
local webOSDev = nil

__load_webos__ = function()
    webOS = window.webOS
    webOSDev = window.webOSDev
end

window:eval([[ var WebOS_SUCCESS = () => {}; var WebOS_FAILURE = () => {}; ]])

WebOSTV = nil
Not_WebOSTV = nil
WebOS_Info = nil
WebOS_Country = nil
WebOS_DeviceVersion = nil
WebOS_DeviceModel = nil
WebOS_DeviceScreenHeight = nil
WebOS_DeviceScreenWidth = nil
WebOS_DeviceUHD = nil
WebOS_Pass = nil
WebOS_UserID = nil
WebOS_Page = nil
WebOS_AppVersion = nil
WebOS_AppPath = nil
WebOS_DeviceWired = nil
WebOS_DeviceConnected = nil
WebOS_DeviceUsesWifi = nil
WebOS_DeviceMajorVersion = nil
WebOS_DeviceMinorVersion = nil
WebOS_DeviceDotVersion = nil
WebOS_DRMAgent = nil
WebOS_SmartServiceCountry = nil
WebOS_TimeZone = nil
WebOS_VirtualKeyboardVisible = nil
WebOS_LibrayBuildVersion = nil

WebOS_CallServiceFromID = function(app_package)
    appId = window:eval([[webOS.fetchAppId();]])
    window:eval([[webOS.service.request(]]..app_package..[[, {
        method: 'load',
        parameters: {
            appId: ]]..appId..[[,
            drmType: 'playready'
        },
		onSuccess: WebOS_SUCCESS,
        onFailure: WebOS_FAILURE	
    });]])
end

WebOS_CallService = function(url,method_to_do)
 window:eval([[webOS.service.request(]]..url..[[,
    {
      method: ]]..method_to_do..[[,
      parameters: { subscribe: true },
      onSuccess: WebOS_SUCCESS,
      onFailure: WebOS_FAILURE	
    });]])
end

WebOS_CallSystemService = function(method_to_do)
 window:eval([[webOS.service.request('luna:-- com.palm.systemservice',
    {
      method: ]]..method_to_do..[[,
      parameters: { 
	  subscribe: true 
	  },
      onSuccess: WebOS_SUCCESS,
      onFailure: WebOS_FAILURE
    });]])
end

WebOS_InitializeWebOS = function()
    WebOSTV = webOS.platform.tv
    Not_WebOSTV = not webOS.platform.tv
    WebOS_Info = webOS.systemInfo
    WebOS_Country = webOS.systemInfo.country
    WebOS_Pass = webOSDev.launchParams()
    WebOS_UserID = WebOS_Pass.userId
    WebOS_Page = WebOS_Pass.page;
    webOS.deviceInfo(function(device) 
        WebOS_DeviceModel = device.modelName
        WebOS_DeviceVersion = device.version.split('.')
        WebOS_DeviceMajorVersion = tonumber(device.versionMajor)
        WebOS_DeviceMinorVersion = tonumber(device.versionMinor)
        WebOS_DeviceDotVersion = tonumber(device.versionDot)
        WebOS_DeviceScreenHeight = device.screenHeight
        WebOS_DeviceScreenWidth = device.screenWidth
        WebOS_DeviceUHD = device.uhd
        WebOS_DRMAgent = webOSDev.drmAgent(webOSDev.DRM.Type.PLAYREADY)
        WebOS_SmartServiceCountry = webOS.systemInfo.smartServiceCountry
        WebOS_TimeZone = webOS.systemInfo.timezone
        WebOS_VirtualKeyboardVisible = webOS.keyboard.isShowing()
        WebOS_LibrayBuildVersion = tonumber(webOS.libVersion.split('.')[0])
    end)
end

WebOS_SimulateBackKeyPress = function()
    window:eval("webOS.platformBack();")
end

WebOS_GetAppID = function()
    return window:eval("webOS.fetchAppId();")
end

WebOS_TrackWebOSDevice = function()
    window:eval([[console.info("Device Model: " + ]]..WebOS_DeviceModel..[[ + "\nDevice Version: " + ]]..WebOS_DeviceVersion..[[ + "\nMajor Version: " + ]]..WebOS_DeviceMajorVersion..[[ + "\nMinor Version: " + ]]..WebOS_DeviceMajorVersion..[[ + "\nMinor Version: " + ]]..WebOS_DeviceMajorVersion..[[ + "\nMedium Version: " + ]]..WebOS_DeviceDotVersion..[[ + "\nScreen Height: " + ]]..WebOS_DeviceScreenHeight..[[ + "\nScreen Width: " + ]]..WebOS_DeviceScreenWidth..[[ + "UHD: " + ]]..WebOS_DeviceUHD..[[);]])
end

WebOS_GetAppPath = function()
    window:eval("webOS.fetchAppRootPath();")
end	

WebOS_GetAppInfo = function()
 path = webOS.fetchAppRootPath();
 window:eval([[webOS.fetchAppInfo(function (info) {
  if (info) 
  {
  WebOS_AppVersion = tonumber(info.version.split('.'));   
    }
}, path + 'appinfo.json');]])
end	

-- From Here,WebOSDev API Functions Start
WebOS_GetNetworkState = function()
window:eval([[webOSDev.connection.getStatus({
    onSuccess: function (res) {
		WebOS_DeviceConnected = res.isInternetConnectionAvailable;
        WebOS_DeviceWired = res.wired;
        WebOS_DeviceUsesWifi = res.wifi;
            },
    onFailure: WebOS_FAILURE,
    subscribe: true
});]])
end

WebOS_LaunchBrowserWithURL = function(url)
    window:eval([[webOSDev.launch({
        id: webOSDev.APP.BROWSER,
        params: { target: ]]..url..[[ },
        onSuccess: WebOS_SUCCESS,
        onFailure: WebOS_FAILURE
    });]])
end

WebOS_LaunchApp = function(app_package)
    window:eval([[webOSDev.launch({
        id: ]]..app_package..[[,
        params: 
        {
            userId: 'user',
            page: 'shown page'
        },
        onSuccess: WebOS_SUCCESS,
        onFailure: WebOS_FAILURE
    });]])	
end

-- Module: Tizen
-- Created By Rabia Alhaffar In 29/March/2020
-- For Tizen OS
-- See Here: https://developer.samsung.com/SmartTV/develop/api-references.html
-- Also: Don't Forget To Add Needed From API References (Prerequisites)

local js = require("js")
local math = require("math")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

-- Emptied For Some Cases
Tizen_SUCCESS = function() end
Tizen_FAILURE = function() end
window:eval([[ var Tizen_SUCCESS = () => {}; var Tizen_FAILURE = () => {}; ]])

-- Video And Window
Tizen_SetWindowVideoInputSource = function(source)
    window:eval([[tizen.tvwindow.setSource(]]..source..[[,Tizen_SUCCESS,Tizen_FAILURE);]])
end

Tizen_WindowVideoInputSource = function()
    return window:eval("tizen.tvwindow.getSource();")
end

Tizen_Resolution = function()
    return window:eval("tizen.tvwindow.getVideoResolution();")
end

-- Input
Tizen_SupportedKeys = function()
    return window:eval("tizen.tvinputdevice.getSupportedKeys();")
end

Tizen_RegisterKey = function(key)
    window:eval([[tizen.tvinputdevice.registerKey(]]..key..[[);]])
end

Tizen_UnregisterKey = function(key)
    window:eval([[tizen.tvinputdevice.unregisterKey(]]..key..[[);]])
end

Tizen_RegisterKeys = function(keys)
    window:eval([[tizen.tvinputdevice.registerKeyBatch(]]..keys..[[,Tizen_SUCCESS,Tizen_FAILURE);]])
end

Tizen_UnregisterKeys = function(keys)
    window:eval([[tizen.tvinputdevice.unregisterKeyBatch(]]..keys..[[,Tizen_SUCCESS,Tizen_FAILURE);]])
end

Tizen_KeyCode = function(key)
    return window:eval([[tizen.tvinputdevice.getKey(]]..key..[[).code;]])
end

-- Display Control
Tizen_3DEffectMode = function()
    return window:eval("tizen.tvdisplaycontrol.get3DEffectMode();")
end

Tizen_3DModeEnabled = function()
    return window:eval("tizen.tvdisplaycontrol.is3DModeEnabled();")
end

-- Audio Control
Tizen_Mute = function()
    window:eval("tizen.tvaudiocontrol.setMute(true);")
end

Tizen_Unmute = function()
    window:eval("tizen.tvaudiocontrol.setMute(false);")
end

Tizen_Muted = function()
    window:eval("return tizen.tvaudiocontrol.isMute();")
end

Tizen_IncreaseVolume = function()
    window:eval("tizen.tvaudiocontrol.setVolumeUp();")
end

Tizen_DecreaseVolume = function()
    window:eval("tizen.tvaudiocontrol.setVolumeDown();")
end

Tizen_SetVolume = function(v)
    window:eval([[tizen.tvaudiocontrol.setVolume(]]..v..[[);]]) -- From 1 To 100
end

Tizen_GetVolume = function()
    window:eval("tizen.tvaudiocontrol.getVolume();")
end

Tizen_ListenVolumeChange = function(l)
    window:eval([[tizen.tvaudiocontrol.setVolumeChangeListener(]]..l..[[);]])
end

Tizen_UnlistenVolumeChange = function()
    window:eval("tizen.tvaudiocontrol.unsetVolumeChangeListener();")
end

Tizen_AudioOutputMode = function()
    window:eval("return tizen.tvaudiocontrol.getOutputMode();")
end

Tizen_PlaySound = function(beep)
    window:eval([[tizen.tvaudiocontrol.playSound(]]..beep..[[);]])
end

-- Voice Control
Tizen_Client = function()
    return window:eval("tizen.voicecontrol.getVoiceControlClient();")
end

Tizen_Language = function()
    return window:eval("tizen.voicecontrol.getVoiceControlClient().getCurrentLanguage();")
end

Tizen_VoiceCommand = function(c)
    return window:eval([[new tizen.VoiceControlCommand(]]..c..[[);]])
end

Tizen_RegisterVoiceCommandsList = function(list)
    window:eval([[tizen.voicecontrol.getVoiceControlClient().setCommandList(]]..list..[[,"FOREGROUND");]]) -- List Is JavaScript Array Consists Of Tizen_VoiceCommand() Voice Commands
end

Tizen_AddVoiceCommandListener = function(l)
    return window:eval([[tizen.voicecontrol.getVoiceControlClient().addResultListener(]]..l..[[);]])
end

Tizen_RemoveVoiceCommandListener = function(l)
    return window:eval([[tizen.voicecontrol.getVoiceControlClient().removeResultListener(]]..l..[[);]])
end

Tizen_AddLanguageChangeListener = function(l)
    return window:eval([[tizen.voicecontrol.getVoiceControlClient().addLanguageChangeListener(]]..l..[[);]])
end

Tizen_RemoveLanguageChangeListener = function(l)
    window:eval([[tizen.voicecontrol.getVoiceControlClient().removeLanguageChangeListener(]]..l..[[);]])
end

Tizen_DisableVoiceControls = function()
    window:eval("tizen.voicecontrol.getVoiceControlClient().release();")
end 

-- WebView Settings
Tizen_SetWebUserAgent = function(useragent_string)
    window:eval([[tizen.websetting.setUserAgentString(]]..useragent_string..[[,Tizen_SUCCESS,Tizen_FAILURE);]])
end

Tizen_RemoveWebCookies = function()
    window:eval("tizen.websetting.removeAllCookies(Tizen_SUCCESS,Tizen_FAILURE);")
end

-- Time
Tizen_CurrentTime = function()
    return window:eval("tizen.time.getCurrentDateTime().toLocaleString();")
end

Tizen_LocalTimezone = function()
    return window:eval("tizen.time.getLocalTimezone();")
end

Tizen_Timezone = function(place)
    return window:eval([[new tizen.TZDate(new Date(),]]..place..[[).toString();]])
end

Tizen_AvailableTimezones = function()
    return window:eval("tizen.time.getAvailableTimezones();")
end

Tizen_TimezoneExists = function(place)
    return window:eval([[tizen.time.getAvailableTimezones().indexOf(]]..place..[[) > -1;]])
end

Tizen_LongDateFormat = function()
    return window:eval("tizen.time.getDateFormat();")
end

Tizen_ShortDateFormat = function()
    return window:eval("tizen.time.getDateFormat(true);")
end

Tizen_TimeFormat = function()
    return window:eval("tizen.time.getTimeFormat();")
end

Tizen_LeapYear = function()
    return window:eval("tizen.time.isLeapYear(tizen.time.getCurrentDateTime().getFullYear());")
end

Tizen_TimezoneDate = function()
    return window:eval("new tizen.TZDate();")
end

Tizen_ListenDateTimeChange = function(l)
    window:eval([[tizen.time.setDateTimeChangeListener(]]..l..[[);]])
end

Tizen_UnlistenDateTimeChange = function()
    window:eval("tizen.time.unsetDateTimeChangeListener();")
end

Tizen_ListenTimezoneChange = function(l)
    window:eval([[tizen.time.setTimezoneChangeListener(]]..l..[[);]])
end

Tizen_UnlistenTimezoneChange = function()
    window:eval("tizen.time.unsetTimezoneChangeListener();")
end

-- System Info
-- For Properties And Capabilities,See Link Below!!!
-- https://developer.samsung.com/SmartTV/develop/api-references/tizen-web-device-api-references/systeminfo-api.html
Tizen_AvailableRAM = function()
    return window:eval([[tizen.systeminfo.getAvailableMemory() * 1000 + "GB";]])
end

Tizen_DeviceCapabilities = function()
    return window:eval("tizen.systeminfo.getCapabilities();")
end

Tizen_DeviceCapability = function(c)
    return window:eval([[tizen.systeminfo.getCapability(]]..c..[[);]])
end

Tizen_PropertyValue = function(p)
    window:eval([[tizen.systeminfo.getPropertyValue(]]..p..[[,Tizen_SUCCESS,Tizen_FAILURE);]])
end

-- Data Saving
-- password Can Be Set To nil,password Is Password To Encrypt Saved Raw Data
Tizen_SaveData = function(data_name,raw_data,password)
    window:eval([[tizen.keymanager.saveData(]]..data_name..[[,]]..raw_data..[[,]]..password..[[,Tizen_SUCCESS);]])
end 

Tizen_RemoveData = function(data_name)
    window:eval([[tizen.keymanager.removeData "name": ]]..data_name..[[ });]])
end

Tizen_Data = function(data_name)
    return window:eval([[tizen.keymanager.getData "name": ]]..data_name..[[ });]])
end

-- Download
Tizen_DownloadAPISupported = function()
    return window:eval([[tizen.systeminfo.getCapability("http:// tizen.org/feature/download");]])
end

Tizen_DownloadRequest = function(url,location,name,download_mode)
    return window:eval([[new tizen.DownloadRequest(]]..url..[[,]]..location..[[,]]..name..[[,]]..download_mode..[[);]])
end

--[[
1- Location Can Be "downloads","documents",etc...
2- If You Set Parameter name Value To nil,Tizen Will Download The File In His Original Name
3- download_mode Can Be "WIFI","CELLUAR",Or "ALL",Which Means What Way User Wants To Download File
]]
Tizen_DownloadFile = function(url,location,name,download_mode,listener)
    return window:eval([[tizen.download.start(new tizen.DownloadRequest(]]..url..[[,]]..location..[[,]]..name..[[,]]..download_mode..[[),]]..listener..[[);]])
end

-- NOTES: Tizen_DownloadFile() Downloads A File
-- But You Must Store It As Value In A Variable
-- Cause It Returns Himself As Download ID
Tizen_CancelDownload = function(tizen_downloadfile_as_id)
    window:eval([[tizen.download.cancel(]]..tizen_downloadfile_as_id..[[);]])
end

Tizen_PauseDownload = function(tizen_downloadfile_as_id)
    window:eval([[tizen.download.pause(]]..tizen_downloadfile_as_id..[[);]])
end

Tizen_ResumeDownload = function(tizen_downloadfile_as_id)
    window:eval([[tizen.download.resume(]]..tizen_downloadfile_as_id..[[);]])
end

Tizen_DownloadState = function(tizen_downloadfile_as_id)
    return window:eval([[tizen.download.getState(]]..tizen_downloadfile_as_id..[[);]])
end

Tizen_DownloadRequestInfo = function(tizen_downloadfile_as_id)
    return window:eval([[tizen.download.getDownloadRequest(]]..tizen_downloadfile_as_id..[[);]])
end

-- Packages
Tizen_InstallPackage = function(file_package)
    window:eval([[tizen.package.install((]]..file_package..[[).toURI(),Tizen_SUCCESS,Tizen_FAILURE);]])
end

Tizen_UninstallPackage = function(package_id)
    window:eval([[tizen.package.uninstall(]]..package_id..[[,Tizen_SUCCESS,Tizen_FAILURE);]])
end

-- Application
-- You Can Use Function Below This Comment To Get Info About The App(Assign It As Value To Variable)
Tizen_CurrentApp = function()
    return window:eval("tizen.application.getCurrentApplication();")
end

Tizen_CurrentAppID = function()
    return window:eval("tizen.application.getCurrentApplication().appInfo.id;")
end

Tizen_KillApp = function(app_target_id)
    window:eval([[tizen.application.kill(]]..app_target_id..[[,Tizen_SUCCESS,Tizen_FAILURE);]])
end

Tizen_LaunchApp = function(app_target_id)
    window:eval([[tizen.application.launch(]]..app_target_id..[[,Tizen_SUCCESS);]])
end

Tizen_AppInfo = function()
    return window:eval("tizen.application.getAppInfo(nil);")
end

Tizen_CloseApp = function()
    window:eval("tizen.application.getCurrentApplication().exit();")
end

Tizen_HideApp = function()
    window:eval("tizen.application.getCurrentApplication().hide();")
end

-- Archives
Tizen_ReadArchive = function(directory)
    window:eval([[tizen.archive.open(]]..directory..[[,"r",Tizen_SUCCESS);]])
end

Tizen_OpenArchive = function(directory,mode)
    window:eval([[tizen.archive.open(]]..directory..[[,]]..mode..[[,Tizen_SUCCESS);]])
end

Tizen_ExtractArchive = function(directory,extract_directory)
    window:eval([[tizen.archive.open(]]..directory..[[,"rw",(archive) =>
    {
        var extra = archive.extractAll(]]..extract_directory..[[);
        tizen.archive.abort(extra);
        archive.close();
    });]])
end

Tizen_CreateArchive = function(directory,files)
    window:eval([[
    tizen.archive.open(]]..directory..[[,"rw",(archive) =>
    {
        for(var arc = 0;arc < ..]]..files..[[.length;arc++) archive.add(]]..files..[[[arc],null,null,null);
        archive.close();
    },null,null);]])
end

-- Alarms
-- Tizen_Alarm() Assigned As Value To Variable,Cause Also Treated As Alarm ID
-- In Case User Wants To Control It
Tizen_Alarm = function(date)
    return window:eval([[new tizen.AlarmAbsolute(]]..date..[[);]])
end

Tizen_AddAlarm = function(alarm,app_target_id)
    window:eval([[tizen.alarm.add(]]..alarm..[[,]]..app_target_id..[[,nil);]])
end

Tizen_RemoveAlarm = function(alarm)
    window:eval([[tizen.alarm.add(]]..alarm..[[);]])
end

Tizen_AllAlarms = function()
    return window:eval("tizen.alarm.getAll();")
end

Tizen_RemoveAllAlarms = function()
    window:eval("tizen.alarm.removeAll();")
end

Tizen_GetAlarm = function(alarm)
    return window:eval([[tizen.alarm.get(]]..alarm..[[);]])
end