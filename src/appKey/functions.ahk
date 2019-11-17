appKeyFunction(){    
    Loop % CONFIGAPPS.Length(){
        app = % CONFIGAPPS[A_Index]
        
        _appHotkey = % app "_appHotkey"
        appHotkey = % %_appHotkey%
        
        if(appHotkey = A_ThisHotkey){
            appKey(app)
        }
    }
}

appKey(app){
    _appTitle = % app "_title"
    appTitle = % %_appTitle%
    _appMonitor = % app "_monitor"
    appMonitor = % %_appMonitor%
    _appFullscreen = % app "_fullscreen"
    appFullscreen = % %_appFullscreen%
    _appRunParameters = % app "_path"
    appRunParameters = % %_appRunParameters%
    
    if WinActive(appTitle){    
        WinMinimize %appTitle%
    } else if WinExist(appTitle){
        _winActivate(appTitle)
        _winRestore(appTitle,appMonitor,appFullscreen)
    }else{
        
        try{
            var = % """" appRunParameters[1] """" A_Space """" appRunParameters[2] """" A_Space """" appRunParameters[3] """" 
            RunWait %var%
        }catch e{
            MsgBox, 16,, % "Exception thrown!`n`nwhat: " e.what "`nfile: " e.file
            . "`nline: " e.line "`nmessage: " e.message "`nextra: " e.extra
            ExitApp
        }
        WinWait %appTitle%, , 2
        
        _appStartup_x = % app "_startup_x"
        appStartup_x = % %_appStartup_x%
        _appStartup_y = % app "_startup_y"
        appStartup_y = % %_appStartup_y%
        _appStartup_w = % app "_startup_w"
        appStartup_w = % %_appStartup_w%
        _appStartup_h = % app "_startup_h"
        appStartup_h = % %_appStartup_h%
        
        _winActivate(appTitle)
        winStartupPositions(appTitle,appMonitor,appFullscreen,appStartup_x,appStartup_y,appStartup_w,appStartup_h)
        
    }
}