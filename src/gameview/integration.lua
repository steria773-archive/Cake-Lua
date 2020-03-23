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
        cakecanvas = canvasElement
        cakepen = layer.ctx
    end

    if engine == "booty" then
        b5.Display.canvas = cakecanvas
        b5.Display.context = cakepen
        cake = b5
    end

    if engine == "cartridge" then
        canvas = cakecanvas
        ctx = cakepen
    end

    if engine == "easel" then
        canvas = cakecanvas
        Graphics._ctx = cakepen
    end

    if engine == "pixi" then
        PIXI.Graphics = cakepen
        cake = PIXI
    end

    if engine == "iio" then
        iio = cake
    end

    if engine == "quark" then
        cake = Quark
        Quark._helpContext.canvas = cakecanvas
        Quark._helpContext.context = cakepen
    end

    if engine == "quintus" then
        cake = Q
        Q.ctx.canvas = cakecanvas
        Q.ctx = cakepen
    end

    if engine == "simplegameengine" then
        cakecanvas = _tempCanvas2D.canvas
        cakepen = _tempCanvas2D
    end

    if engine == "oversimplified" then
        cake = Oversimplified
        Oversimplified.canvas = cakecanvas
        Oversimplified.context = cakepen
    end

    if engine == "joy" then
        cake = Joy
        Joy.currentEngine.context.canvas = cakecanvas
        Joy.currentEngine.context.ctx = cakepen
    end

    if engine == "gamvas" then 
        cake = gamvas
        gamvas._canvas = cakecanvas
        gamvas._context2D = cakepen
    end

    if engine == "nini" then
        Graphics.canvas = cakecanvas
        cakepen = Graphics.canvas:getContext("2d")
    end

    if engine == "squarepig" then
        pig.canvas = cakecanvas
        pig.context = cakepen
        cake = pig
    end

    if engine == "threejs" then
        THREE = cake
    end

    if engine == "hilo" then
        cake = Hilo
    end

    if engine == "hilo3d" then
        cake = Hilo3d
    end

    if engine == "stage" then
        cake = Stage
        ctx = cakepen
        stage = cakecanvas
    end

    if engine == "arcadejs" then
        cake = ArcadeJS
        ArcadeJS._firstGame.canvas = cakecanvas
        ArcadeJS._firstGame.context = cakepen
    end

end
