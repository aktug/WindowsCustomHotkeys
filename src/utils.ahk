detectWhichMonitor(x){
    x=% x - winPositionFix
    Loop % MONITOR_COUNT{
        _left = Mon%A_Index%Left
        left = % %_left%
        _right = Mon%A_Index%Right
        right = % %_right%
        if ( x >= left && x < right){
            Return %A_Index%
        }
    }
    Return 1
}

getDiff(x,monitor)
{
    _left = Mon%monitor%Left
    left = % %_left%
    Return % 0 - Abs(Abs(left) - Abs(x))
}

calculateNewX(diff,configMonitor)
{
    _left = Mon%configMonitor%Left
    left = % %_left%
    Return %  left + diff
    }

isFullscreen(appTitle){
    WinGet, isFullscreen, MinMax , %appTitle%
    if(isFullscreen==1){
        Return true
    }
    Return false
}

_winRestore(appTitle,appMonitor,appFullscreen){
    WinGetPos, x, y, width, height, %appTitle%
    
    whichMonitor = % detectWhichMonitor(x)
    diff = % getDiff(x, whichMonitor)
        isFullscreen = % isFullscreen(appTitle)
    
    WinMove, %appTitle%, , % calculateNewX(diff,appMonitor) , %y% ; Monitor Duzelmesi
    if(appFullscreen=1){
        WinMaximize 
    }
}

winStartupPositions(appTitle,appMonitor,appFullscreen,appX,appY,appW,appH){
    WinGetPos, x, y, w, h, %appTitle%
    
    whichMonitor = % detectWhichMonitor(x)
    diff = % getDiff(x, whichMonitor)
        isFullscreen = % isFullscreen(appTitle)
    
    
    if( appX == "false" ){
        appX = %x%
    }
    if( appY == "false" ){
        appY = %y%
    }
    if( appW == "false" ){
        appW = %w%
    }
    if( appH == "false" ){
        appH = %h%
    }
    
    if(appFullscreen == 1){
        WinMove, %appTitle%, , % calculateNewX(diff,appMonitor), %winPositionFix% , %appW%,%appH%
            WinMaximize 
    }else{
        SetTitleMatchMode,2
        WinMove, %appTitle%, , %appX% , %appY%, %appW%, %appH% 
    }
}

_winActivate(appTitle){
    WinActivate, %appTitle%
}

HasVal(haystack, needle) {
    if !(IsObject(haystack)) || (haystack.Length() = 0)
        return 0
    for index, value in haystack
        if (value = needle)
        return index
    return 0
}

checkHotkeysConfig(globalHotkey){
    if( globalHotkey != "false" && HasVal(HOTKEYS, globalHotkey) != 0 ){
        MsgBox, 48, Config Error, `[ %globalHotkey% `] Hotkey set multiple times, please change or disable.
        ExitApp
    }else{
        HOTKEYS.Push(globalHotkey)
    }
}

arrayToString(arr){
    Str := ""
    For Index, Value In arr
        Str .= "|" . Value
    Str := LTrim(Str, "|")
    return %Str%
}