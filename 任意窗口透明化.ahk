;; 任意窗口透明化
!t::
MouseGetPos,,, MouseWin
WinGet, Transparent, Transparent, ahk_id %MouseWin%
;ToolTip Translucency:`t"%Transparent%"`nTransColor:`t%TransColor%
if Transparent!=
WinSet, TransColor, Off, ahk_id %MouseWin%
;关闭透明
else
{
MouseGetPos, MouseX, MouseY, MouseWin
PixelGetColor, MouseRGB, %MouseX%, %MouseY%, RGB
; 似乎有必要首先关闭任何现有的透明度:
WinSet, TransColor, Off, ahk_id %MouseWin%
WinSet, TransColor, %MouseRGB% 192, ahk_id %MouseWin%
}
return