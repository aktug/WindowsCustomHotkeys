Menu, Tray, Add , Windows Custom Hotkeys, ep_TrayEdit
Menu, Tray, Disable, 1&
Menu, Tray, Add  ; SEPERATOR
Menu, Tray, NoStandard
Loop % MONITORSETUPS.Length(){
    Menu, Tray, Add , % MONITORSETUPS[A_Index] , monitorWorkspacesTrayFunction
}
Menu, Tray, Add  ; SEPERATOR
Menu, Tray, Add , Settings, ep_TrayEdit
Menu, Tray, Add , Restart / Reload Settings, ep_TrayReload
Menu, Tray, Add , Exit, ep_TrayExit
Menu, Tray, Icon, %A_ScriptDir%\icon.ico
Menu, Tray, Default
Menu, Tray, Tip , Windows Custom Hotkeys
