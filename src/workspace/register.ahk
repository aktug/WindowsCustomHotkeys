
Loop % MONITORSETUPS.Length(){
    monitorWorkspaceName = % MONITORSETUPS[A_Index]
    
    monitorWorkspaceHotkey = % monitorWorkspaceName "_hotkey"
    monitorWorkspaceHotkey = % %monitorWorkspaceHotkey%
    
    if (monitorWorkspaceHotkey != "false"){
        Hotkey, %monitorWorkspaceHotkey% , monitorWorkspacesFunction
    }
}


