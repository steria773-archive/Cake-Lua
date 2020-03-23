-- Created By Rabia Alhaffar In 19/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

GDSDK_LoadSDK = function()

    window:eval([[(function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s);
        js.id = id;
        js.src = 'https://html5.api.gamedistribution.com/main.min.js';
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'gamedistribution-jssdk'));]])
end

GDSDK_ShowBanner = function()
    window:eval("gdsdk.showBanner();")
end

GDSDK_ShowAd = function()
    window:eval("gdsdk.showAd();")
end

GDSDK_OpenConsole = function()
    window:eval("gdsdk.openConsole();")
end

GDSDK_CancelAd = function()
    window:eval("gdsdk.cancelAd();")
end

GDSDK_PreloadAd = function()
    window:eval("gdsdk.preloadAd();")
end