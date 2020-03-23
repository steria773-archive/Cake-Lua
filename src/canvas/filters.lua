-- Created By Rabia Alhaffar In 13/March/2020
local js = require("js")
local math = require("math")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

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
