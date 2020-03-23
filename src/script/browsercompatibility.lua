-- Created By Rabia Alhaffar In 10/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

window.requestAnimationFrame = window.requestAnimationFrame or window.mozRequestAnimationFrame or window.msRequestAnimationFrame or window.oRequestAnimationFrame or window.webkitRequestAnimationFrame
window.cancelAnimationFrame = window.cancelAnimationFrame or window.mozCancelAnimationFrame or window.webkitCancelAnimationFrame
document.documentElement.requestFullscreen = document.documentElement.requestFullscreen or document.documentElement.mozRequestFullScreen or document.documentElement.msRequestFullscreen or document.documentElement.webkitRequestFullscreen
document.exitFullscreen = document.exitFullscreen or document.mozCancelFullScreen or document.msExitFullscreen or document.webkitExitFullscreen
document.requestPointerLock = document.requestPointerLock or document.mozRequestPointerLock or document.webkitRequestPointerLock
document.exitPointerLock = document.exitPointerLock or document.mozExitPointerLock or document.webkitExitPointerLock
