-- Created By Rabia Alhaffar In 13/March/2020
local js = require("js")
local math = require("math")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

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