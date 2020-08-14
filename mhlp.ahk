#SingleInstance force
#MaxThreadsPerHotkey, 2
SetTitleMatchMode, 2

_toggleIt := false
_toggleThat := false
clickRate := 65

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Windows Helpers
; Close active browser tab
XButton2::
    Send ^w
    return

; Previous browser tab
WheelLeft::
    Send ^{PgUp}
    return

; Next browser tab
WheelRight::
    Send ^{PgDn}
    return

; Auto Click at current click rate
!LButton::
    While (GetKeyState("LButton", "P")) {
        Click
        Random rcr, clickRate - 2, clickRate + 2
        Sleep rcr
    }

    return

;key toggles
PrintScreen::
    if !_toggleIt
        SoundPlay, C:\Users\stone\OneDrive\Documents\activate.wav
    else
        SoundPlay, C:\Users\stone\OneDrive\Documents\deactivate.wav
        
    _toggleIt := !_toggleIt
    return

Insert::
    if !_toggleThat
        SoundPlay, C:\Users\stone\OneDrive\Documents\activate.wav
    else
        SoundPlay, C:\Users\stone\OneDrive\Documents\deactivate.wav
        
    _toggleThat := !_toggleThat
    return

!WheelUp::
    clickRate += 1
    ToolTip, A:%clickRate%
    SetTimer, TT, 500
    return

!WheelDown::
    clickRate -= 1
    ToolTip, A:%clickRate%
    SetTimer, TT, 500
    return

TT:
    SetTimer, TT, Off
    ToolTip,
    return

~LButton::
    If _toggleIt Or _toggleThat {
        While (GetKeyState("LButton", "P")) {
            Click
            Random rcr, clickRate - 6, clickRate + 6
            Sleep rcr
        }
    }
    return

~RButton::
    If _toggleThat {
        While (GetKeyState("RButton", "P")) {
            Click, Right            
            Random rcr, clickRate - 6, clickRate + 6
            Sleep rcr
        }
    }
    return    