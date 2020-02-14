; RAlt 是热键，e d s f 是方向

CoordMode, Mouse, Screen
WatchKeyboard:
MouseNeedsToBeMoved := false  ; Set default.
if(count < 2500){
    count +=30
}
SetFormat, float, 03
up:=GetKeyState("e","p")
down:=GetKeyState("d","p")
Left:=GetKeyState("s","p")
right:=GetKeyState("f","p")
RState := GetKeyState("RAlt","p")
if(!RState)
{
    return
}
if(Right)
{
    MouseNeedsToBeMoved := true
    DeltaX := 1
}
else if(Left)
{
    MouseNeedsToBeMoved := true
    DeltaX := -1
}
else
    DeltaX = 0
if (up)
{
    MouseNeedsToBeMoved := true
    DeltaY := -1
}
else if (Down)
{
    MouseNeedsToBeMoved := true
    DeltaY := 1
}
else
    DeltaY = 0
if MouseNeedsToBeMoved
{
    MouseGetPos, xpos, ypos
    DllCall("SetCursorPos", "int", xpos + DeltaX * sqrt(count), "int",ypos + DeltaY * sqrt(count)) 
    ; SetMouseDelay, -1  ; Makes movement smoother.
    ; MouseMove, DeltaX * sqrt(count) , DeltaY * sqrt(count), 0, R
}else{
    count = 0; 
}
return


RAlt::SetTimer, WatchKeyboard,10
RAlt up::SetTimer,WatchKeyboard,Off

#if GetKeyState("RAlt","p")
*a::LButton
*r::RButton
+r::+RButton

*q::AppsKey

*i::WheelUp
*k::WheelDown
*j::WheelLeft
*l::WheelRight
*m::
    CoordMode, Mouse, Window
    MouseGetPos, rX,rY
    WinGetPos ,wX,wY,wWidth,wHeight,A
    If (Abs(wHeight/2-rY) <2 && Abs(wWidth/2 - rX)<2){
        SysGet, mc, MonitorCount
        If(mc > 1) {

            SysGet, Mon1, MonitorWorkArea, 1
            SysGet, Mon2, MonitorWorkArea, 2
            midle := (wX + wX+wWidth)/2
            ; ToolTip,midle %midle%     wx %wX%     wWidth %wWidth%       m1l %Mon1Left%      m1r %Mon1Right%      m2l %Mon2Left%      m2R %Mon2Right%  
            If ( midle > Mon1Left && midle < Mon1Right){
                ; ToolTip,2
                DllCall("SetCursorPos", "int", (Mon2Left+Mon2Right)/2, "int", (Mon2Top+Mon2Bottom)/2)
            }else{
                ; ToolTip,1
                DllCall("SetCursorPos", "int", (Mon1Left+Mon1Right)/2, "int", (Mon1Top+Mon1Bottom)/2)
            }
        }Else{
            ; ToolTip,%wHeight%     %wWidth%
            MouseMove,wWidth/2,10,0,
        }
    }Else{
        MouseMove, wWidth/2-rX ,wHeight/2-rY,0,r
    }
    MouseGetPos, , , id, control
    WinActivate, ahk_id  %id%
    CoordMode, Mouse, Screen
return
*p::Volume_Up
*SC027::Volume_Down

; *a::Return
*b::Return
*c::Return
*d::Return
*e::Return
*f::Return
*g::Return
*h::Return
; *i::Return
; *j::Return
; *k::Return
; *l::Return
; *m::Return
*n::Return
*o::Return
; *p::Return
; *q::Return
; *r::Return
*s::Return
*t::Return
*u::Return
*v::Return
*w::Return
*x::Return
*y::Return
*z::Return
*1::
    SysGet, mc, MonitorCount
    if(mc >=1){
        SysGet, Mon, MonitorWorkArea, 1
        DllCall("SetCursorPos", "int", (MonLeft+MonRight)/2, "int", (MonTop+MonBottom)/2)
        MouseGetPos, , , id, control
        WinActivate, ahk_id  %id%
    }
Return
*2::
    SysGet, mc, MonitorCount
    if(mc >=2){
        SysGet, Mon, MonitorWorkArea, 2
        DllCall("SetCursorPos", "int", (MonLeft+MonRight)/2, "int", (MonTop+MonBottom)/2)
        MouseGetPos, , , id, control
        WinActivate, ahk_id  %id%
    }
Return
*3::
    SysGet, mc, MonitorCount
    if(mc >=3){
        SysGet, Mon, MonitorWorkArea, 3
        DllCall("SetCursorPos", "int", (MonLeft+MonRight)/2, "int", (MonTop+MonBottom)/2)
        MouseGetPos, , , id, control
        WinActivate, ahk_id  %id%
    }
Return
*4::
    SysGet, mc, MonitorCount
    if(mc >=4){
        SysGet, Mon, MonitorWorkArea, 4
        DllCall("SetCursorPos", "int", (MonLeft+MonRight)/2, "int", (MonTop+MonBottom)/2)
        MouseGetPos, , , id, control
        WinActivate, ahk_id  %id%
    }
Return
*5::Return
*6::Return
*7::Return
*8::Return
*9::Return
*0::Return
#if