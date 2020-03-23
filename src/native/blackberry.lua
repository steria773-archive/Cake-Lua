-- Created By Rabia Alhaffar In 19/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

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
