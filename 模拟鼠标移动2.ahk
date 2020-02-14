#NoEnv
; =======================================
; ���� CapsLock ���л��������ģʽ
; ���� CapsLock ���л���д����ģʽ
; =======================================
$CapsLock::
KeyWait, CapsLock, T.4
If ErrorLevel
{
����KeyWait, CapsLock
����If (A_PriorKey == "CapsLock")
����{
��������SetCapsLockState, % GetKeyState("CapsLock", "T") ? "Off" : "On"
��������ToolTip, % "��д����: " . (GetKeyState("CapsLock", "T") ? "����" : "�ر�"), , , 13
��������SetTimer, RemoveToolTip, 1000
����}
}
Else
{
����KeyWait, CapsLock
����MouseMode := !MouseMode
����ToolTip, % "�������ģʽ: " . (MouseMode ? "����" : "�ر�"), , , 13
����SetTimer, RemoveToolTip, 1000
}
Return

; =========================================================
; �������ģʽ���������߰�ס CapsLock ��ʱ�������¿�ݼ���
; =========================================================
; w: �����ƶ����
; a: �����ƶ����
; s: �����ƶ����
; d: �����ƶ����
; j: ����������
; k: ��������Ҽ�
; =========================================================
; ��Ҫ�����ݼ��Ļ��Լ���ӵ��������� #If ֮�䡭��
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
����Loop
����{
��������If Not GetKeyState(dir, "P")
������������Break
��������If (dir == "w")
������������MouseMove, 0, speed * -1, 0, R
��������If (dir == "a")
������������MouseMove, speed * -1, 0, 0, R
��������If (dir == "s")
������������MouseMove, 0, speed, 0, R
��������If (dir == "d")
������������MouseMove, speed, 0, 0, R
����}
����Return
}

RemoveToolTip:
ToolTip, , , , 13
SetTimer, RemoveToolTip, Off
Return


; һ��ʼ����ʱ���ƶ���ϸ΢������ʱ��Խ�����������˶���
; ���ַ�������Ŀǰ���õ�һ�ֹ����� �������ģʽ�� wasd����Ĭ���ٶ��ƶ���shift+wasd���Կ����ƶ���꣬
; �ڶ�������Ҫ���𽥱�췽������


���뻹����������ǰ棬�������䣬ֻ�������淢�������ַ���֮һ����Ȼ��Ҫ����һ��Ĺ���Ҳ���ã�


; ����һ�Ķ���
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

; �������Ķ���
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
