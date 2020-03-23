-- Created By Rabia Alhaffar In 19/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

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
