-- Created By Rabia Alhaffar In 12/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

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
