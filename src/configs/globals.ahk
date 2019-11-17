global winPositionFix := 0

global CONFIGAPPS
global EXTENSIONS
global MONITORSETUPS

SysGet, MONITOR_COUNT, MonitorCount
global MONITOR_COUNT := MONITOR_COUNT

global Mon1Left,Mon1Right
global Mon2Left,Mon2Right
global Mon3Left,Mon3Right
global Mon4Left,Mon4Right
global Mon5Left,Mon5Right
global Mon6Left,Mon6Right
global Mon7Left,Mon7Right
global Mon8Left,Mon8Right
global Mon9Left,Mon9Right
global Mon10Left,Mon10Right

Loop % MONITOR_COUNT{
    SysGet, Mon%A_Index%, Monitor, %A_Index%
    tmp = Mon%A_Index%Left
    %tmp% := % Mon%A_Index%Left
    tmp = Mon%A_Index%Right
    %tmp% := % Mon%A_Index%Right
}

global EXTENSIONS := ["mediaPause","mediaPrev","mediaNext","clearWinNotificationsHotkey"]

global HOTKEYS := []