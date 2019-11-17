#SingleInstance, Force
#KeyHistory, 0
SetBatchLines, -1
ListLines, Off
SendMode Input
SetWorkingDir, %A_ScriptDir%
SplitPath, A_ScriptName, , , , thisscriptname
;#MaxThreadsPerHotkey, 1 ; no re-entrant hotkey handling
#NoEnv
SetTitleMatchMode,2


; Configs
#Include %A_ScriptDir%\configs\globals.ahk
#Include %A_ScriptDir%\configs\load.ahk

; Utils
#Include %A_ScriptDir%\utils.ahk

; Functions
#Include %A_ScriptDir%\extensions\functions.ahk
#Include %A_ScriptDir%\appKey\functions.ahk
#Include %A_ScriptDir%\workspace\functions.ahk
#Include %A_ScriptDir%\moveToMonitor\functions.ahk

;Registers
#Include %A_ScriptDir%\trayMenu\register.ahk
#Include %A_ScriptDir%\appKey\register.ahk
#Include %A_ScriptDir%\extensions\register.ahk
#Include %A_ScriptDir%\workspace\register.ahk
#Include %A_ScriptDir%\moveToMonitor\register.ahk

;HotkeysTip
#Include %A_ScriptDir%\hotkeysTip.ahk

; At The End Of, trayMenu/labels
#Include %A_ScriptDir%\labels.ahk










    
    
    
    