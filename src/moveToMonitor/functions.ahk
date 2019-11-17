moveMonitorFunction(){    
    Loop % MONITOR_COUNT{
        moveMonitorHotkey = % moveMonitorHotkey%A_Index%
        if(moveMonitorHotkey = A_ThisHotkey){
            moveMonitor(A_Index)
        }
    }
}
    
moveMonitor(monitor){
    WinGetTitle, activeWindow, A
    WinGetPos, x, y, w, h, A
    
    whichMonitor = % detectWhichMonitor(x)
    
    if( whichMonitor == monitor ){
        return
    }
    diff = % getDiff(x, whichMonitor)    
    isFullscreen = % isFullscreen(activeWindow)
    newX = % calculateNewX(diff, monitor)
        
    WinMove, %activeWindow%, , %newX%, %y% 
}

