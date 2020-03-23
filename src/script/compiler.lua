-- Created By Rabia Alhaffar In 12/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

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
