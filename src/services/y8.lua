-- Created By Rabia Alhaffar In 16/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

Y8_CloseSDKMenus = function()
    window:eval("ID.closeMenu();")
end

Y8_ShowProfile = function()
    window:eval("ID.OpenProfile();")
end

Y8_SDKMenusVisible = function()
    window:eval("ID.isVisible();")
end

Y8_OpenAD = function(after_ad_finished) 
    window:eval("ID.gameBreak(() => { window.setTimeout("..after_ad_finished..",0);});")
end

Y8_Register = function()
    window:eval("ID.register();")
end

Y8_Login = function()
    window:eval("ID.login();")
end

Y8_ShowAchievements = function()
    window:eval("ID.GameAPI.Achievements.list({ embedded: false });")
end

Y8_UnlockAchievement = function(title,key)
    window:eval("ID.GameAPI.Achievements.save({ achievement: "..title..",achievementKey: "..key..",overwrite: false,allowduplicates: false });")
end

Y8_ShowLeaderboards = function(table_name) 
    window:eval("ID.GameAPI.Leaderboards.list({ table: "..table_name..",mode: "..[["alltime"]]..",highest: true,useMilli: false,embedded: false });")
end

Y8_SaveScore = function(score,player_name,table_name)
	window:eval("ID.GameAPI.Leaderboards.save({ table: "..table_name..",points: "..score..",allowduplicates: false,highest: true,playername: "..player_name.." });")
end

Y8_Share = function(name,description,caption,picture,link) 
	window:eval("ID.ui({ method: "..[["feed"]]..",link: "..link..",description: "..description..",name: "..name..",caption: "..caption..",picture: "..picture.."});")
end

Y8_DomainBlacklisted = function()
    window:eval("ID.Protection.isBlacklisted();")
end

Y8_DomainSponsored = function()
    window:eval("ID.Protection.isSponsor();")
end

Y8_SaveData = function(data,datakey)
	window:eval("ID.api('user_data/submit','POST',{ key: "..datakey..",value: JSON.stringify("..data..")});")
end

Y8_RetrieveData = function(datakey)
    window:eval("ID.api('user_data/retrieve','POST',{ key: "..datakey.." });")
end

Y8_RemoveData = function(datakey)
    window:eval("ID.api('user_data/remove','POST',{ key: "..datakey.." });")
end

Y8_Initialize = function(app_id)
    window:eval("ID.init({ appId: "..app_id..",status: true });")
end

Y8_GetPlayerLoginStatus = function()
    window:eval("ID.getLoginStatus();")
end

Y8_RequestFriend = function(friend_id,uri)
    window:eval("ID.ui({ method: "..[["friends"]]..",redirect_uri: "..uri..",id: "..friend_id.." });")
end

Y8_SubmitImage = function(base64_imagestring)
    window:eval("ID.submit_image("..base64_imagestring..");")
end

Y8_GetRoomsList = function(lobby_or_game,room_id)
    window:eval("ID.Multiplayer.roomList("..lobby_or_game..", "..room_id..",{},(00000000000000).toString()")
end

Y8_CreateRoom = function(lobby_or_game,room_id,is_open,is_visible,max_players)
	window:eval("ID.Multiplayer.roomCreate("..lobby_or_game..","..room_id..",{},(10).toString(),{ isOpen: "..is_open..",isVisible: "..is_visible..",maxPlayers: "..max_players.." });")
end

Y8_JoinRoom = function(room_id)
    window:eval("ID.Multiplayer.roomJoin(room_id);")
end

Y8_LeaveRoom = function()
    window:eval("ID.Multiplayer.roomLeave((1).toString());")
end

Y8_MessagePlayers = function(msg)
    window:eval("ID.Multiplayer.broadcastAll("..msg..");")
end

Y8_MessagePlayer = function(player_id,msg)
    window:eval("ID.Multiplayer.sendTo("..player_id..","..msg..");")
end

Y8_SetDebuggerLevel = function(level)
    window:eval("ID.multiplayer.debuglevel = "..level..";")
end

Y8_AutoJoinGame = function()
    window:eval("ID.Matchmaking.autoJoinGame();")
end
