Loop % MONITOR_COUNT{
    fnc = moveToMonitor%A_Index%
    moveMonitorHotkey = % moveMonitorHotkey%A_Index%

    if(moveMonitorHotkey != "false"){
        Hotkey, %moveMonitorHotkey% , moveMonitorFunction
    }
}