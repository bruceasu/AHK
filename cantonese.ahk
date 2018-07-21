#SingleInstance force
#MaxHotkeysPerInterval 100
#UseHook
Process, Priority,, Realtime
SetKeyDelay -1

Menu, Tray, NoStandard
Menu, Tray, Tip, 键盘布局 - Cantonese
Menu, Tray, Add, 切换 (&Q), MenuSuspend
Menu, Tray, Add, 切换 (&Q), MenuSuspend
Menu, Tray, Add, 退出 (&E), MenuExit
Menu, Tray, Default, 切换 (&Q)
Menu, Tray, Click, 1
Suspend Off


return

MenuExit:
  ExitApp

MenuSuspend:
  Suspend Permit
  if (A_IsSuspended) {
    Suspend Off
    Menu, Tray, Tip, 键盘布局 - Cantonese
  } else {
    Suspend On
    Menu, Tray, Tip, 键盘布局 - QWERTY
  }
  return

;#（Win 徽标键） !（Alt） ^（Ctrl） +（Shift） <>（左右区域） <^>!（AltGr） UP（抬起）

>!a::ä
+>!a::Ä

>!e::ê
+>!e::Ê

<!n::ñ
+<!n::Ñ

>!v::ü
+>!v::Ü

<!o::ö
+<!o::Ö

<!i::î
<!+i::Î

<!u::û
<!+u::Û


#!s::
  Suspend Permit
  if (A_IsSuspended) {
    Suspend Off
    Menu, Tray, Tip, 键盘布局 - Cantonese
  } else {
    Suspend On
    Menu, Tray, Tip, 键盘布局 - QWERTY
  }
  return

  