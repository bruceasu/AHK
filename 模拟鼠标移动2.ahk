#NoEnv
; =======================================
; 单击 CapsLock 键切换键盘鼠标模式
; 长按 CapsLock 键切换大写锁定模式
; =======================================
$CapsLock::
KeyWait, CapsLock, T.4
If ErrorLevel
{
　　KeyWait, CapsLock
　　If (A_PriorKey == "CapsLock")
　　{
　　　　SetCapsLockState, % GetKeyState("CapsLock", "T") ? "Off" : "On"
　　　　ToolTip, % "大写锁定: " . (GetKeyState("CapsLock", "T") ? "开启" : "关闭"), , , 13
　　　　SetTimer, RemoveToolTip, 1000
　　}
}
Else
{
　　KeyWait, CapsLock
　　MouseMode := !MouseMode
　　ToolTip, % "键盘鼠标模式: " . (MouseMode ? "开启" : "关闭"), , , 13
　　SetTimer, RemoveToolTip, 1000
}
Return

; =========================================================
; 键盘鼠标模式开启、或者按住 CapsLock 键时，有如下快捷键：
; =========================================================
; w: 向上移动光标
; a: 向左移动光标
; s: 向下移动光标
; d: 向右移动光标
; j: 发送鼠标左键
; k: 发送鼠标右键
; =========================================================
; 需要更多快捷键的话自己添加到下面两个 #If 之间……
; =========================================================
#If MouseMode Or GetKeyState("CapsLock", "P")
j::LButton
k::RButton
w::MoveCursor("w")
a::MoveCursor("a")
s::MoveCursor("s")
d::MoveCursor("d")
F12::Reload
#If


MoveCursor(dir, speed := 10)
{
　　Loop
　　{
　　　　If Not GetKeyState(dir, "P")
　　　　　　Break
　　　　If (dir == "w")
　　　　　　MouseMove, 0, speed * -1, 0, R
　　　　If (dir == "a")
　　　　　　MouseMove, speed * -1, 0, 0, R
　　　　If (dir == "s")
　　　　　　MouseMove, 0, speed, 0, R
　　　　If (dir == "d")
　　　　　　MouseMove, speed, 0, 0, R
　　}
　　Return
}

RemoveToolTip:
ToolTip, , , , 13
SetTimer, RemoveToolTip, Off
Return


; 一开始按的时候，移动很细微，按的时间越长，鼠标加速运动。
; 两种方案，我目前在用第一种功能是 开启鼠标模式： wasd还是默认速度移动，shift+wasd可以快速移动光标，
; 第二种是你要的逐渐变快方案……


代码还是上面最后发那版，其他不变，只改我下面发的这两种方案之一（当然你要两个一起改估计也能用）


; 方案一改动：
; #If MouseMode Or GetKeyState("CapsLock", "P")
; j::LButton
; k::RButton
; w::MoveCursor("w")
; a::MoveCursor("a")
; s::MoveCursor("s")
; d::MoveCursor("d")
; +w::MoveCursor("w", 55)
; +a::MoveCursor("a", 55)
; +s::MoveCursor("s", 55)
; +d::MoveCursor("d", 55)
; #If

; 方案二改动：
; MoveCursor(dir, speed := 1)
; {
; Loop
; {
; If (A_Index < 100)
; speed += A_Index * 0.1
; If Not GetKeyState(dir, "P")
; Break
; If (dir == "w")
; MouseMove, 0, speed * -1, 0, R
; If (dir == "a")
; MouseMove, speed * -1, 0, 0, R
; If (dir == "s")
; MouseMove, 0, speed, 0, R
; If (dir == "d")
; MouseMove, speed, 0, 0, R
; }
; Return
; }
