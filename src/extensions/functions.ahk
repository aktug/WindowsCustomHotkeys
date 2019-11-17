extensionsFunction(){
    Loop % EXTENSIONS.Length(){
        extensionName = % EXTENSIONS[A_Index]
        extensionHotkey = % %extensionName%
        
        if(extensionHotkey = A_ThisHotkey){
            switch extensionName{
                case "clearWinNotificationsHotkey":
                    extension_clearNotifications()
                        Return
                case "mediaPause":
                    extension_mediaPause()
                return
                case "mediaPrev":
                    extension_mediaPrev()
                return
                case "mediaNext":
                    extension_mediaNext()
                return
                
                default:
                Return
            } 
        }   
    }
}

extension_clearNotifications(){
    Send #a
    Sleep, 500
    if WinActive("ahk_exe Shellexperiencehost.exe"){
        Send +{Tab}+{Tab} {Space} {Esc}
    }
}
extension_mediaPause(){
    Send {Media_Play_Pause}
}
extension_mediaPrev(){
    Send {Media_Prev}
}
extension_mediaNext(){
    Send {Media_Next}
}
