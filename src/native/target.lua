-- Created By Rabia Alhaffar In 12/March/2020
-- NOTES: Here We Got Modifications
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON
iOS = navigator.userAgent:match("iPhone" or "iPad" or "iPod" or "Apple-iPhone")
Android = navigator.userAgent:match("Android")
Mac = navigator.userAgent:match("Macintosh" or "Intel Mac OS X")
Windows = navigator.userAgent:match("Windows" or "Windows Phone" or "Windows NT")
Windows_Phone = navigator.userAgent:match("Windows Phone")
Blackberry = navigator.userAgent:match("Blackberry" or "BB")
Linux = navigator.userAgent:match("Android" or "Linux" or "Ubuntu" or "X11")
Ubuntu = navigator.userAgent:match("Ubuntu" or "X11")
Chromecast = navigator.userAgent:match("CrKey")
Chrome_OS = navigator.userAgent:match("CrOS")
PS4 = navigator.userAgent:match("PlayStation 4")
Playstation = navigator.userAgent:match("PlayStation")
PSVita = navigator.userAgent:match("PlayStation Vita")
XB1 = navigator.userAgent:match("Xbox One")
XB1S = navigator.userAgent:match("XBOX_ONE_ED")
XBOX = navigator.userAgent:match("Xbox" or "XBOX_ONE_ED" or "Xbox One")
Nintendo = navigator.userAgent:match("Nintendo")
N_3DS = navigator.userAgent:match("Nintendo 3DS")
WiiU = navigator.userAgent:match("Nintendo WiiU")
FireTV = navigator.userAgent:match("AFTS")
Roku_Ultra = navigator.userAgent:match("Roku4640X")
Roku = navigator.userAgent:match("Roku")
Google_Nexus_Player = navigator.userAgent:match("Nexus Player")
Minix_NEO_X5 = navigator.userAgent:match("NEO-X5")
AppleTV = navigator.userAgent:match("AppleTV")
Kindle = navigator.userAgent:match("Kindle")
Google_Bot = navigator.userAgent:match("Googlebot")
ChromeDevice = navigator.userAgent:match("Cr")
Bing_Bot = navigator.userAgent:match("bingbot")
Yahoo_Bot = navigator.userAgent:match("Yahoo!")
OperaMini = navigator.userAgent:match("Opera Mini")
Desktop = navigator.userAgent:match("Windows" or "Windows Phone" or "Windows NT" or "Macintosh" or "Intel Mac OS X" or "Android" or "Linux" or "Ubuntu" or "X11" or "CrKey" or "CrOS")
Mobile = navigator.userAgent:match("Android" or "Linux" or "Ubuntu" or "iPhone" or "iPad" or "iPod" or "Apple-iPhone" or "Blackberry" or "BB" or "Windows Phone")
Console = navigator.userAgent:match("PlayStation" or "Nintendo" or "Xbox" or "XBOX")
TV = navigator.userAgent:match("AppleTV" or "CrKey" or "CrOS" or "Roku" or "AFTS" or "Nexus Player")
