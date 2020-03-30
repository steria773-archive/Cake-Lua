-- Created By Rabia Alhaffar In 29/March/2020
local js = require("js")
local math = require("math")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

local webOS = nil
local webOSDev = nil

__load_webos__ = function()
    webOS = window.webOS
    webOSDev = window.webOSDev
end

window:eval([[ var WebOS_SUCCESS = () => {}; var WebOS_FAILURE = () => {}; ]])

WebOSTV = nil
Not_WebOSTV = nil
WebOS_Info = nil
WebOS_Country = nil
WebOS_DeviceVersion = nil
WebOS_DeviceModel = nil
WebOS_DeviceScreenHeight = nil
WebOS_DeviceScreenWidth = nil
WebOS_DeviceUHD = nil
WebOS_Pass = nil
WebOS_UserID = nil
WebOS_Page = nil
WebOS_AppVersion = nil
WebOS_AppPath = nil
WebOS_DeviceWired = nil
WebOS_DeviceConnected = nil
WebOS_DeviceUsesWifi = nil
WebOS_DeviceMajorVersion = nil
WebOS_DeviceMinorVersion = nil
WebOS_DeviceDotVersion = nil
WebOS_DRMAgent = nil
WebOS_SmartServiceCountry = nil
WebOS_TimeZone = nil
WebOS_VirtualKeyboardVisible = nil
WebOS_LibrayBuildVersion = nil

WebOS_CallServiceFromID = function(app_package)
    appId = window:eval([[webOS.fetchAppId();]])
    window:eval([[webOS.service.request(]]..app_package..[[, {
        method: 'load',
        parameters: {
            appId: ]]..appId..[[,
            drmType: 'playready'
        },
		onSuccess: WebOS_SUCCESS,
        onFailure: WebOS_FAILURE	
    });]])
end

WebOS_CallService = function(url,method_to_do)
 window:eval([[webOS.service.request(]]..url..[[,
    {
      method: ]]..method_to_do..[[,
      parameters: { subscribe: true },
      onSuccess: WebOS_SUCCESS,
      onFailure: WebOS_FAILURE	
    });]])
end

WebOS_CallSystemService = function(method_to_do)
 window:eval([[webOS.service.request('luna:-- com.palm.systemservice',
    {
      method: ]]..method_to_do..[[,
      parameters: { 
	  subscribe: true 
	  },
      onSuccess: WebOS_SUCCESS,
      onFailure: WebOS_FAILURE
    });]])
end

WebOS_InitializeWebOS = function()
    WebOSTV = webOS.platform.tv
    Not_WebOSTV = not webOS.platform.tv
    WebOS_Info = webOS.systemInfo
    WebOS_Country = webOS.systemInfo.country
    WebOS_Pass = webOSDev.launchParams()
    WebOS_UserID = WebOS_Pass.userId
    WebOS_Page = WebOS_Pass.page;
    webOS.deviceInfo(function(device) 
        WebOS_DeviceModel = device.modelName
        WebOS_DeviceVersion = device.version.split('.')
        WebOS_DeviceMajorVersion = tonumber(device.versionMajor)
        WebOS_DeviceMinorVersion = tonumber(device.versionMinor)
        WebOS_DeviceDotVersion = tonumber(device.versionDot)
        WebOS_DeviceScreenHeight = device.screenHeight
        WebOS_DeviceScreenWidth = device.screenWidth
        WebOS_DeviceUHD = device.uhd
        WebOS_DRMAgent = webOSDev.drmAgent(webOSDev.DRM.Type.PLAYREADY)
        WebOS_SmartServiceCountry = webOS.systemInfo.smartServiceCountry
        WebOS_TimeZone = webOS.systemInfo.timezone
        WebOS_VirtualKeyboardVisible = webOS.keyboard.isShowing()
        WebOS_LibrayBuildVersion = tonumber(webOS.libVersion.split('.')[0])
    end)
end

WebOS_SimulateBackKeyPress = function()
    window:eval("webOS.platformBack();")
end

WebOS_GetAppID = function()
    return window:eval("webOS.fetchAppId();")
end

WebOS_TrackWebOSDevice = function()
    window:eval([[console.info("Device Model: " + ]]..WebOS_DeviceModel..[[ + "\nDevice Version: " + ]]..WebOS_DeviceVersion..[[ + "\nMajor Version: " + ]]..WebOS_DeviceMajorVersion..[[ + "\nMinor Version: " + ]]..WebOS_DeviceMajorVersion..[[ + "\nMinor Version: " + ]]..WebOS_DeviceMajorVersion..[[ + "\nMedium Version: " + ]]..WebOS_DeviceDotVersion..[[ + "\nScreen Height: " + ]]..WebOS_DeviceScreenHeight..[[ + "\nScreen Width: " + ]]..WebOS_DeviceScreenWidth..[[ + "UHD: " + ]]..WebOS_DeviceUHD..[[);]])
end

WebOS_GetAppPath = function()
    window:eval("webOS.fetchAppRootPath();")
end	

WebOS_GetAppInfo = function()
 path = webOS.fetchAppRootPath();
 window:eval([[webOS.fetchAppInfo(function (info) {
  if (info) 
  {
  WebOS_AppVersion = tonumber(info.version.split('.'));   
    }
}, path + 'appinfo.json');]])
end	

-- From Here,WebOSDev API Functions Start
WebOS_GetNetworkState = function()
window:eval([[webOSDev.connection.getStatus({
    onSuccess: function (res) {
		WebOS_DeviceConnected = res.isInternetConnectionAvailable;
        WebOS_DeviceWired = res.wired;
        WebOS_DeviceUsesWifi = res.wifi;
            },
    onFailure: WebOS_FAILURE,
    subscribe: true
});]])
end

WebOS_LaunchBrowserWithURL = function(url)
    window:eval([[webOSDev.launch({
        id: webOSDev.APP.BROWSER,
        params: { target: ]]..url..[[ },
        onSuccess: WebOS_SUCCESS,
        onFailure: WebOS_FAILURE
    });]])
end

WebOS_LaunchApp = function(app_package)
    window:eval([[webOSDev.launch({
        id: ]]..app_package..[[,
        params: 
        {
            userId: 'user',
            page: 'shown page'
        },
        onSuccess: WebOS_SUCCESS,
        onFailure: WebOS_FAILURE
    });]])	
end
