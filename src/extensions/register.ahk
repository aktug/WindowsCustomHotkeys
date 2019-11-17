Loop % EXTENSIONS.Length(){
    extensionName = % EXTENSIONS[A_Index]
    extensionHotkey = % %extensionName%

    if(extensionHotkey != "false"){
        Hotkey, %extensionHotkey% , extensionsFunction
    }
}