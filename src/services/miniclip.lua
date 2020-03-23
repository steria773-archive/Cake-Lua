-- Created By Rabia Alhaffar In 19/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

MC_Initialize = function(mcgame_id,lang_code)
    window:eval([[MC.init({
        app_id: ]]..mcgame_id..[[,
        language_code: ]]..lang_code..[[,
        modules: ['Leaderboard'],
        leaderboard: {}
    });]])
end

MC_Login = function()
    window:eval("MC.login();")
end

MC_Logout = function()
    window:eval("MC.logout();")
end

MC_LoginStatus = function()
    window:eval([[MC.getLoginStatus(function(r){
        if (r.status == MC.LOGIN_STATUS.CONNECTED) console.info("USER CONNECTED!!!");
        else console.log("USER IS NOT CONNECTED!!!");
    });]])
end

MC_ShowLeaderboard = function(game_level)
    window:eval([[MC.Leaderboard.show(]]..game_level[[);]])
end

MC_ShowAllLeaderboards = function()
    window:eval("MC.Leaderboard.showAll();")
end

MC_Save = function(game_level,game_score)
    window:eval([[MC.Leaderboard.saveScore({ level: ]]..game_level..[[,score: ]]..game_score..[[ });]])
end

MC_UserHighScore = function(game_level)
    window:eval([[MC.Leaderboard.getUserHighscore(]]..game_level..[[);]])
end
