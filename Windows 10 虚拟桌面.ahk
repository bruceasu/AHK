;Windows 10 虚拟桌面自动切换
;Windows 10 的新功能：虚拟桌面，不过切换的快捷键太麻烦，
;Ctrl + Win + 方向键，需要三根手指头，遇到紧急情况（你懂的）根本来不及，
;所以用 AutoHotKey 改了一下，双击 Ctrl 向右切换，三击 Ctrl 向左切换。

#Persistent
$ctrl::
if ctrl_presses > 0 ; SetTimer 已经启动，所以我们记录按键。
{
ctrl_presses += 1
return
}
;否则，这是新一系列按键的首次按键。将计数设为 1 并启动定时器：
ctrl_presses = 1
SetTimer, Keyctrl, 500 ;在 500 毫秒内等待更多的按键。
return
Keyctrl:
SetTimer, Keyctrl, off
if ctrl_presses = 1 ;该键已按过一次。
{
Gosub singleClick
}
else if ctrl_presses = 2 ;该键已按过两次。
{
Gosub doubleClick
}
else if ctrl_presses = 3
{
Gosub trebleClick
}
;不论上面哪个动作被触发，将计数复位以备下一系列的按键：
ctrl_presses = 0
return
singleClick:
send {ctrl}
return
doubleClick:
send #^{left}
return
trebleClick:
send #^{right}
return
;不论上面哪个动作被触发，将计数复位以备下一系列的按键：
SPACE_presses = 0
return
singleClick2:
send {SPACE}
return
doubleClick2:
send {enter}
return