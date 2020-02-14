;; 移除活动窗口的标题栏，获大更大视觉空间
!e::
biaotyic+=1
MouseGetPos , , , btwid ,  ; 得到鼠标所在位置窗口的id及控件名称
if biaotyic>0
{
WinSet, Style, -0xC00000,ahk_id %btwid%; 移除活动窗口的标题栏 (WS_CAPTION).
biaotyic*=-1
}
else
{
WinSet, Style, +0xC00000,ahk_id %btwid%; 恢复活动窗口的标题栏 (WS_CAPTION).
}
return