#IfWinActive ahk_class ConsoleWindowClass
^v::
send %Clipboard%
return


; #IfWinActive 是一个用来对特定窗口实现快捷键（hotkey）和热字符串（HotString）的命令，ahk_class ConsoleWindowClass 是命令提示符的类名，可以用 ahk 自带的 Window Spy 获得。一起解释就是，以下热键只对命令提示符起作用，其他窗口中 Ctrl + V 还是原来的 Ctrl + V。

