-- Created By Rabia Alhaffar In 16/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

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