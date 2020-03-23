-- Created By Rabia Alhaffar In 7/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
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