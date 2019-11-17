text = Monitor Setups :`n
Loop % MONITORSETUPS.Length(){
    name = % MONITORSETUPS[A_Index]
    
    _hotkey = % name "_hotkey"
    globalHotkey = % %_hotkey%
    if(globalHotkey!="false"){
        globalHotkey = % hotkeyDecode(globalHotkey)
        
        text = % prepareTip(text, name,globalHotkey)
    }
}

text = %text%`n`nExtensions :`n
Loop % EXTENSIONS.Length(){
    name = % EXTENSIONS[A_Index]
    globalHotkey = % %name%
    if(globalHotkey!="false"){
        globalHotkey = % hotkeyDecode(globalHotkey)
        text = % prepareTip(text, name,globalHotkey)
    }
}

text = %text%`n`nApps :`n
Loop % CONFIGAPPS.Length(){
    name = % CONFIGAPPS[A_Index]
    _hotkey = % name "_appHotkey"
    globalHotkey = % %_hotkey%
    
    if(globalHotkey!="false"){
        globalHotkey = % hotkeyDecode(globalHotkey)
        text = % prepareTip(text, name,globalHotkey)
    }
}

text = %text%`n`nMoveToMonitor :`n
Loop % MONITOR_COUNT{
    IniRead, moveMonitorHotkey, %ini%, MOVE WINDOW , moveToMonitor%A_Index%
    if(moveMonitorHotkey!="false"){
        name = MoveToMonitor%A_Index%
        globalHotkey = % hotkeyDecode(moveMonitorHotkey)
        text = % prepareTip(text, name, globalHotkey)
    }
}

hotkeyDecode(hotkeys){
    hotkeys = % StrReplace(hotkeys,"!","Alt+")
    hotkeys = % StrReplace(hotkeys,"^","Ctrl+")
    hotkeys = % StrReplace(hotkeys,"#","Win+")
    hotkeys = % StrReplace(hotkeys,"$","Shift+")
    hotkeys = [ %hotkeys% ]
    return hotkeys
}

prepareTip(txt, name,globalHotkey){
    txt = %txt%`n%globalHotkey% %A_Space% %name%
    return txt
}

MsgBox, % 64+262144, Windows Custom Hotkeys, %text% , 5

