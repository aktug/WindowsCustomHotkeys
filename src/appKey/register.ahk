Loop % CONFIGAPPS.Length(){
    app = % CONFIGAPPS[A_Index]
    
    _appHotkey = % app "_appHotkey"
    appHotkey = % %_appHotkey%
    
    if(%appHotkey% != false){
        Hotkey, %appHotkey% , appKeyFunction
    }
}