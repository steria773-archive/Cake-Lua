-- Created By Rabia Alhaffar In 29/March/2020
-- For Tizen OS
-- See Here: https://developer.samsung.com/SmartTV/develop/api-references.html
-- Also: Don't Forget To Add Needed From API References (Prerequisites)

local js = require("js")
local math = require("math")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

-- Emptied For Some Cases
Tizen_SUCCESS = function() end
Tizen_FAILURE = function() end
window:eval([[ var Tizen_SUCCESS = () => {}; var Tizen_FAILURE = () => {}; ]])

-- Video And Window
Tizen_SetWindowVideoInputSource = function(source)
    window:eval([[tizen.tvwindow.setSource(]]..source..[[,Tizen_SUCCESS,Tizen_FAILURE);]])
end

Tizen_WindowVideoInputSource = function()
    return window:eval("tizen.tvwindow.getSource();")
end

Tizen_Resolution = function()
    return window:eval("tizen.tvwindow.getVideoResolution();")
end

-- Input
Tizen_SupportedKeys = function()
    return window:eval("tizen.tvinputdevice.getSupportedKeys();")
end

Tizen_RegisterKey = function(key)
    window:eval([[tizen.tvinputdevice.registerKey(]]..key..[[);]])
end

Tizen_UnregisterKey = function(key)
    window:eval([[tizen.tvinputdevice.unregisterKey(]]..key..[[);]])
end

Tizen_RegisterKeys = function(keys)
    window:eval([[tizen.tvinputdevice.registerKeyBatch(]]..keys..[[,Tizen_SUCCESS,Tizen_FAILURE);]])
end

Tizen_UnregisterKeys = function(keys)
    window:eval([[tizen.tvinputdevice.unregisterKeyBatch(]]..keys..[[,Tizen_SUCCESS,Tizen_FAILURE);]])
end

Tizen_KeyCode = function(key)
    return window:eval([[tizen.tvinputdevice.getKey(]]..key..[[).code;]])
end

-- Display Control
Tizen_3DEffectMode = function()
    return window:eval("tizen.tvdisplaycontrol.get3DEffectMode();")
end

Tizen_3DModeEnabled = function()
    return window:eval("tizen.tvdisplaycontrol.is3DModeEnabled();")
end

-- Audio Control
Tizen_Mute = function()
    window:eval("tizen.tvaudiocontrol.setMute(true);")
end

Tizen_Unmute = function()
    window:eval("tizen.tvaudiocontrol.setMute(false);")
end

Tizen_Muted = function()
    window:eval("return tizen.tvaudiocontrol.isMute();")
end

Tizen_IncreaseVolume = function()
    window:eval("tizen.tvaudiocontrol.setVolumeUp();")
end

Tizen_DecreaseVolume = function()
    window:eval("tizen.tvaudiocontrol.setVolumeDown();")
end

Tizen_SetVolume = function(v)
    window:eval([[tizen.tvaudiocontrol.setVolume(]]..v..[[);]]) -- From 1 To 100
end

Tizen_GetVolume = function()
    window:eval("tizen.tvaudiocontrol.getVolume();")
end

Tizen_ListenVolumeChange = function(l)
    window:eval([[tizen.tvaudiocontrol.setVolumeChangeListener(]]..l..[[);]])
end

Tizen_UnlistenVolumeChange = function()
    window:eval("tizen.tvaudiocontrol.unsetVolumeChangeListener();")
end

Tizen_AudioOutputMode = function()
    window:eval("return tizen.tvaudiocontrol.getOutputMode();")
end

Tizen_PlaySound = function(beep)
    window:eval([[tizen.tvaudiocontrol.playSound(]]..beep..[[);]])
end

-- Voice Control
Tizen_Client = function()
    return window:eval("tizen.voicecontrol.getVoiceControlClient();")
end

Tizen_Language = function()
    return window:eval("tizen.voicecontrol.getVoiceControlClient().getCurrentLanguage();")
end

Tizen_VoiceCommand = function(c)
    return window:eval([[new tizen.VoiceControlCommand(]]..c..[[);]])
end

Tizen_RegisterVoiceCommandsList = function(list)
    window:eval([[tizen.voicecontrol.getVoiceControlClient().setCommandList(]]..list..[[,"FOREGROUND");]]) -- List Is JavaScript Array Consists Of Tizen_VoiceCommand() Voice Commands
end

Tizen_AddVoiceCommandListener = function(l)
    return window:eval([[tizen.voicecontrol.getVoiceControlClient().addResultListener(]]..l..[[);]])
end

Tizen_RemoveVoiceCommandListener = function(l)
    return window:eval([[tizen.voicecontrol.getVoiceControlClient().removeResultListener(]]..l..[[);]])
end

Tizen_AddLanguageChangeListener = function(l)
    return window:eval([[tizen.voicecontrol.getVoiceControlClient().addLanguageChangeListener(]]..l..[[);]])
end

Tizen_RemoveLanguageChangeListener = function(l)
    window:eval([[tizen.voicecontrol.getVoiceControlClient().removeLanguageChangeListener(]]..l..[[);]])
end

Tizen_DisableVoiceControls = function()
    window:eval("tizen.voicecontrol.getVoiceControlClient().release();")
end 

-- WebView Settings
Tizen_SetWebUserAgent = function(useragent_string)
    window:eval([[tizen.websetting.setUserAgentString(]]..useragent_string..[[,Tizen_SUCCESS,Tizen_FAILURE);]])
end

Tizen_RemoveWebCookies = function()
    window:eval("tizen.websetting.removeAllCookies(Tizen_SUCCESS,Tizen_FAILURE);")
end

-- Time
Tizen_CurrentTime = function()
    return window:eval("tizen.time.getCurrentDateTime().toLocaleString();")
end

Tizen_LocalTimezone = function()
    return window:eval("tizen.time.getLocalTimezone();")
end

Tizen_Timezone = function(place)
    return window:eval([[new tizen.TZDate(new Date(),]]..place..[[).toString();]])
end

Tizen_AvailableTimezones = function()
    return window:eval("tizen.time.getAvailableTimezones();")
end

Tizen_TimezoneExists = function(place)
    return window:eval([[tizen.time.getAvailableTimezones().indexOf(]]..place..[[) > -1;]])
end

Tizen_LongDateFormat = function()
    return window:eval("tizen.time.getDateFormat();")
end

Tizen_ShortDateFormat = function()
    return window:eval("tizen.time.getDateFormat(true);")
end

Tizen_TimeFormat = function()
    return window:eval("tizen.time.getTimeFormat();")
end

Tizen_LeapYear = function()
    return window:eval("tizen.time.isLeapYear(tizen.time.getCurrentDateTime().getFullYear());")
end

Tizen_TimezoneDate = function()
    return window:eval("new tizen.TZDate();")
end

Tizen_ListenDateTimeChange = function(l)
    window:eval([[tizen.time.setDateTimeChangeListener(]]..l..[[);]])
end

Tizen_UnlistenDateTimeChange = function()
    window:eval("tizen.time.unsetDateTimeChangeListener();")
end

Tizen_ListenTimezoneChange = function(l)
    window:eval([[tizen.time.setTimezoneChangeListener(]]..l..[[);]])
end

Tizen_UnlistenTimezoneChange = function()
    window:eval("tizen.time.unsetTimezoneChangeListener();")
end

-- System Info
-- For Properties And Capabilities,See Link Below!!!
-- https://developer.samsung.com/SmartTV/develop/api-references/tizen-web-device-api-references/systeminfo-api.html
Tizen_AvailableRAM = function()
    return window:eval([[tizen.systeminfo.getAvailableMemory() * 1000 + "GB";]])
end

Tizen_DeviceCapabilities = function()
    return window:eval("tizen.systeminfo.getCapabilities();")
end

Tizen_DeviceCapability = function(c)
    return window:eval([[tizen.systeminfo.getCapability(]]..c..[[);]])
end

Tizen_PropertyValue = function(p)
    window:eval([[tizen.systeminfo.getPropertyValue(]]..p..[[,Tizen_SUCCESS,Tizen_FAILURE);]])
end

-- Data Saving
-- password Can Be Set To nil,password Is Password To Encrypt Saved Raw Data
Tizen_SaveData = function(data_name,raw_data,password)
    window:eval([[tizen.keymanager.saveData(]]..data_name..[[,]]..raw_data..[[,]]..password..[[,Tizen_SUCCESS);]])
end 

Tizen_RemoveData = function(data_name)
    window:eval([[tizen.keymanager.removeData "name": ]]..data_name..[[ });]])
end

Tizen_Data = function(data_name)
    return window:eval([[tizen.keymanager.getData "name": ]]..data_name..[[ });]])
end

-- Download
Tizen_DownloadAPISupported = function()
    return window:eval([[tizen.systeminfo.getCapability("http:// tizen.org/feature/download");]])
end

Tizen_DownloadRequest = function(url,location,name,download_mode)
    return window:eval([[new tizen.DownloadRequest(]]..url..[[,]]..location..[[,]]..name..[[,]]..download_mode..[[);]])
end

--[[
1- Location Can Be "downloads","documents",etc...
2- If You Set Parameter name Value To nil,Tizen Will Download The File In His Original Name
3- download_mode Can Be "WIFI","CELLUAR",Or "ALL",Which Means What Way User Wants To Download File
]]
Tizen_DownloadFile = function(url,location,name,download_mode,listener)
    return window:eval([[tizen.download.start(new tizen.DownloadRequest(]]..url..[[,]]..location..[[,]]..name..[[,]]..download_mode..[[),]]..listener..[[);]])
end

-- NOTES: Tizen_DownloadFile() Downloads A File
-- But You Must Store It As Value In A Variable
-- Cause It Returns Himself As Download ID
Tizen_CancelDownload = function(tizen_downloadfile_as_id)
    window:eval([[tizen.download.cancel(]]..tizen_downloadfile_as_id..[[);]])
end

Tizen_PauseDownload = function(tizen_downloadfile_as_id)
    window:eval([[tizen.download.pause(]]..tizen_downloadfile_as_id..[[);]])
end

Tizen_ResumeDownload = function(tizen_downloadfile_as_id)
    window:eval([[tizen.download.resume(]]..tizen_downloadfile_as_id..[[);]])
end

Tizen_DownloadState = function(tizen_downloadfile_as_id)
    return window:eval([[tizen.download.getState(]]..tizen_downloadfile_as_id..[[);]])
end

Tizen_DownloadRequestInfo = function(tizen_downloadfile_as_id)
    return window:eval([[tizen.download.getDownloadRequest(]]..tizen_downloadfile_as_id..[[);]])
end

-- Packages
Tizen_InstallPackage = function(file_package)
    window:eval([[tizen.package.install((]]..file_package..[[).toURI(),Tizen_SUCCESS,Tizen_FAILURE);]])
end

Tizen_UninstallPackage = function(package_id)
    window:eval([[tizen.package.uninstall(]]..package_id..[[,Tizen_SUCCESS,Tizen_FAILURE);]])
end

-- Application
-- You Can Use Function Below This Comment To Get Info About The App(Assign It As Value To Variable)
Tizen_CurrentApp = function()
    return window:eval("tizen.application.getCurrentApplication();")
end

Tizen_CurrentAppID = function()
    return window:eval("tizen.application.getCurrentApplication().appInfo.id;")
end

Tizen_KillApp = function(app_target_id)
    window:eval([[tizen.application.kill(]]..app_target_id..[[,Tizen_SUCCESS,Tizen_FAILURE);]])
end

Tizen_LaunchApp = function(app_target_id)
    window:eval([[tizen.application.launch(]]..app_target_id..[[,Tizen_SUCCESS);]])
end

Tizen_AppInfo = function()
    return window:eval("tizen.application.getAppInfo(nil);")
end

Tizen_CloseApp = function()
    window:eval("tizen.application.getCurrentApplication().exit();")
end

Tizen_HideApp = function()
    window:eval("tizen.application.getCurrentApplication().hide();")
end

-- Archives
Tizen_ReadArchive = function(directory)
    window:eval([[tizen.archive.open(]]..directory..[[,"r",Tizen_SUCCESS);]])
end

Tizen_OpenArchive = function(directory,mode)
    window:eval([[tizen.archive.open(]]..directory..[[,]]..mode..[[,Tizen_SUCCESS);]])
end

Tizen_ExtractArchive = function(directory,extract_directory)
    window:eval([[tizen.archive.open(]]..directory..[[,"rw",(archive) =>
    {
        var extra = archive.extractAll(]]..extract_directory..[[);
        tizen.archive.abort(extra);
        archive.close();
    });]])
end

Tizen_CreateArchive = function(directory,files)
    window:eval([[
    tizen.archive.open(]]..directory..[[,"rw",(archive) =>
    {
        for(var arc = 0;arc < ..]]..files..[[.length;arc++) archive.add(]]..files..[[[arc],null,null,null);
        archive.close();
    },null,null);]])
end

-- Alarms
-- Tizen_Alarm() Assigned As Value To Variable,Cause Also Treated As Alarm ID
-- In Case User Wants To Control It
Tizen_Alarm = function(date)
    return window:eval([[new tizen.AlarmAbsolute(]]..date..[[);]])
end

Tizen_AddAlarm = function(alarm,app_target_id)
    window:eval([[tizen.alarm.add(]]..alarm..[[,]]..app_target_id..[[,nil);]])
end

Tizen_RemoveAlarm = function(alarm)
    window:eval([[tizen.alarm.add(]]..alarm..[[);]])
end

Tizen_AllAlarms = function()
    return window:eval("tizen.alarm.getAll();")
end

Tizen_RemoveAllAlarms = function()
    window:eval("tizen.alarm.removeAll();")
end

Tizen_GetAlarm = function(alarm)
    return window:eval([[tizen.alarm.get(]]..alarm..[[);]])
end