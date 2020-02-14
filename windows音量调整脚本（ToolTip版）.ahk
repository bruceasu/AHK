; ==============================================
; windows音量调整脚本（ToolTip版）
; ==============================================
; alt+左/右：音量最小/最大
; alt+上/下：音量±5
; ctrl+alt+上/下：音量±1（用得较少）
CoordMode, ToolTip, Screen
^!Up::   ;音量+1
^!Down:: ;音量-1
!Up::    ;音量+5
!Down::  ;音量-5
soundAdd := InStr(A_ThisHotkey, "^") ? 1 : 5
If InStr(A_ThisHotkey, "Up")
    hyf_SoundSetWaveVolume("+", soundAdd)
Else
    hyf_SoundSetWaveVolume("-", soundAdd)
Return

!Left::  ;静音
!Right:: ;音量最大
hyl_VolumeMinMax:
soundAdd := InStr(A_ThisHotkey, "Left") ? 0 : 100
SoundSet, soundAdd, , , DeviceNumber
hyf_tooltip("音量  " . soundAdd, 1, 0, A_ScreenWidth-1, A_ScreenHeight)
Return

hyf_SoundSetWaveVolume(mode, n)
{ ;mode为"+"或"-"
    SoundGet, soundSave, , , DeviceNumber
    soundSave := Round(soundSave)
    If (n = 5 && (numMod := Mod(Floor(soundSave), 5))) ;调整到5的倍数
        soundSave -= numMod
    If (mode = "+")
    {
        soundNow := Floor(soundSave) + n
        If (soundNow > 100)
        {
            hyf_tooltip("音量+  100", 1, 0, A_ScreenWidth-1, A_ScreenHeight)
            Return
        }
    }
    Else
    {
        soundNow := Floor(soundSave) - n
        If (soundNow < 0)
        {
            hyf_tooltip("音量-  0", 1, 0, A_ScreenWidth-1, A_ScreenHeight)
            Return
        }
    }
    SoundSet, soundNow, , , DeviceNumber
    hyf_tooltip("音量" . mode . "  " . soundNow, 1, 0, A_ScreenWidth-1, A_ScreenHeight)
    Return
}

hyf_tooltip(str, t := 1, ExitScript := 0, x := "", y := "")  ;提示t秒并自动消失
{
    t *= 1000
    ToolTip, %str%, %x%, %y%
    SetTimer, hyf_removeToolTip, -%t%
    If ExitScript
    {
        Gui, Destroy
        Exit
    }
}

hyf_removeToolTip() ;清除ToolTip
{
    ToolTip
}