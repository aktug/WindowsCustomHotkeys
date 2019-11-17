ini =  %A_ScriptDir%\config.ini

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                               CONFIGS 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

IniRead, winPositionFix, %ini%, CONFIGS, winPositionFix

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                               APPS 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

IniRead, CONFIGAPPS, %ini%, APPS, APPS
CONFIGAPPS := StrSplit(CONFIGAPPS, "|")	

Loop % CONFIGAPPS.Length(){
    appName = % CONFIGAPPS[A_Index]
    
    IniRead, _title, %ini%, % appName, title
    TITLE = % appName "_title"
    %TITLE% = % _title
    IniRead, _monitor, %ini%, % appName, monitor
    MONITOR = % appName "_monitor"
    %MONITOR% = % _monitor
    IniRead, _fullscreen, %ini%, % appName, fullscreen
    FULLSCREEN = % appName "_fullscreen"
    %FULLSCREEN% = % _fullscreen
    IniRead, _path, %ini%, % appName, path
    PATH = % appName "_path"
    _path := StrSplit(_path, "|")	
    %PATH% := % _path
    IniRead, _startup_x, %ini%, % appName, startup_x
    STARTUP_X = % appName "_startup_x"
    %STARTUP_X% = % _startup_x
    IniRead, _startup_y, %ini%, % appName, startup_y
    STARTUP_Y = % appName "_startup_y"
    %STARTUP_Y% = % _startup_y
    IniRead, _startup_w, %ini%, % appName, startup_w
    STARTUP_W = % appName "_startup_w"
    %STARTUP_W% = % _startup_w
    IniRead, _startup_h, %ini%, % appName, startup_h
    STARTUP_H = % appName "_startup_h"
    %STARTUP_H% = % _startup_h
    IniRead, _startup_minimize, %ini%, % appName, startup_minimize
    STARTUP_MINIMIZE = % appName "_startup_minimize"
    %STARTUP_MINIMIZE% = % _startup_minimize
    IniRead, _appHotkey, %ini%, % appName, hotkey
    APPHOTKEY = % appName "_appHotkey"
    %APPHOTKEY% = % _appHotkey
    
    checkHotkeysConfig(_appHotkey)
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                               MONITORSETUPS 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

IniRead, MONITORSETUPS, %ini%, MONITOR SETUPS, SETUPS
MONITORSETUPS := StrSplit(MONITORSETUPS, "|")	

Loop % MONITORSETUPS.Length(){
    monitorSetupName = % MONITORSETUPS[A_Index]
    
    IniRead, _setups, %ini%, %monitorSetupName% SETUP , APPS
    _setups := StrSplit(_setups, "|")	
    
    workspaceApps = % monitorSetupName "_apps"
    %workspaceApps% = % _setups
    
    IniRead, _setups, %ini%, %monitorSetupName% SETUP , hotkey
    _hotkey = % monitorSetupName "_hotkey"
    %_hotkey% = % _setups
    
    workspaceHotkey = % %_hotkey%
    checkHotkeysConfig(workspaceHotkey)
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                              EXTENSIONS 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Loop % EXTENSIONS.Length(){
    extensionName = % EXTENSIONS[A_Index]
    IniRead, extensionHotkey, %ini%, EXTENSIONS , %extensionName%
    %extensionName% = % extensionHotkey
    
    checkHotkeysConfig(extensionHotkey)
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                              MOVE WINDOW 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Loop % MONITOR_COUNT{
    IniRead, moveMonitorHotkey, %ini%, MOVE WINDOW , moveToMonitor%A_Index%
    moveMonitor = moveMonitorHotkey%A_Index%
    %moveMonitor% = % moveMonitorHotkey
}

