To remap the Caps Lock key to Ctrl save the following to a file named script.ahk. Then execute the script with AutoHotKey by double clicking it. See the  AHK2EXE documentation to learn how to make scripts into stand alone executables.
    #IfWinActive emacs  ; if in emacs
    +Capslock::Capslock ; make shift+Caps-Lock the Caps Lock toggle
    Capslock::Control   ; make Caps Lock the control button
    #IfWinActive        ; end if in emacs
