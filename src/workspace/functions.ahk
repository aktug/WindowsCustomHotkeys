monitorWorkspacesFunction(){
    Loop % MONITORSETUPS.Length(){
        monitorSetup = % MONITORSETUPS[A_Index]
        
        _monitorSetupHotkey = % monitorSetup "_hotkey"
        monitorSetupHotkey = % %_monitorSetupHotkey%
        
        if(monitorSetupHotkey = A_ThisHotkey){
            _monitorSetupApps = % monitorSetup "_apps"
            monitorSetupApps = % %_monitorSetupApps%
            
            monitorWorkspaces(monitorSetupApps,monitorSetup)
        }
    }
}

monitorWorkspaces(APPS,splashText){
    SplashTextOn, , , %splashText%
    Loop % APPS.Length(){
        app = % APPS[A_Index]
        _appTitle = % app "_title"
        appTitle = % %_appTitle%
        _appMonitor = % app "_monitor"
        appMonitor = % %_appMonitor%
        _appFullscreen = % app "_fullscreen"
        appFullscreen = % %_appFullscreen%
        _appRunParameters = % app "_path"
        appRunParameters = % %_appRunParameters%
        
        if WinExist(appTitle){    
            _winRestore(appTitle,appMonitor,appFullscreen)
            _winActivate(appTitle) 
        }else{
            var = % """" appRunParameters[1] """" A_Space """" appRunParameters[2] """" A_Space """" appRunParameters[3] """" 
            RunWait %var%
            WinWait %appTitle%, , 2
            
            _winRestore(appTitle,appMonitor,appFullscreen)
            _winActivate(appTitle)
            
        }
        
    }
    SplashTextOff
}

monitorWorkspacesTrayFunction(setupName){
    _splashText := % setupName
    _apps = %setupName%_apps
    APPS = % %_apps%
    monitorWorkspaces(APPS,_splashText)
}