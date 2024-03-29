; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; This script has a special filename and path because it is automatically
; launched when you run the program directly.  Also, any text file whose
; name ends in .ahk is associated with the program, which means that it
; can be launched simply by double-clicking it.  You can have as many .ahk
; files as you want, located in any folder.  You can also run more than
; one ahk file simultaneously and each will get its own tray icon.

; SAMPLE HOTKEYS: Below are two sample hotkeys.  The first is Win+Z and it
; launches a web site in the default browser.  The second is Control+Alt+N
; and it launches a new Notepad window (or activates an existing one).  To
; try out these hotkeys, run AutoHotkey again, which will load this file.


;; Ctrl、Alt、Shift 在 AHK 怎么表示？
;; WIN的符号是 #
;; Ctrl 的符号是 ^
;; Alt 的符号是 !
;; Shift 的符号是 +
;;&	&可用在两个按键（包括鼠标按键）之间来组合它们成为一个自定义的热键。详细说明请看 下面。
;;<	使用成对按键（如Alt、Ctrl、Win）中左边的一个。例如<!a 和 !a 差不多，但是<!a是只有当按下左边的那个Alt时才会触;;发热键。此功能不支持Windows 95/98/ME。
;;>	使用成对按键（如Alt、Ctrl、Win）中右边的一个。同上，此功能不支持 Windows 95/98/ME。
;;<^>!	AltGr。如果您的键盘布局中AltGr键代替了右边的Alt键，这一系列的符号就是用来表示AltGr键的(仅支持Windows ;;NT/2k/XP或更高级版本)。例如：
;;<^>!m::MsgBox 您按了AltGr+m.
;;<^<!m::MsgBox 您按了左边的Control+左边的Alt+m.
;;*	通配符：只要包含有指定调节键的按键被按下即触发热键，经常用在 映射（Remap） 按键或按钮的时候。例如：
;;*#c::Run Calc.exe ; Win+C, Shift+Win+C, Ctrl+Win+C等等，只要有Win+C即触发热键。

;; ~	如果自定义的热键和系统/程序原有的热键相同，则这些热键同时触发。在以下的两个例子里，当用户按下鼠标右键后，自定义的热键功能和系统/程序原有的右键菜单将同时触发：
;; ~RButton::MsgBox 您按下了鼠标右键
;; ~RButton & C::MsgBox 您按下了C键和鼠标右键
;; $	此符号只有当脚本使用 Send（发送） 命令发送的按键正好包含有热键本身的时候才会用到。在不同的系统上使用$前缀运行起来会有一些变化：

^!n::
IfWinExist Untitled - Notepad2
	WinActivate
else
	Run Notepad2
return

#Return:: Run Cmd.exe


#!p::
  Suspend Permit
  if (A_IsSuspended) {
	Suspend Off
  } else {
	Suspend On
  }
  return
; ===============================================================
; 颜色神偷
; ===============================================================
#c::
MouseGetPos, mouseX, mouseY
		; 获得鼠标所在坐标，把鼠标的 X 坐标赋值给变量 mouseX ，同理 mouseY
PixelGetColor, color, %mouseX%, %mouseY%, RGB
		; 调用 PixelGetColor 函数，获得鼠标所在坐标的 RGB 值，并赋值给 color
StringRight color,color,6
		; 截取 color（第二个 color） 右边的 6 个字符，因为获得的值是这样的：#RRGGBB，一般我们只需要 RRGGBB 部分。把截取到的值再赋给 color（第一个 color）。
clipboard = %color%
		; 把 color 的值发送到剪贴板
tooltip, 鼠标所在颜色值已发送到剪贴板。`n小众软件 - appinn.com`n本系列教程作者：sfufoet
		; tooltip 弹出鼠标提示的命令，后面加上要显示的语句。中间的 `n 表示回车
sleep 2000
		; 时间暂停 两秒
tooltip,
		; 关闭鼠标提示
return


; Note: From now on whenever you run AutoHotkey directly, this script
; will be loaded.  So feel free to customize it to suit your needs.

; Please read the QUICK-START TUTORIAL near the top of the help file.
; It explains how to perform common automation tasks such as sending
; keystrokes and mouse clicks.  It also explains more about hotkeys.


;Context Sensitive Help in Any Editor -- by Rajat
;This script makes Ctrl+2 (or another hotkey of your choice)
;to reformat the text.
;
;
;
;--------------------------------------------------------------------------------

; The hotkey below uses the clipboard to provide compatibility with the maximum
; number of editors (since ControlGet doesn't work with most advanced editors).
; It restores the original clipboard contents afterward, but as plain text,
; which seems better than nothing.




!^#q::
; The following values are in effect only for the duration of this hotkey thread.
; Therefore, there is no need to change them back to their original values
; because that is done automatically when the thread ends:
SetWinDelay 10
SetKeyDelay 0
AutoTrim, Off

if A_OSType = WIN32_WINDOWS  ; Windows 9x
	Sleep, 500  ; Give time for the user to release the key.
;; 很不可靠
send, ^c
; reformat the clipboard text
RunWait, c:\Python27\python.exe C:\green\fmtText.py 70
Sleep, 500
; paste
send, ^v
return


;$!e::
;; The following values are in effect only for the duration of this hotkey thread.
;; Therefore, there is no need to change them back to their original values
;; because that is done automatically when the thread ends:
;SetWinDelay 10
;SetKeyDelay 0
;AutoTrim, On

;if A_OSType = WIN32_WINDOWS  ; Windows 9x
;	Sleep, 500  ; Give time for the user to release the key.
;;; 很不可靠
;;;send, ^c
;; reformat the clipboard text
;RunWait, c:\Python27\python.exe C:\green\ed.py
;;Sleep, 500
;; paste
;; send, ^v
;return


;$!d::
;; The following values are in effect only for the duration of this hotkey thread.
;; Therefore, there is no need to change them back to their original values
;; because that is done automatically when the thread ends:
;SetWinDelay 10
;SetKeyDelay 0
;AutoTrim, On

;if A_OSType = WIN32_WINDOWS  ; Windows 9x
;	Sleep, 500  ; Give time for the user to release the key.
;;; 很不可靠
;;;send, ^c
;; reformat the clipboard text
;RunWait, c:\Python27\python.exe C:\green\ed.py -d
;;Sleep, 500
;; paste
;; send, ^v
;return

; =====================================
; cmd 支持 ^c
; =====================================
#IfWinActive ahk_class ConsoleWindowClass
^v::
send %Clipboard%
return

;;~LButton & RButton::
;;		; 按住不放 A 键再按 B 键的写法是 “A & B”（真的可以这样写哦，真的可以实现这样的快捷键）。“~”在这里是指示原有的左键仍要处理，若不加“~”则左键就失效了。
;;WinGetClass, class, A
;;		; 这个语句是专门对付 Gtalk 的。获得当前活动窗口（最后的 A 参数就是代表当前活动窗口）的类（class）名，并赋值给 class。类名这个词好专业啊。GTalk 的聊天窗口的标题是没有规律的，但它们都是同一类，其类名都是 Chat View。用比喻来说，我们都是同一个“类”，我们都是人类，人这个类又可以细分为很多“类”。
;;IfInString, class, Chat
;;		; 判断 class 中是否含有 chat
;;{
;;send !{F4}
;;return
;;		; 有的话，说明很可能（99.9%）是 Gtalk 的聊天窗口啦，发送 Alt + F4 关闭聊天窗口。并且结束脚本。
;;}
;;
;;WinGetActiveTitle, Title
;;		; 获取当前活动窗口的标题，赋值给 Title
;;IfInString, Title, Firefox
;;		; 判断 Title 中是否含有 Firefox ，无论我们打开什么网页，这个是永远不变的，你也可以试试用类名来判断。文末会介绍怎么获得一个窗口的类名。
;;{
;;send ^w
;;return
;;}
;;IfInString, Title, AutoHotkey
;;{
;;send {esc}
;;return
;;}
;;else
;;		; 这个 else 是多余的，历史遗留问题。orz
;;WinClose, %Title%
;;return

; =====================================
; 置顶
; =====================================
^!F9::
  Winset AlwaysOnTop, Toggle, A
  return
  

; This script modified from the original: http://www.autohotkey.com/docs/scripts/EasyWindowDrag.htm
; by The How-To Geek
; http://www.howtogeek.com

Alt & LButton::
CoordMode, Mouse								; Switch to screen/absolute coordinates.
MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
WinGetPos, EWD_OriginalPosX, EWD_OriginalPosY,,, ahk_id %EWD_MouseWin%
WinGet, EWD_WinState, MinMax, ahk_id %EWD_MouseWin%
if EWD_WinState = 0							 ; Only if the window isn't maximized
	SetTimer, EWD_WatchMouse, 10 ;			  Track the mouse as the user drags it.
return

EWD_WatchMouse:
GetKeyState, EWD_LButtonState, LButton, P
if EWD_LButtonState = U						 ; Button has been released, so drag is complete.
{
	SetTimer, EWD_WatchMouse, off
	return
}
GetKeyState, EWD_EscapeState, Escape, P
if EWD_EscapeState = D						  ; Escape has been pressed, so drag is cancelled.
{
	SetTimer, EWD_WatchMouse, off
	WinMove, ahk_id %EWD_MouseWin%,, %EWD_OriginalPosX%, %EWD_OriginalPosY%
	return
}
; Otherwise, reposition the window to match the change in mouse coordinates
; caused by the user having dragged the mouse:
CoordMode, Mouse
MouseGetPos, EWD_MouseX, EWD_MouseY
WinGetPos, EWD_WinX, EWD_WinY,,, ahk_id %EWD_MouseWin%
SetWinDelay, -1								 ; Makes the below move faster/smoother.
WinMove, ahk_id %EWD_MouseWin%,, EWD_WinX + EWD_MouseX - EWD_MouseStartX, EWD_WinY + EWD_MouseY - EWD_MouseStartY
EWD_MouseStartX := EWD_MouseX				   ; Update for the next timer-call to this subroutine.
EWD_MouseStartY := EWD_MouseY
return


backward-word:
 Send {Ctrl down}{Left}{Ctrl up}
 return


forward-word:
  Send {Ctrl down}{Right}{Ctrl up}
  return

backward-delete-word:
 Send {Ctrl down}{BackSpace}{Ctrl up}
 return


delete-word:
  Send {Ctrl down}{DELETE}{Ctrl up}
  return


kill-line:
  Send {HOME}{HOME}{HOME}{Shift down}{End}{End}{End}{Shift up}{DELETE}{DELETE}
  return

lockshift:
  shiftlocker := !shiftlocker
  if (shiftlocker) 
  { 
  	send {shift down}
  } else {
  	send {shift up}
  }
  return

undo:
  Send {Ctrl down}{z}{Ctrl up}
  return
cut:
	Send ^x
	return
copy:
	Send ^c
	return
paste:
	Send ^v
	return

redo:
 Send {Ctrl down}{y}{Ctrl up}
 return

;=========================================================
; 键切换键盘鼠标模式
; --------------------------------------------------------
; 键盘鼠标模式开启有如下快捷键：
; =========================================================
; k: 向上移动光标
; h: 向左移动光标
; j: 向下移动光标
; l: 向右移动光标
; f: 发送鼠标左键
; s: 发送鼠标右键
; d: 发送鼠标中键
; =========================================================
; 需要更多快捷键的话自己添加到下面两个 #If 之间……
; =========================================================
#If MouseMode
	h::MoveCursor("h")
	j::MoveCursor("j")
	k::MoveCursor("k")
	l::MoveCursor("l")
	; 快 
	+h::MoveCursor("h", 15)
	+j::MoveCursor("j", 15)
	+k::MoveCursor("k", 15)
	+l::MoveCursor("l", 15)
	; 快 
	!h::MoveCursor("h", 1)
	!j::MoveCursor("j", 1)
	!k::MoveCursor("k", 1)
	!l::MoveCursor("l", 1)
	u::WheelUp
	i::WheelDown
	r::
		lockmousedown := !lockmousedown
		if (lockmousedown){
			send {LButton down}
		} else {
			send {LButton up}
		}
		return
	; 左击
	f::LButton
	; 右击
	s::RButton
	; 中击
	d::MButton
	;; 双击
	;;h::MouseClick, left, , , 2
	g::return
#If


MoveCursor(dir, speed := 3)
{
	Loop
	{
		If Not GetKeyState(dir, "P")
			Break
		If (dir == "k")
			MouseMove, 0, speed * -1, 0, R
		If (dir == "h")
			MouseMove, speed * -1, 0, 0, R
		If (dir == "j")
			MouseMove, 0, speed, 0, R
		If (dir == "l")
			MouseMove, speed, 0, 0, R
	}
	Return
}
RemoveToolTip:
ToolTip, , , , 13
SetTimer, RemoveToolTip, Off
Return

; 用于启用Norman或者QWERTY
;#n::
;  Suspend Permit
;  Suspend Off
;  Menu, Tray, Tip, KB - Norman
; return

;; Temporarily Disable AutoHotkey
;; You have many personal hotkeys. In some situations, you want these hotkeys to be off temporarily. You can create a hotkeyX, so that it'll disable all your hotkeys, and press hotkeyX again to turn all your hotkeys back on. Here's a example:
; make the scroll lock key (ScrLk) toggle all hotkeys.
$ScrollLock::Suspend
  
#If MyKBDMode
;; My Keyboard Layout
;; qwprfyukl;
;; asdtghnioe
;; zxcvbjm
;MyKBDMode Keyboard Layout
;---------------------------------------------
;  ~  !  @  #  $  %  ^  &  *  (  )  _  +  ____
;  `  1  2  3  4  5  6  7  8  9  0  -  =   BS
; ___                             :   {  }  |
; Tab  q  w  p  r  f  y  u  k  l  ;  [  ]  \
; ____                               "  _____
; Caps  a  s  d  t  g  h  n  i  o  e  '  Enter
; _____                       <  >  ?  _______
; Shift  z  x  c  v  b  j  m  ,  .  /   Shift


;; number row
;; ` 1 2 3 4 5 6 7 8 9 0 - =
;; ~ ! @ # $ % ^ & * ( ) _ +
;`::`
;1::1
;2::2
;3::3
;4::4
;5::5
;6::6
;7::7
;8::8
;9::9
;0::0
;-::-
;=::=

;; up row
;; q w p r t y u k l ;
;q::q
;w::w
e::p
r::r
t::f
;y::y
;u::u
i::k
o::l
p::`;
;[::[
;]::]
;\::\

;; home row
;; a s d t g h n i o e
;a::a
;s::s
;d::d
f::t
;g::g
;h::h
j::n
k::i
l::o
SC027::e
;'::'

;; down row
;; z x c v b j m
;z::z
;x::x
;c::c
;v::v
;b::b
n::j
;m::m
;,::,
;.::.
;/::/
#If

#SingleInstance force
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode 3  ; Exact matching to avoid confusing T/B with Tab/Backspace.

#If ColemakKBDMode
;这个AutoHotKey脚本的作用是把标准的Qwerty键盘布局映射成Colemak键盘布局

;Colemak Keyboard Layout
;---------------------------------------------
;  ~  !  @  #  $  %  ^  &  *  (  )  _  +  ____
;  `  1  2  3  4  5  6  7  8  9  0  -  =   BS
; ___                                {  }  |
; Tab  q  w  f  p  g  j  l  u  y  ;  [  ]  \
; ____                                "  _____
; Caps  a  r  s  t  d  h  n  e  i  o  '  Enter
; _____                       <  >  ?  _______
; Shift  z  x  c  v  b  k  m  ,  .  /   Shift

;Qwerty Keyboard Layout
;---------------------------------------------
;  ~  !  @  #  $  %  ^  &  *  (  )  _  +  ____
;  `  1  2  3  4  5  6  7  8  9  0  -  =   BS
; ___                                {  }  |
; Tab  q  w  e  r  t  y  u  i  o  p  [  ]  \
; ____                             :  "  _____
; Caps  a  s  d  f  g  h  j  k  l  ;  '  Enter
; _____                       <  >  ?  _______
; Shift  z  x  c  v  b  n  m  ,  .  /   Shift


capslock::BackSpace

;   q  w  e  r  t  y  u  i  o  p  [  ]  \
;=> q  w  f  p  g  j  l  u  y  ;  [  ]  \
e::f
r::p
t::g
y::j
u::l
i::u
o::y
p::;

;   a  s  d  f  g  h  j  k  l  ;  '
;=> a  r  s  t  d  h  n  e  i  o  '
s::r
d::s
f::t
g::d
j::n
k::e
l::i
SC027::o

;   z  x  c  v  b  n  m  ,  .  /
;=> z  x  c  v  b  k  m  ,  .  /
n::k
#If

#If WorkmanKBDMode
;; Workman Keyboard Layout
;`::`
;1::1
;2::2
;3::3
;4::4
;5::5
;6::6
;7::7
;8::8
;9::9
;0::0
;-::-
;=::=

;q::q
w::d
e::r
r::w
t::b
y::j
u::f
i::u
o::p
p::`;
;[::[
;]::]
;\::\

;a::a
;s::s
d::h
f::t
;g::g
h::y
j::n
k::e
l::o
SC027::i
;'::'

;z::z
;x::x
c::m
v::c
b::v
n::k
m::l
;,::,
;.::.
;/::/
#If
 
;;;;;;;;;;;;;;;;;;;;;;;; 3rd level ;;;;;;;;;;;;;;;;;;;;;;;;;
space::space
space::Send {space}

; upper row
;;space & q::Send {Insert}
space & q::
;;	SwitchIME(0x00000409)
Send {Esc }
	return
space & w::goto backward-word
space & e::Send {END}
space & r::Send {&}
space & t::Send {|}
space & y::goto kill-line
space & u::Send {_}
space & i::Send {UP}
space & o::Send {-}
space & p::Send {+}
	
;; home row
space & a::Send {Home}
;;space & s:: Send ^+0
space & d::Send {Delete}
space & f::goto forward-word
space & g::Send {Return}
space & h::Send {=}
space & j::Send {Left}
space & k::Send {Down}
space & l::Send {Right}
space & SC027:: 
  ColemakKBDMode :=!ColemakKBDMode
  ToolTip, % "切换键盘布局为ColemakKBDMode: " . (ColemakKBDMode ? "开启" : "关闭"), , , 13
	SetTimer, RemoveToolTip, 1000
	Return
   

;; lower row
space & z::goto undo
space & x::goto cut
space & c::goto copy
space & v::goto paste

space & b::Send {[}{]}{Left}
space & n::Send {`{}{`}}{Left}

space & m::
	MouseMode := !MouseMode
	ToolTip, % "键盘模拟鼠标: " . (MouseMode ? "开启" : "关闭"), , , 13
	SetTimer, RemoveToolTip, 1000
	Return
space & ,::Send {PgUp}
space & .::Send {PgDn}
space & /::Send {\}

;; cantonese character: ü ä ö ñ
#o::Send {ö}
#a::Send {ä}
#n::Send {ñ}
#u::Send {ü}
#k::Send {ķ}
#g::Send {ģ} 
#e::Send {ê}

;; number row
space & 1::Send {space}
space & 2::Send {"}
space & 3::goto backward-delete-word
;; space & 4::Send {RButton}
space & 4::goto delete-word
space & 5::
	; =======================================
	; 移除活动窗口的标题栏，获大更大视觉空间
	; =======================================
	flag := !flag
	MouseGetPos , , , btwid ,  ; 得到鼠标所在位置窗口的id及控件名称
	if flag
	{
	WinSet, Style, -0xC00000,ahk_id %btwid%; 移除活动窗口的标题栏 (WS_CAPTION).
	}
	else
	{
	WinSet, Style, +0xC00000,ahk_id %btwid%; 恢复活动窗口的标题栏 (WS_CAPTION).
	}
	return

space & 6::
	if GetKeyState("CapsLock", "T") = 1
	{
		SetCapsLockState, off
		ToolTip, % "关闭大写", , , 13
		SetTimer, RemoveToolTip, 1000
	}
	else if GetKeyState("CapsLock", "F") = 0
	{
		ToolTip, % "开启大写", , , 13
		SetTimer, RemoveToolTip, 1000
		SetCapsLockState, on
	}
return
space & 7::Send {F11}
space & 8::goto lockshift
space & F12::Reload

;; 切换成我的输入法

space & \::
 if (IME_GET() == 1 ) {
  ;;SwitchIME(0x04090409)
  toEnglish()
  
 } else {
  toChinese()
 }
 SetTimer, RemoveToolTip, 500
return
;;;;;;;;;;;;;;;;;;;;;;;; capslock ;;;;;;;;;;;;;;;;;;;;;;;;;
;; SetCapsLockState, alwaysoff
;; *Capslock::Send {Home}
;; Capslock::Control
;; return

;这里是替换大写和退格
CapsLock::BackSpace
;大写切换不会经常用,平时用shifte
Shift & CapsLock::CapsLock
;强烈建议这里换成删除,因为删除的按键距离主键盘过远,影响打字效率

;;<!::LControl
;;RCtrl::RAlt

;; *Capslock::
;;	 Send {LControl Down}
;;	 KeyWait, CapsLock
;;	 Send {LControl Up}
;; return

;; swap Alt and Ctrl
;; this doesn't work perfectly, when you need to press Shift or others with Alt or Ctrl
;;Ctrl::Alt
;;Alt::Ctrl

;; RWin::AppsKey ; make the right Win key behave as AppsKey

;; 这个键盘没有RWin, 一些快捷键不方便。
AppsKey::AppsKey
AppsKey & e:: 
  send {RWin Down}
  send e
  send {RWin Up}
  return
AppsKey & r:: 
  send {RWin Down}
  send r
  send {RWin Up}
  return
AppsKey & d:: 
  send {RWin Down}
  send d
  send {RWin Up}
  return
;#IfWinActive emacs  ; if in emacs
;	+Capslock::Capslock ; make shift+Caps-Lock the Caps Lock toggle
;	Capslock::Control   ; make Caps Lock the control button
;#IfWinActive		; end if in emacs

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;TEXT FORMT ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#^q::
; The following values are in effect only for the duration of this hotkey thread.
; Therefore, there is no need to change them back to their original values
; because that is done automatically when the thread ends:
SetWinDelay 10
SetKeyDelay 0
AutoTrim, Off

if A_OSType = WIN32_WINDOWS  ; Windows 9x
	Sleep, 100  ; Give time for the user to release the key.
	Send, {Home}
	Send, {Home}
	Send, {Shift Down}
	Send, {End}
	Send, {End}
	Send, {Shift Up}
	;; 很不可靠
   send, ^c
   ; reformat the clipboard text
   RunWait, c:\Python27\python.exe C:\green\fmtText.py
   Sleep, 500
   ; paste
   send, ^v
return


;; Close Current Window or Tab
;; Windows has many different keyboard shortcuts to close the window. For example, 【Alt+F4】 closes the application, 【Ctrl+F4】 or 【Ctrl+w】 closes current tab or window in browsers, Escape usually closes dialog boxes. (See: Microsoft Windows Keyboard Shortcuts) All these can be thought of close the current visible box. You can define a easy key, so that it'll close the current browser tab, or window, or application.

;; ;;; make the “Pause/Break” key to close window or tab.
;; ; which key to send depends on the application
;; Pause::
;; IfWinActive ahk_class ATH_Note
;; { ; ATH_Note is Windows Mail
;; ; Ctrl+F4
;;   Send !{F4}
;; }
;; IfWinActive ahk_class Notepad
;; { ; Alt+F4
;;   Send !{F4}
;; }
;; Else IfWinActive ahk_class Outlook Express Browser Class
;; { WinMinimize, A
;; }
;; Else IfWinActive ahk_class IrfanView
;; { Send {Esc}
;;  }
;; Else ; IE, Firefox, Google Chrome, Opera
;; {  Send ^w
;;  }
;; Return
;; The code checks what application is the current window, by the IfWinActive lines. When you want a hotkey to check what is the current window or if it exists, you can use “IfWinActive” or “IfWinExist”.

;; ======================================
;; 在任务栏上滚动滚轮来改变系统音量
;; ======================================
#If MouseIsOver("ahk_class Shell_TrayWnd")
WheelUp::Send {Volume_Up}
WheelDown::Send {Volume_Down}
MouseIsOver(WinTitle) {
	MouseGetPos,,, Win
	return WinExist(WinTitle . " ahk_id " . Win)
}
#If

;; ======================================
;; 按Esc关闭输入法
;; ======================================
~esc::
	Send, {ESC}
	; 下方代码可只保留一个
	;
	;SwitchIME(0x04090409) ; 英语(美国) 美式键盘
	;SwitchIME(0x08040804)  ; 中文(中国) 简体中文-美式键盘
return

SwitchIME(dwLayout){
    HKL:=DllCall("LoadKeyboardLayout", Str, dwLayout, UInt, 1)
    ControlGetFocus,ctl,A
    SendMessage,0x50,0,HKL,%ctl%,A
}
toChinese()
{
	SetCapsLockState,off
	switchLang(0)
	switchLang()
  ToolTip, % "中文键盘", , , 13
}
toEnglish()
{
	SetCapsLockState,off
	switchLang(0)
	ToolTip, % "英文键盘", , , 13
}

;CapsLock::
;	SetCapsLockState,on
;return
 
switchLang(ime := "A")
{
	if (ime = 1){
		DllCall("SendMessage", UInt, WinActive("A"), UInt, 80, UInt, 1, UInt, DllCall("LoadKeyboardLayout", Str,"00000804", UInt, 1))
	}else if (ime = 0)
	{
		DllCall("SendMessage", UInt, WinActive("A"), UInt, 80, UInt, 1, UInt, DllCall("LoadKeyboardLayout", Str,, UInt, 1))
	}else if (ime = "A")
	{
		;ime_status:=DllCall("GetKeyboardLayout","int",0,UInt)
		Send, #{Space}
	}
}
	

IME_GET(WinTitle="")
;-----------------------------------------------------------
; IMEの状態の取得
;    対象： AHK v1.0.34以降
;   WinTitle : 対象Window (省略時:アクティブウィンドウ)
;   戻り値  1:ON 0:OFF
;-----------------------------------------------------------
{
    ifEqual WinTitle,,  SetEnv,WinTitle,A
    WinGet,hWnd,ID,%WinTitle%
    DefaultIMEWnd := DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hWnd, Uint)
 
    ;Message : WM_IME_CONTROL  wParam:IMC_GETOPENSTATUS
    DetectSave := A_DetectHiddenWindows
    DetectHiddenWindows,ON
    SendMessage 0x283, 0x005,0,,ahk_id %DefaultIMEWnd%
    DetectHiddenWindows,%DetectSave%
    Return ErrorLevel
}

;; Browser_Search::
