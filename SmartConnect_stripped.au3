#NoTrayIcon
#Au3Stripper_Ignore_Funcs=_iHoverOn,_iHoverOff,_iFullscreenToggleBtn,_cHvr_CSCP_X64,_cHvr_CSCP_X86,_iControlDelete
Global $0 = "0x252525"
Global $1 = "0xFFFFFF"
Global $2 = "0x2D2D2D"
Global $3 = "0x125bad"
Global $4 = "0xFFFFFF"
Global $5 = "0xFFFFFF"
Global $6 = "MeuAtivo"
Global $7 = "0xD8D8D8"
Global $8 = "0x1a1a1a"
Global $9 = "0x504f4f"
Global $a = 0x404040
Global $b = 0x272727
Global $c = 0x125bad
Global $d = 0x125bad
Global $e = 0x252525
Global $f = 0xffffff
Func _0($g = "MeuAtivo")
$6 = $g
Switch($g)
Case "Dark"
$0 = 0x252525
$1 = "0xFFFFFF"
$2 = "0x2D2D2D"
$3 = "0x125bad"
$4 = "0xFFFFFF"
$5 = "0xFFFFFF"
$7 = "0xD8D8D8"
$8 = "0x1a1a1a"
$9 = "0x504f4f"
$a = 0x404040
$b = 0x272727
$c = 0x125bad
$d = 0x125bad
$e = 0x252525
$f = 0xffffff
Case "Light"
$0 = 0xdddddd
$1 = "0x252525"
$2 = "0x2D2D2D"
$3 = "0x125bad"
$4 = "0xFFFFFF"
$5 = "0xFFFFFF"
$7 = "0x7e7e7e"
$8 = "0x1a1a1a"
$9 = "0x504f4f"
$a = 0x202020
$b = 0xc0bfbf
$c = 0x125bad
$d = 0x125bad
$e = 0x252525
$f = 0x2c8fff
Case "RolloutAssistant"
$0 = 0xF0F0F0
$1 = "0x252525"
$2 = "0x2D2D2D"
$3 = "0x125bad"
$4 = "0xFFFFFF"
$5 = "0xFFFFFF"
$7 = "0x7e7e7e"
$8 = "0x1a1a1a"
$9 = "0x504f4f"
$a = 0x202020
$b = 0xc0bfbf
$c = 0x125bad
$d = 0x125bad
$e = 0x252525
$f = 0x2c8fff
Case Else
ConsoleWrite("Metro-UDF-Error: Theme not found, using default theme." & @CRLF)
$0 = 0x252525
$1 = "0xFFFFFF"
$2 = "0x2D2D2D"
$3 = "0x125bad"
$4 = "0xFFFFFF"
$5 = "0xFFFFFF"
$7 = "0x252525"
$8 = "0x1a1a1a"
$9 = "0x504f4f"
$a = 0x404040
$b = 0x272727
$c = 0x125bad
$d = 0x125bad
$e = 0x252525
$f = 0xffffff
EndSwitch
EndFunc
Global Const $h = 0x0026200A
Global Const $i = "struct;long X;long Y;endstruct"
Global Const $j = "struct;long Left;long Top;long Right;long Bottom;endstruct"
Global Const $k = "struct;long X;long Y;endstruct"
Global Const $l = "struct;float X;float Y;float Width;float Height;endstruct"
Global Const $m = "uint Version;ptr Callback;bool NoThread;bool NoCodecs"
Global Const $n = "byte Op;byte Flags;byte Alpha;byte Format"
Global Const $o = "uint length;uint flags;uint showCmd;long ptMinPosition[2];long ptMaxPosition[2];long rcNormalPosition[4]"
Global $p, $q = 0
Global Const $r = 'struct;dword OSVersionInfoSize;dword MajorVersion;dword MinorVersion;dword BuildNumber;dword PlatformId;wchar CSDVersion[128];endstruct'
Global Const $s = _p()
Func _5($t)
Local $u = DllCall("kernel32.dll", "bool", "FreeLibrary", "handle", $t)
If @error Then Return SetError(@error, @extended, False)
Return $u[0]
EndFunc
Func _c($v)
Local $u = DllCall("kernel32.dll", "handle", "LoadLibraryW", "wstr", $v)
If @error Then Return SetError(@error, @extended, 0)
Return $u[0]
EndFunc
Func _n(ByRef $w, $x = 100)
Select
Case UBound($w, 2)
If $x < 0 Then
ReDim $w[$w[0][0] + 1][UBound($w, 2)]
Else
$w[0][0] += 1
If $w[0][0] > UBound($w) - 1 Then
ReDim $w[$w[0][0] + $x][UBound($w, 2)]
EndIf
EndIf
Case UBound($w, 1)
If $x < 0 Then
ReDim $w[$w[0] + 1]
Else
$w[0] += 1
If $w[0] > UBound($w) - 1 Then
ReDim $w[$w[0] + $x]
EndIf
EndIf
Case Else
Return 0
EndSelect
Return 1
EndFunc
Func _p()
Local $y = DllStructCreate($r)
DllStructSetData($y, 1, DllStructGetSize($y))
Local $0z = DllCall('kernel32.dll', 'bool', 'GetVersionExW', 'struct*', $y)
If @error Or Not $0z[0] Then Return SetError(@error, @extended, 0)
Return BitOR(BitShift(DllStructGetData($y, 2), -8), DllStructGetData($y, 3))
EndFunc
Func _2l($10)
Local $u = DllCall("gdi32.dll", "bool", "DeleteObject", "handle", $10)
If @error Then Return SetError(@error, @extended, False)
Return $u[0]
EndFunc
Func _2v($11, $12)
Local $u = DllCall("gdi32.dll", "handle", "SelectObject", "handle", $11, "handle", $12)
If @error Then Return SetError(@error, @extended, False)
Return $u[0]
EndFunc
Func _36($13, $14)
Local $0z = DllCall('kernel32.dll', 'bool', 'IsBadReadPtr', 'struct*', $13, 'uint_ptr', $14)
If @error Then Return SetError(@error, @extended, False)
Return $0z[0]
EndFunc
Func _38($13, $14)
Local $0z = DllCall('kernel32.dll', 'bool', 'IsBadWritePtr', 'struct*', $13, 'uint_ptr', $14)
If @error Then Return SetError(@error, @extended, False)
Return $0z[0]
EndFunc
Func _3b($15, $16, $14)
If _36($16, $14) Then Return SetError(10, @extended, 0)
If _38($15, $14) Then Return SetError(11, @extended, 0)
DllCall('ntdll.dll', 'none', 'RtlMoveMemory', 'struct*', $15, 'struct*', $16, 'ulong_ptr', $14)
If @error Then Return SetError(@error, @extended, 0)
Return 1
EndFunc
Func _4t($11)
Local $u = DllCall("gdi32.dll", "handle", "CreateCompatibleDC", "handle", $11)
If @error Then Return SetError(@error, @extended, 0)
Return $u[0]
EndFunc
Func _4u($11)
Local $u = DllCall("gdi32.dll", "bool", "DeleteDC", "handle", $11)
If @error Then Return SetError(@error, @extended, False)
Return $u[0]
EndFunc
Func _54($17)
Local $u = DllCall("user32.dll", "handle", "GetDC", "hwnd", $17)
If @error Then Return SetError(@error, @extended, 0)
Return $u[0]
EndFunc
Func _5a($17, $11)
Local $u = DllCall("user32.dll", "int", "ReleaseDC", "hwnd", $17, "handle", $11)
If @error Then Return SetError(@error, @extended, False)
Return $u[0]
EndFunc
Func _7t($11 = 0, $18 = 0)
Local $19 = DllCallbackRegister('_c5', 'bool', 'handle;handle;ptr;lparam')
Dim $p[101][2] = [[0]]
Local $0z = DllCall('user32.dll', 'bool', 'EnumDisplayMonitors', 'handle', $11, 'struct*', $18, 'ptr', DllCallbackGetPtr($19), 'lparam', 0)
If @error Or Not $0z[0] Or Not $p[0][0] Then
$p = @error + 10
EndIf
DllCallbackFree($19)
If $p Then Return SetError($p, 0, 0)
_n($p, -1)
Return $p
EndFunc
Func _92($18)
Local $u[4]
For $1a = 0 To 3
$u[$1a] = DllStructGetData($18, $1a + 1)
If @error Then Return SetError(@error, @extended, 0)
Next
For $1a = 2 To 3
$u[$1a] -= $u[$1a - 2]
Next
Return $u
EndFunc
Func _a1($17, $1b = 1)
Local $0z = DllCall('user32.dll', 'handle', 'MonitorFromWindow', 'hwnd', $17, 'dword', $1b)
If @error Then Return SetError(@error, @extended, 0)
Return $0z[0]
EndFunc
Func _c5($1c, $11, $1d, $1e)
#forceref $11, $1e
_n($p)
$p[$p[0][0]][0] = $1c
If Not $1d Then
$p[$p[0][0]][1] = 0
Else
$p[$p[0][0]][1] = DllStructCreate($j)
If Not _3b(DllStructGetPtr($p[$p[0][0]][1]), $1d, 16) Then Return 0
EndIf
Return 1
EndFunc
Global $1f = 0
Global $1g = 0
Global $1h = 0
Global $1i = 0
Global $1j = 0
Global $1k = True
Func _cp($1l, $1m, $1n = $h, $1o = 0, $1p = 0)
Local $u = DllCall($1g, "uint", "GdipCreateBitmapFromScan0", "int", $1l, "int", $1m, "int", $1o, "int", $1n, "struct*", $1p, "handle*", 0)
If @error Then Return SetError(@error, @extended, 0)
If $u[0] Then Return SetError(10, $u[0], 0)
Return $u[6]
EndFunc
Func _cr($1q, $1r = 0xFF000000)
Local $u = DllCall($1g, "int", "GdipCreateHBITMAPFromBitmap", "handle", $1q, "handle*", 0, "dword", $1r)
If @error Then Return SetError(@error, @extended, 0)
If $u[0] Then Return SetError(10, $u[0], 0)
Return $u[2]
EndFunc
Func _cs($1q)
Local $u = DllCall($1g, "int", "GdipDisposeImage", "handle", $1q)
If @error Then Return SetError(@error, @extended, False)
If $u[0] Then Return SetError(10, $u[0], False)
Return True
EndFunc
Func _d1($1r = 0xFF000000)
Local $u = DllCall($1g, "int", "GdipCreateSolidFill", "int", $1r, "handle*", 0)
If @error Then Return SetError(@error, @extended, 0)
If $u[0] Then Return SetError(10, $u[0], 0)
Return $u[2]
EndFunc
Func _d2($1s)
Local $u = DllCall($1g, "int", "GdipDeleteBrush", "handle", $1s)
If @error Then Return SetError(@error, @extended, False)
If $u[0] Then Return SetError(10, $u[0], False)
Return True
EndFunc
Func _dr($1t, $1u, $1v = 0, $1w = 3)
Local $u = DllCall($1g, "int", "GdipCreateFont", "handle", $1t, "float", $1u, "int", $1v, "int", $1w, "handle*", 0)
If @error Then Return SetError(@error, @extended, 0)
If $u[0] Then Return SetError(10, $u[0], 0)
Return $u[5]
EndFunc
Func _ds($1x)
Local $u = DllCall($1g, "int", "GdipDeleteFont", "handle", $1x)
If @error Then Return SetError(@error, @extended, False)
If $u[0] Then Return SetError(10, $u[0], False)
Return True
EndFunc
Func _dt($1y, $1z = 0)
Local $u = DllCall($1g, "int", "GdipCreateFontFamilyFromName", "wstr", $1y, "ptr", $1z, "handle*", 0)
If @error Then Return SetError(@error, @extended, 0)
If $u[0] Then Return SetError(10, $u[0], 0)
Return $u[3]
EndFunc
Func _dv($1t)
Local $u = DllCall($1g, "int", "GdipDeleteFontFamily", "handle", $1t)
If @error Then Return SetError(@error, @extended, False)
If $u[0] Then Return SetError(10, $u[0], False)
Return True
EndFunc
Func _e5($20, $1r = 0xFF000000)
Local $u = DllCall($1g, "int", "GdipGraphicsClear", "handle", $20, "dword", $1r)
If @error Then Return SetError(@error, @extended, False)
If $u[0] Then Return SetError(10, $u[0], False)
Return True
EndFunc
Func _e7($17)
Local $u = DllCall($1g, "int", "GdipCreateFromHWND", "hwnd", $17, "handle*", 0)
If @error Then Return SetError(@error, @extended, 0)
If $u[0] Then Return SetError(10, $u[0], 0)
Return $u[2]
EndFunc
Func _e8($20)
Local $u = DllCall($1g, "int", "GdipDeleteGraphics", "handle", $20)
If @error Then Return SetError(@error, @extended, False)
If $u[0] Then Return SetError(10, $u[0], False)
Return True
EndFunc
Func _ek($20, $21, $22, $23, $24, $25 = 0)
_kz($25)
Local $u = DllCall($1g, "int", "GdipDrawLine", "handle", $20, "handle", $25, "float", $21, "float", $22, "float", $23, "float", $24)
_l0()
If @error Then Return SetError(@error, @extended, False)
If $u[0] Then Return SetError(10, $u[0], False)
Return True
EndFunc
Func _eo($20, $26, $27, $28, $29, $25 = 0)
_kz($25)
Local $u = DllCall($1g, "int", "GdipDrawRectangle", "handle", $20, "handle", $25, "float", $26, "float", $27, "float", $28, "float", $29)
_l0()
If @error Then Return SetError(@error, @extended, False)
If $u[0] Then Return SetError(10, $u[0], False)
Return True
EndFunc
Func _eq($20, $2a, $1x, $2b, $2c, $1s)
Local $u = DllCall($1g, "int", "GdipDrawString", "handle", $20, "wstr", $2a, "int", -1, "handle", $1x, "struct*", $2b, "handle", $2c, "handle", $1s)
If @error Then Return SetError(@error, @extended, False)
If $u[0] Then Return SetError(10, $u[0], False)
Return True
EndFunc
Func _eu($20, $2d, $1s = 0)
_kv($1s)
Local $u = DllCall($1g, "int", "GdipFillPath", "handle", $20, "handle", $1s, "handle", $2d)
_kw()
If @error Then Return SetError(@error, @extended, False)
If $u[0] Then Return SetError(10, $u[0], False)
Return True
EndFunc
Func _ex($20, $26, $27, $28, $29, $1s = 0)
_kv($1s)
Local $u = DllCall($1g, "int", "GdipFillRectangle", "handle", $20, "handle", $1s, "float", $26, "float", $27, "float", $28, "float", $29)
_kw()
If @error Then Return SetError(@error, @extended, False)
If $u[0] Then Return SetError(10, $u[0], False)
Return True
EndFunc
Func _fl($20, $2e)
If $2e < 0 Or $2e > 5 Then $2e = 0
Local $u = DllCall($1g, "int", "GdipSetSmoothingMode", "handle", $20, "int", $2e)
If @error Then Return SetError(@error, @extended, False)
If $u[0] Then Return SetError(10, $u[0], False)
Return True
EndFunc
Func _fm($20, $2f)
Local $u = DllCall($1g, "int", "GdipSetTextRenderingHint", "handle", $20, "int", $2f)
If @error Then Return SetError(@error, @extended, False)
If $u[0] Then Return SetError(10, $u[0], False)
Return True
EndFunc
Func _g3($2g)
Local $u = DllCall($1g, "int", "GdipGetImageGraphicsContext", "handle", $2g, "handle*", 0)
If @error Then Return SetError(@error, @extended, 0)
If $u[0] Then Return SetError(10, $u[0], 0)
Return $u[2]
EndFunc
Func _g4($2g)
Local $u = DllCall($1g, "int", "GdipGetImageHeight", "handle", $2g, "uint*", 0)
If @error Then Return SetError(@error, @extended, -1)
If $u[0] Then Return SetError(10, $u[0], -1)
Return $u[2]
EndFunc
Func _gf($2g)
Local $u = DllCall($1g, "int", "GdipGetImageWidth", "handle", $2g, "uint*", -1)
If @error Then Return SetError(@error, @extended, -1)
If $u[0] Then Return SetError(10, $u[0], -1)
Return $u[2]
EndFunc
Func _gg($v)
Local $u = DllCall($1g, "int", "GdipLoadImageFromFile", "wstr", $v, "handle*", 0)
If @error Then Return SetError(@error, @extended, 0)
If $u[0] Then Return SetError(10, $u[0], 0)
Return $u[2]
EndFunc
Func _hl($2d, $26, $27, $28, $29, $2h, $2i)
Local $u = DllCall($1g, "int", "GdipAddPathArc", "handle", $2d, "float", $26, "float", $27, "float", $28, "float", $29, "float", $2h, "float", $2i)
If @error Then Return SetError(@error, @extended, False)
If $u[0] Then Return SetError(10, $u[0], False)
Return True
EndFunc
Func _im($2d)
Local $u = DllCall($1g, "int", "GdipClosePathFigure", "handle", $2d)
If @error Then Return SetError(@error, @extended, False)
If $u[0] Then Return SetError(10, $u[0], False)
Return True
EndFunc
Func _in($2j = 0)
Local $u = DllCall($1g, "int", "GdipCreatePath", "int", $2j, "handle*", 0)
If @error Then Return SetError(@error, @extended, 0)
If $u[0] Then Return SetError(10, $u[0], 0)
Return $u[2]
EndFunc
Func _ip($2d)
Local $u = DllCall($1g, "int", "GdipDeletePath", "handle", $2d)
If @error Then Return SetError(@error, @extended, False)
If $u[0] Then Return SetError(10, $u[0], False)
Return True
EndFunc
Func _je($1r = 0xFF000000, $28 = 1, $1w = 2)
Local $u = DllCall($1g, "int", "GdipCreatePen1", "dword", $1r, "float", $28, "int", $1w, "handle*", 0)
If @error Then Return SetError(@error, @extended, 0)
If $u[0] Then Return SetError(10, $u[0], 0)
Return $u[4]
EndFunc
Func _jg($25)
Local $u = DllCall($1g, "int", "GdipDeletePen", "handle", $25)
If @error Then Return SetError(@error, @extended, False)
If $u[0] Then Return SetError(10, $u[0], False)
Return True
EndFunc
Func _k5($26 = 0, $27 = 0, $28 = 0, $29 = 0)
Local $2k = DllStructCreate($l)
DllStructSetData($2k, "X", $26)
DllStructSetData($2k, "Y", $27)
DllStructSetData($2k, "Width", $28)
DllStructSetData($2k, "Height", $29)
Return $2k
EndFunc
Func _kk()
If $1g = 0 Then Return SetError(-1, -1, False)
$1i -= 1
If $1i = 0 Then
DllCall($1g, "none", "GdiplusShutdown", "ulong_ptr", $1j)
DllClose($1g)
$1g = 0
EndIf
Return True
EndFunc
Func _kl($2l = Default, $2m = False)
$1i += 1
If $1i > 1 Then Return True
If $2l = Default Then $2l = "gdiplus.dll"
$1g = DllOpen($2l)
If $1g = -1 Then
$1i = 0
Return SetError(1, 2, False)
EndIf
Local $2n = FileGetVersion($2l)
$2n = StringSplit($2n, ".")
If $2n[1] > 5 Then $1k = False
Local $2o = DllStructCreate($m)
Local $2p = DllStructCreate("ulong_ptr Data")
DllStructSetData($2o, "Version", 1)
Local $u = DllCall($1g, "int", "GdiplusStartup", "struct*", $2p, "struct*", $2o, "ptr", 0)
If @error Then Return SetError(@error, @extended, False)
If $u[0] Then Return SetError(10, $u[0], False)
$1j = DllStructGetData($2p, "Data")
If $2m Then Return $1g
Return SetExtended($2n[1], True)
EndFunc
Func _km($2q = 0, $2r = 0)
Local $u = DllCall($1g, "int", "GdipCreateStringFormat", "int", $2q, "word", $2r, "handle*", 0)
If @error Then Return SetError(@error, @extended, 0)
If $u[0] Then Return SetError(10, $u[0], 0)
Return $u[3]
EndFunc
Func _kn($2c)
Local $u = DllCall($1g, "int", "GdipDeleteStringFormat", "handle", $2c)
If @error Then Return SetError(@error, @extended, False)
If $u[0] Then Return SetError(10, $u[0], False)
Return True
EndFunc
Func _kp($2s, $1b)
Local $u = DllCall($1g, "int", "GdipSetStringFormatAlign", "handle", $2s, "int", $1b)
If @error Then Return SetError(@error, @extended, False)
If $u[0] Then Return SetError(10, $u[0], False)
Return True
EndFunc
Func _kq($2s, $2t)
Local $u = DllCall($1g, "int", "GdipSetStringFormatLineAlign", "handle", $2s, "int", $2t)
If @error Then Return SetError(@error, @extended, False)
If $u[0] Then Return SetError(10, $u[0], False)
Return True
EndFunc
Func _kv(ByRef $1s)
If $1s = 0 Then
$1f = _d1()
$1s = $1f
EndIf
EndFunc
Func _kw($2u = @error, $2v = @extended)
If $1f <> 0 Then
_d2($1f)
$1f = 0
EndIf
Return SetError($2u, $2v)
EndFunc
Func _kz(ByRef $25)
If $25 = 0 Then
$1h = _je()
$25 = $1h
EndIf
EndFunc
Func _l0($2u = @error, $2v = @extended)
If $1h <> 0 Then
_jg($1h)
$1h = 0
EndIf
Return SetError($2u, $2v)
EndFunc
Func _ls($17, $2w, $2x = 0, $1e = 0, $2y = 0, $2z = "wparam", $30 = "lparam", $31 = "lresult")
Local $u = DllCall("user32.dll", $31, "SendMessageW", "hwnd", $17, "uint", $2w, $2z, $2x, $30, $1e)
If @error Then Return SetError(@error, @extended, "")
If $2y >= 0 And $2y <= 4 Then Return $u[$2y]
Return $u
EndFunc
Func _m4($17)
Local $u = DllCall("user32.dll", "hwnd", "GetParent", "hwnd", $17)
If @error Then Return SetError(@error, @extended, 0)
Return $u[0]
EndFunc
Func _mn($17, $32, $33, $34, $35, $36, $37)
Local $u = DllCall("user32.dll", "bool", "SetWindowPos", "hwnd", $17, "hwnd", $32, "int", $33, "int", $34, "int", $35, "int", $36, "uint", $37)
If @error Then Return SetError(@error, @extended, False)
Return $u[0]
EndFunc
Func _mv($17, $37, $38 = 1000)
Local $0z = DllCall('user32.dll', 'bool', 'AnimateWindow', 'hwnd', $17, 'dword', $38, 'dword', $37)
If @error Then Return SetError(@error, @extended, False)
Return $0z[0]
EndFunc
Func _nx($17)
Local $39 = DllStructCreate($o)
DllStructSetData($39, "length", DllStructGetSize($39))
Local $0z = DllCall("user32.dll", "bool", "GetWindowPlacement", "hwnd", $17, "struct*", $39)
If @error Or Not $0z[0] Then Return SetError(@error + 10, @extended, 0)
Return $39
EndFunc
Func _oj($17, $39)
Local $u = DllCall("user32.dll", "bool", "SetWindowPlacement", "hwnd", $17, "struct*", $39)
If @error Then Return SetError(@error, @extended, False)
Return $u[0]
EndFunc
Func _oo($17, $3a, $3b, $3c, $3d, $3e, $3f, $3g, $37)
Local $u = DllCall("user32.dll", "bool", "UpdateLayeredWindow", "hwnd", $17, "handle", $3a, "struct*", $3b, "struct*", $3c, "handle", $3d, "struct*", $3e, "dword", $3f, "struct*", $3g, "dword", $37)
If @error Then Return SetError(@error, @extended, False)
Return $u[0]
EndFunc
Func _ps($t, $3h)
Local $3i = "str"
If IsNumber($3h) Then $3i = "word"
Local $u = DllCall("kernel32.dll", "ptr", "GetProcAddress", "handle", $t, $3i, $3h)
If @error Or Not $u[0] Then Return SetError(@error, @extended, 0)
Return $u[0]
EndFunc
Func _qv()
Local $u = DllCall("user32.dll", "bool", "ReleaseCapture")
If @error Then Return SetError(@error, @extended, False)
Return $u[0]
EndFunc
Func _qy($17)
Local $u = DllCall("user32.dll", "hwnd", "SetCapture", "hwnd", $17)
If @error Then Return SetError(@error, @extended, 0)
Return $u[0]
EndFunc
Global $3j[11]
Global Const $3k = "struct;uint Mask;int Item;int SubItem;uint State;uint StateMask;ptr Text;int TextMax;int Image;lparam Param;" & "int Indent;int GroupID;uint Columns;ptr pColumns;ptr piColFmt;int iGroup;endstruct"
#Au3Stripper_Ignore_Funcs=__ArrayDisplay_SortCallBack
Func __ArrayDisplay_SortCallBack($3l, $3m, $17)
If $3j[3] = $3j[4] Then
If Not $3j[7] Then
$3j[5] *= -1
$3j[7] = 1
EndIf
Else
$3j[7] = 1
EndIf
$3j[6] = $3j[3]
Local $3n = _ru($17, $3l, $3j[3])
Local $3o = _ru($17, $3m, $3j[3])
If $3j[8] = 1 Then
If(StringIsFloat($3n) Or StringIsInt($3n)) Then $3n = Number($3n)
If(StringIsFloat($3o) Or StringIsInt($3o)) Then $3o = Number($3o)
EndIf
Local $3p
If $3j[8] < 2 Then
$3p = 0
If $3n < $3o Then
$3p = -1
ElseIf $3n > $3o Then
$3p = 1
EndIf
Else
$3p = DllCall('shlwapi.dll', 'int', 'StrCmpLogicalW', 'wstr', $3n, 'wstr', $3o)[0]
EndIf
$3p = $3p * $3j[5]
Return $3p
EndFunc
Func _ru($17, $3q, $3r = 0)
Local $3s = DllStructCreate("wchar Text[4096]")
Local $3t = DllStructGetPtr($3s)
Local $3u = DllStructCreate($3k)
DllStructSetData($3u, "SubItem", $3r)
DllStructSetData($3u, "TextMax", 4096)
DllStructSetData($3u, "Text", $3t)
If IsHWnd($17) Then
DllCall("user32.dll", "lresult", "SendMessageW", "hwnd", $17, "uint", 0x1073, "wparam", $3q, "struct*", $3u)
Else
Local $3v = DllStructGetPtr($3u)
GUICtrlSendMsg($17, 0x1073, $3q, $3v)
EndIf
Return DllStructGetData($3s, "Text")
EndFunc
Global Const $3w = Ptr(-1)
Global Const $3x = Ptr(-1)
Global Const $3y = BitShift(0x0100, 8)
Global Const $3z = BitShift(0x2000, 8)
Global Const $40 = BitShift(0x8000, 8)
Func _v9($17, $2w, $2x, $1e)
Local $0z = DllCall('comctl32.dll', 'lresult', 'DefSubclassProc', 'hwnd', $17, 'uint', $2w, 'wparam', $2x, 'lparam', $1e)
If @error Then Return SetError(@error, @extended, 0)
Return $0z[0]
EndFunc
Func _vf($17, $41, $42)
Local $0z = DllCall('comctl32.dll', 'bool', 'RemoveWindowSubclass', 'hwnd', $17, 'ptr', $41, 'uint_ptr', $42)
If @error Then Return SetError(@error, @extended, False)
Return $0z[0]
EndFunc
Func _vh($17, $41, $42, $43 = 0)
Local $0z = DllCall('comctl32.dll', 'bool', 'SetWindowSubclass', 'hwnd', $17, 'ptr', $41, 'uint_ptr', $42, 'dword_ptr', $43)
If @error Then Return SetError(@error, @extended, 0)
Return $0z[0]
EndFunc
Local $44[0]
Local Const $45 = _c('comctl32.dll')
_13v($45 <> 0, 'This UDF requires comctl32.dll')
Local Const $46 = _ps($45, 'DefSubclassProc')
Local Const $47 = DllCallbackRegister('_13h', 'NONE', 'HWND;UINT;WPARAM;LPARAM;DWORD')
Local Const $48 = DllCallbackGetPtr($47)
OnAutoItExitRegister("_13u")
Local Const $49 = Call(@AutoItX64 ? '_cHvr_CSCP_X64' : '_cHvr_CSCP_X86')
Local Const $4a = DllCall('kernel32.dll', 'HANDLE', 'HeapCreate', 'DWORD', 0x00040000, 'ULONG_PTR', 0, 'ULONG_PTR', 0)[0]
_13v($4a <> 0, 'Failed to create executable heap object')
Local Const $4b = _13s(Call(@AutoItX64 ? '_cHvr_CSCP_X64' : '_cHvr_CSCP_X86'))
Func _13g($4c, $4d = '', $4e = '', $4f = '', $4g = '', $4h = 0,$4i = 0,$4j = '')
Local $17 = GUICtrlGetHandle($4c)
If(Not(IsHWnd($17))) Then Return SetError(1, 0, -1)
Local $4k = _13w($17)
Local $w[13]
$w[0] = $17
$w[1] = $4c
$w[3] = $4d
$w[4] = $4h
$w[5] = $4e
$w[6] = $4h
$w[7] = $4j
$w[8] = $4i
$w[9] = $4f
$w[10] = $4i
$w[11] = $4g
$w[12] = $4i
$44[$4k] = $w
_vh($17, $4b, $17, $4k)
Return $4k
EndFunc
Func _13h($17, $4l, $2x, $1e, $4m)
Switch $4l
Case 0x0200
GUISetCursor(2, 1)
_13j($44[$4m], $17, $4l, $2x, $1e)
Case 0x0201
_13i($44[$4m], $17, $4l, $2x, $1e)
Case 0x0202
_13k($44[$4m], $17, $4l, $2x, $1e)
Return False
Case 0x0203
_13l($44[$4m], $17, $4l, $2x, $1e)
Case 0x0204
_13m($44[$4m], $17, $4l, $2x, $1e)
Case 0x02A3
_13n($44[$4m], $17, $4l, $2x, $1e)
Case 0x0082
_13t($4m, $17)
EndSwitch
Return True
EndFunc
Func _13i(ByRef $4n, $17, $4l, ByRef $2x, ByRef $1e)
_qy($17)
_13o($4n, 9)
EndFunc
Func _13j(ByRef $4n, $17, $4l, ByRef $2x, ByRef $1e)
If(_13x() = $17) Then
Local $4o = _13q($17, $1e)
If Not $4n[2] Then
If $4o Then
$4n[2] = 1
_13o($4n, 9)
EndIf
Else
If Not $4o Then
$4n[2] = 0
_13o($4n, 3)
EndIf
EndIf
ElseIf Not $4n[2] Then
$4n[2] = 1
_13o($4n, 5)
Local $4p = DllStructCreate('DWORD;DWORD;HWND;DWORD')
DllStructSetData($4p, 1, DllStructGetSize($4p))
DllStructSetData($4p, 2, 2)
DllStructSetData($4p, 3, $17)
DllCall('user32.dll', 'BOOL', 'TrackMouseEvent', 'STRUCT*', $4p)
EndIf
EndFunc
Func _13k(ByRef $4n, $17, $4l, ByRef $2x, ByRef $1e)
Local $4q = _v9($17, $4l, $2x, $1e)
If(_13x() = $17) Then
_qv()
If _13q($17, $1e) Then
_13o($4n, 9)
EndIf
EndIf
Return $4q
EndFunc
Func _13l(ByRef $4n, $17, $4l, ByRef $2x, ByRef $1e)
_13o($4n, 11)
EndFunc
Func _13m(ByRef $4n, $17, $4l, ByRef $2x, ByRef $1e)
_13o($4n, 7)
EndFunc
Func _13n(ByRef $4n, $17, $4l, ByRef $2x, ByRef $1e)
$4n[2] = 0
_13o($4n, 3)
EndFunc
Func _13o(ByRef $4n, $4r)
Call($4n[$4r], $4n[1], $4n[$4r + 1])
EndFunc
Func _13p(ByRef $4s, Const $4t = Default, Const $4u = Default, Const $4v = Default, Const $4w = Default, Const $4x = Default)
While(UBound($4s) <($4s[0] + @NumParams))
ReDim $4s[UBound($4s) * 2]
WEnd
If Not($4t = Default) Then
$4s[0] += 1
$4s[$4s[0]] = $4t
EndIf
If Not($4u = Default) Then
$4s[0] += 1
$4s[$4s[0]] = $4u
EndIf
If Not($4v = Default) Then
$4s[0] += 1
$4s[$4s[0]] = $4v
EndIf
If Not($4w = Default) Then
$4s[0] += 1
$4s[$4s[0]] = $4w
EndIf
If Not($4x = Default) Then
$4s[0] += 1
$4s[$4s[0]] = $4x
EndIf
EndFunc
Func _13q($17, $1e)
Local $33 = BitShift(BitShift($1e, -16), 16)
Local $34 = BitShift($1e, 16)
Local $4y = WinGetClientSize($17)
Return Not($33 < 0 Or $34 < 0 Or $33 > $4y[0] Or $34 > $4y[1])
EndFunc
Func _cHvr_CSCP_X86()
Local $4z = 'align 1;'
Local $50[100]
$50[0] = 0
Local $51[5]
Local $52[5]
$4z &= 'BYTE;BYTE;BYTE;'
_13p($50, 0x55)
_13p($50, 0x8B, 0xEC)
$4z &= 'BYTE;'
_13p($50, 0x53)
$4z &= 'BYTE;BYTE;BYTE;'
_13p($50, 0x8B, 0x5D, 16)
$4z &= 'BYTE;'
_13p($50, 0x56)
$4z &= 'BYTE;BYTE;BYTE;'
_13p($50, 0x8B, 0x75, 12)
$4z &= 'BYTE;'
_13p($50, 0x57)
$4z &= 'BYTE;BYTE;BYTE;'
_13p($50, 0x8B, 0x7D, 20)
$4z &= 'BYTE;BYTE;DWORD;'
_13p($50, 0x81, 0xFE, 0x82)
$4z &= 'BYTE;BYTE;'
_13p($50, 0x74, 0)
$51[0] = DllStructGetSize(DllStructCreate($4z))
$52[0] = $50[0]
$4z &= 'BYTE;BYTE;DWORD;'
_13p($50, 0x81, 0xFE, 0x2A3)
$4z &= 'BYTE;BYTE;'
_13p($50, 0x74, 0)
$51[1] = DllStructGetSize(DllStructCreate($4z))
$52[1] = $50[0]
$4z &= 'BYTE;BYTE;BYTE;'
_13p($50, 0x8D, 0x86, -0x200)
$4z &= 'BYTE;BYTE;BYTE;'
_13p($50, 0x83, 0xF8, 3)
$4z &= 'BYTE;BYTE;'
_13p($50, 0x77, 0)
$51[2] = DllStructGetSize(DllStructCreate($4z))
$52[2] = $50[0]
$50[$52[0]] = $51[2] - $51[0]
$50[$52[1]] = $51[2] - $51[1]
$4z &= 'BYTE;BYTE;BYTE;'
_13p($50, 0x8B, 0x4D, 28)
$4z &= 'BYTE;BYTE;BYTE;'
_13p($50, 0x8B, 0x55, 8)
$4z &= 'BYTE;'
_13p($50, 0x51)
$4z &= 'BYTE;'
_13p($50, 0x57)
$4z &= 'BYTE;'
_13p($50, 0x53)
$4z &= 'BYTE;'
_13p($50, 0x56)
$4z &= 'BYTE;'
_13p($50, 0x52)
$4z &= 'BYTE;PTR;'
_13p($50, 0xB8, $48)
$4z &= 'BYTE;BYTE;'
_13p($50, 0xFF, 0xD0)
$4z &= 'BYTE;BYTE;'
_13p($50, 0x85, 0xC0)
$4z &= 'BYTE;BYTE;'
_13p($50, 0x74, 0)
$51[3] = DllStructGetSize(DllStructCreate($4z))
$52[3] = $50[0]
$50[$52[2]] = $51[3] - $51[2]
$4z &= 'BYTE;BYTE;BYTE;'
_13p($50, 0x8B, 0x45, 8)
$4z &= 'BYTE;'
_13p($50, 0x57)
$4z &= 'BYTE;'
_13p($50, 0x53)
$4z &= 'BYTE;'
_13p($50, 0x56)
$4z &= 'BYTE;'
_13p($50, 0x50)
$4z &= 'BYTE;PTR;'
_13p($50, 0xB8, $46)
$4z &= 'BYTE;BYTE;'
_13p($50, 0xFF, 0xD0)
$51[4] = DllStructGetSize(DllStructCreate($4z))
$50[$52[3]] = $51[4] - $51[3]
$4z &= 'BYTE;BYTE;BYTE;'
_13p($50, 0x5F)
_13p($50, 0x5E)
_13p($50, 0x5B)
$4z &= 'BYTE;BYTE;BYTE;WORD'
_13p($50, 0x5D)
_13p($50, 0xC2, 24)
Return _13r($4z, $50)
EndFunc
Func _cHvr_CSCP_X64()
Local $4z = 'align 1;'
Local $50[100]
$50[0] = 0
Local $51[5]
Local $52[5]
$4z &= 'BYTE;BYTE;DWORD;'
_13p($50, 0x81, 0xFA, 0x82)
$4z &= 'BYTE;BYTE;'
_13p($50, 0x74, 0)
$51[0] = DllStructGetSize(DllStructCreate($4z))
$52[0] = $50[0]
$4z &= 'BYTE;BYTE;DWORD;'
_13p($50, 0x81, 0xFA, 0x2A3)
$4z &= 'BYTE;BYTE;'
_13p($50, 0x74, 0)
$51[1] = DllStructGetSize(DllStructCreate($4z))
$52[1] = $50[0]
$4z &= 'BYTE;BYTE;DWORD;'
_13p($50, 0x8D, 0x82, -0x200)
$4z &= 'BYTE;BYTE;BYTE;'
_13p($50, 0x83, 0xF8, 3)
$4z &= 'BYTE;BYTE;'
_13p($50, 0x77, 0)
$51[2] = DllStructGetSize(DllStructCreate($4z))
$52[2] = $50[0]
$50[$52[0]] = $51[2] - $51[0]
$50[$52[1]] = $51[2] - $51[1]
$4z &= 'BYTE;BYTE;BYTE;BYTE;BYTE;'
_13p($50, 0x48, 0x89, 0x5C, 0x24, 8)
$4z &= 'BYTE;BYTE;BYTE;BYTE;BYTE;'
_13p($50, 0x48, 0x89, 0x6C, 0x24, 16)
$4z &= 'BYTE;BYTE;BYTE;BYTE;BYTE;'
_13p($50, 0x48, 0x89, 0x74, 0x24, 24)
$4z &= 'BYTE;'
_13p($50, 0x57)
$4z &= 'BYTE;BYTE;BYTE;BYTE;'
_13p($50, 0x48, 0x83, 0xEC, 48)
$4z &= 'BYTE;BYTE;BYTE;'
_13p($50, 0x49, 0x8B, 0xF9)
$4z &= 'BYTE;BYTE;BYTE;'
_13p($50, 0x49, 0x8B, 0xF0)
$4z &= 'BYTE;BYTE;'
_13p($50, 0x8B, 0xDA)
$4z &= 'BYTE;BYTE;BYTE;'
_13p($50, 0x48, 0x8B, 0xE9)
$4z &= 'BYTE;BYTE;BYTE;BYTE;BYTE;'
_13p($50, 0x48, 0x8B, 0x44, 0x24, 104)
$4z &= 'BYTE;BYTE;BYTE;BYTE;BYTE;'
_13p($50, 0x48, 0x89, 0x44, 0x24, 32)
$4z &= 'BYTE;BYTE;PTR;'
_13p($50, 0x48, 0xB8, $48)
$4z &= 'BYTE;BYTE;'
_13p($50, 0xFF, 0xD0)
$4z &= 'BYTE;BYTE;BYTE;'
_13p($50, 0x48, 0x85, 0xC0)
$4z &= 'BYTE;BYTE;'
_13p($50, 0x74, 0)
$51[3] = DllStructGetSize(DllStructCreate($4z))
$52[3] = $50[0]
$4z &= 'BYTE;BYTE;BYTE;'
_13p($50, 0x4C, 0x8B, 0xCF)
$4z &= 'BYTE;BYTE;BYTE;'
_13p($50, 0x4C, 0x8B, 0xC6)
$4z &= 'BYTE;BYTE;'
_13p($50, 0x8B, 0xD3)
$4z &= 'BYTE;BYTE;BYTE;'
_13p($50, 0x48, 0x8B, 0xCD)
$50[$52[3]] = DllStructGetSize(DllStructCreate($4z)) - $51[3]
$4z &= 'BYTE;BYTE;BYTE;BYTE;BYTE;'
_13p($50, 0x48, 0x8B, 0x5C, 0x24, 64)
$4z &= 'BYTE;BYTE;BYTE;BYTE;BYTE;'
_13p($50, 0x48, 0x8B, 0x6C, 0x24, 72)
$4z &= 'BYTE;BYTE;BYTE;BYTE;BYTE;'
_13p($50, 0x48, 0x8B, 0x74, 0x24, 80)
$4z &= 'BYTE;BYTE;BYTE;BYTE;'
_13p($50, 0x48, 0x83, 0xc4, 48)
$4z &= 'BYTE;'
_13p($50, 0x5F)
$4z &= 'BYTE;BYTE;BYTE;'
_13p($50, 0x48, 0x85, 0xC0)
$4z &= 'BYTE;BYTE;'
_13p($50, 0x74, 0)
$51[4] = DllStructGetSize(DllStructCreate($4z))
$52[4] = $50[0]
$50[$52[2]] = DllStructGetSize(DllStructCreate($4z)) - $51[2]
$4z &= 'BYTE;BYTE;PTR;'
_13p($50, 0x48, 0xB8, $46)
$4z &= 'BYTE;BYTE;'
_13p($50, 0xFF, 0xE0)
$50[$52[4]] = DllStructGetSize(DllStructCreate($4z)) - $51[4]
$4z &= 'BYTE;'
_13p($50, 0xC3)
Return _13r($4z, $50)
EndFunc
Func _13r(ByRef $4z, ByRef $50)
Local $53 = DllStructCreate($4z)
_13v(@error = 0, 'DllStrucCreate Failed With Error = ' & @error)
For $1a = 1 To $50[0]
DllStructSetData($53, $1a, $50[$1a])
Next
Return $53
EndFunc
Func _13s($53)
Local $54 = DllCall('kernel32.dll', 'PTR', 'HeapAlloc', 'HANDLE', $4a, 'DWORD', 8, 'ULONG_PTR', DllStructGetSize($53))[0]
_13v($54 <> 0, 'Allocate memory failed')
DllCall("kernel32.dll", "none", "RtlMoveMemory", "PTR", $54, "PTR", DllStructGetPtr($53), "ULONG_PTR", DllStructGetSize($53))
_13v(@error = 0, 'Failed to copy memory')
Return $54
EndFunc
Func _13t($4m, $17)
_vf($17, $4b, $17)
Local $w=$44[$4m]
$44[$4m] = 0
Call( "_iControlDelete",$w[1])
EndFunc
Func _13u()
DllCallbackFree($47)
_5($45)
If($4a <> 0) Then
If($4b <> 0) Then
DllCall('kernel32.dll', 'BOOL', 'HeapFree', 'HANDLE', $4a, 'DWORD', 0, 'PTR', $4b)
EndIf
DllCall('kernel32.dll', 'BOOL', 'HeapDestroy', 'HANDLE', $4a)
EndIf
EndFunc
Func _13v($55, $56 = '', $57 = @ScriptName, $58 = @ScriptFullPath, $59 = @ScriptLineNumber, $5a = @error, $5b = @extended)
If(Not($55)) Then
MsgBox(BitOR(1, 0x10), 'Assertion Error!', @CRLF & 'Script' & @TAB & ': ' & $57 & @CRLF & 'Path' & @TAB & ': ' & $58 & @CRLF & 'Line' & @TAB & ': ' & $59 & @CRLF & 'Error' & @TAB & ': ' &($5a > 0x7FFF ? Hex($5a) : $5a) &($5b <> 0 ? '  (Extended : ' &($5b > 0x7FFF ? Hex($5b) : $5b) & ')' : '') & @CRLF & 'Message' & @TAB & ': ' & $56 & @CRLF & @CRLF & 'OK: Exit Script' & @TAB & 'Cancel: Continue')
Exit
EndIf
EndFunc
Func _13w($17)
For $1a = 0 To UBound($44) - 1 Step +1
If Not IsArray($44[$1a]) Then
Return $1a
EndIf
Next
ReDim $44[UBound($44) + 1]
Return UBound($44) - 1
EndFunc
Func _13x()
Return DllCall("user32.dll", "HWND", "GetCapture")[0]
EndFunc
_kl()
Opt("WinWaitDelay", 0)
Global $5c = _15c()[2], $5d = _15j()
Global $5e[0], $5f[0]
Global $5g = Number(29 * $5d, 1) + Number(10 * $5d, 1)
Global Const $5h = DllCallbackRegister('_15l', 'lresult', 'hwnd;uint;wparam;lparam;uint_ptr;dword_ptr')
Global Const $5i = DllCallbackGetPtr($5h)
OnAutoItExitRegister('_15m')
Global Const $5j = 4 * $5d
Global $5k = False
Global $5l = True
Global $5m = False
If Opt("GUIOnEventMode", 0) Then
Opt("GUIOnEventMode", 1)
$5m = True
EndIf
Func _13y($5n, $5o, $5p, $5q = -1, $5r = -1, $5s = True, $5t = "")
Local $5u
If $5k Then
$5o = Round($5o * $5d)
$5p = Round($5p * $5d)
EndIf
Local $5v
If $5s Then
DllCall("uxtheme.dll", "none", "SetThemeAppProperties", "int", 0)
$5u = GUICreate($5n, $5o, $5p, $5q, $5r, BitOR(0x00040000, 0x00020000, 0x00010000), -1, $5t)
$5v = _13z($5u, True, True, $5o, $5p)
DllCall("uxtheme.dll", "none", "SetThemeAppProperties", "int", BitOR(1, 2, 4))
Else
DllCall("uxtheme.dll", "none", "SetThemeAppProperties", "int", 0)
$5u = GUICreate($5n, $5o, $5p, $5q, $5r, -1, -1, $5t)
$5v = _13z($5u, True, False, $5o, $5p)
DllCall("uxtheme.dll", "none", "SetThemeAppProperties", "int", BitOR(1, 2, 4))
EndIf
_vh($5u, $5i, 1010, $5v)
WinMove($5u, "", Default, Default, $5o, $5p)
If Not $5t Then
Local $5w = _15n($5u)
If($5q = -1) And($5r = -1) Then
WinMove($5u, "",($5w[2] - $5o) / 2,($5w[3] - $5p) / 2, $5o, $5p)
EndIf
Else
If($5q = -1) And($5r = -1) Then
Local $5x = _15i($5t, $5o, $5p)
WinMove($5u, "", $5x[0], $5x[1], $5o, $5p)
EndIf
EndIf
GUISetBkColor($0)
_15h($5u, $5o, $5p, $2)
Return($5u)
EndFunc
Func _13z($5y, $5z = True, $5s = False, $60 = "", $61 = "")
Local $62
For $63 = 0 To UBound($5f) - 1 Step +1
If $5f[$63][0] = $5y Then
$62 = $63
ExitLoop
EndIf
Next
If($62 == "") Then
$62 = UBound($5f)
ReDim $5f[$62 + 1][16]
EndIf
$5f[$62][0] = $5y
$5f[$62][1] = $5z
$5f[$62][2] = $5s
If $5s Then
If $60 = "" Then
$60 = WinGetPos($5y, "")
If @error Then
$60 = 80 * $5d
Else
$60 = $60[2]
EndIf
EndIf
If $61 = "" Then
$61 = WinGetPos($5y, "")
If @error Then
$61 = 50 * $5d
Else
$61 = $61[3]
EndIf
EndIf
$5f[$62][3] = $60
$5f[$62][4] = $61
EndIf
Return $62
EndFunc
Func _140($64)
GUISetState(@SW_HIDE, $64)
_vf($64, $5i, 1010)
GUIDelete($64)
Local $65[0]
For $66 = 0 To UBound($5f) - 1 Step +1
If $5f[$66][0] <> $64 Then
ReDim $65[UBound($65) + 1][16]
For $67 = 0 To 11 Step +1
$65[UBound($65) - 1][$67] = $5f[$66][$67]
Next
EndIf
Next
$5f = $65
EndFunc
Func _iControlDelete($68)
For $1a = 0 To UBound($5e) - 1
If $5e[$1a][0] = $68 Then
Switch($5e[$1a][3])
Case "5", "7"
_2l($5e[$1a][5])
_2l($5e[$1a][6])
_2l($5e[$1a][7])
_2l($5e[$1a][8])
Case "6"
_2l($5e[$1a][5])
_2l($5e[$1a][6])
_2l($5e[$1a][7])
_2l($5e[$1a][8])
_2l($5e[$1a][9])
_2l($5e[$1a][10])
_2l($5e[$1a][11])
_2l($5e[$1a][12])
_2l($5e[$1a][13])
_2l($5e[$1a][14])
Case Else
_2l($5e[$1a][5])
_2l($5e[$1a][6])
EndSwitch
For $69 = 0 To UBound($5e, 2) - 1
$5e[$1a][$69] = ""
Next
ExitLoop
EndIf
Next
EndFunc
Func _141($6a = True, $6b = True, $6c = True, $6d = False, $6e = False, $6f = $0, $6g = $1, $6h = 2)
Local $6i[5]
$6i[0] = $6a
$6i[1] = $6b
$6i[2] = $6c
$6i[3] = $6d
$6i[4] = $6e
$6f = "0xFF" & Hex($6f, 6)
$6g = "0xFF" & Hex($6g, 6)
Return _149($6i, $6f, $6g, False, $6h)
EndFunc
Func _142($6j = True)
$5k = $6j
EndFunc
Func _144($5y)
GUISetState(@SW_SHOW, $5y)
Local $62 = _15o($5y)
If($62 == "") Then
ConsoleWrite("Fullscreen-Toggle failed: GUI not registered. Not created with _Metro_CreateGUI ?" & @CRLF)
Return SetError(1)
EndIf
If Not $5f[$62][2] Then
ConsoleWrite("Fullscreen-Toggle failed: GUI is not registered for resizing. Please use _Metro_SetGUIOption to enable resizing." & @CRLF)
Return SetError(2)
EndIf
Local $6k = WinGetState($5y)
Local $6l = _nx($5y)
Local $6m = _15n($5y, True)
Local $6n = WinGetPos($5y)
Local $6o = _15k("3", $5y)
Local $6p = _15k("4", $5y)
Local $6d = _15k("9", $5y)
Local $6q = _15k("10", $5y)
If $5f[$62][11] Then
$5f[$62][11] = False
If(BitAND($5f[$62][9], 32) = 32) Then
GUISetState(@SW_MAXIMIZE)
$6l = $5f[$62][10]
DllStructSetData($6l, "rcNormalPosition", $5f[$62][5], 1)
DllStructSetData($6l, "rcNormalPosition", $5f[$62][6], 2)
DllStructSetData($6l, "rcNormalPosition", $5f[$62][7], 3)
DllStructSetData($6l, "rcNormalPosition", $5f[$62][8], 4)
_oj($5y, $6l)
If $6o Then
GUICtrlSetState($6o, 32)
GUICtrlSetState($6p, 16)
EndIf
Else
WinMove($5y, "", $5f[$62][5], $5f[$62][6], $5f[$62][7], $5f[$62][8])
If $6o Then
GUICtrlSetState($6p, 32)
GUICtrlSetState($6o, 16)
EndIf
EndIf
GUICtrlSetState($6q, 32)
GUICtrlSetState($6d, 16)
Else
If(BitAND($6k, 32) = 32) Then
$6n[0] = DllStructGetData($6l, "rcNormalPosition", 1)
$6n[1] = DllStructGetData($6l, "rcNormalPosition", 2)
$6n[2] = DllStructGetData($6l, "rcNormalPosition", 3)
$6n[3] = DllStructGetData($6l, "rcNormalPosition", 4)
DllStructSetData($6l, "rcNormalPosition", $6m[0], 1)
DllStructSetData($6l, "rcNormalPosition", $6m[1], 2)
DllStructSetData($6l, "rcNormalPosition", $6m[0] + $6m[2], 3)
DllStructSetData($6l, "rcNormalPosition", $6m[1] + $6m[3], 4)
_oj($5y, $6l)
Sleep(50)
$5f[$62][10] = $6l
GUISetState(@SW_RESTORE)
Else
Sleep(50)
WinMove($5y, "", $6m[0], $6m[1], $6m[2], $6m[3])
EndIf
$5f[$62][11] = True
GUICtrlSetState($6d, 32)
If $6o Then
GUICtrlSetState($6o, 32)
GUICtrlSetState($6p, 32)
EndIf
GUICtrlSetState($6q, 16)
$5f[$62][5] = $6n[0]
$5f[$62][6] = $6n[1]
$5f[$62][7] = $6n[2]
$5f[$62][8] = $6n[3]
$5f[$62][9] = $6k
WinActivate("[CLASS:Shell_TrayWnd]")
WinActivate($5y)
EndIf
EndFunc
Func _149($6i, $6f = $0, $6g = "0xFFFFFF", $6r = False, $6h = 2)
Local $6s = _159()
Local $6t = Round(1 * $6s), $6u
If StringInStr($6, "Light") Then
$6u = StringReplace(_15f($6f, -20), "0x", "0xFF")
Else
$6u = StringReplace(_15f($6f, +20), "0x", "0xFF")
EndIf
Local $25 = _je($6g, Round(1 * $6s))
Local $6v = _je($6g, Round(1 * $6s))
Local $6w = _je("0xFFFFFFFF", Round(1 * $6s))
If StringInStr($6, "Light") Then
Local $6x = _je(StringReplace(_15f($6g, +90), "0x", "0xFF"), $6t)
Else
Local $6x = _je(StringReplace(_15f($6g, -80), "0x", "0xFF"), $6t)
EndIf
Local $6y = _je(StringReplace(_15f("0xFFFFFF", -80), "0x", "0xFF"), $6t)
If $6f <> 0 Then
$6f = "0xFF" & Hex($6f, 6)
EndIf
Local $1s = _d1($6f), $6z = _d1($6u)
Local $70[16]
Local $71[16]
Local $72[16]
Local $73[16]
Local $74[16]
Local $75[16]
Local $76[16]
Local $77[16]
Local $78 = Number(45 * $6s, 1)
Local $79 = Number(29 * $6s, 1)
Local $7a = Number($6h * $6s, 1)
Local $7b = _158()
Local $7c = WinGetPos($7b)
Local $7d = 0
If $6i[0] Then
$7d = $7d + 1
$71[0] = GUICtrlCreatePic("", $7c[2] - $7a -($78 * $7d), $7a, $78, $79)
$71[1] = False
$71[2] = False
$71[3] = "0"
$71[15] = $7b
EndIf
If $6i[1] Then
$7d = $7d + 1
$73[0] = GUICtrlCreatePic("", $7c[2] - $7a -($78 * $7d), $7a, $78, $79)
$73[1] = False
$73[2] = False
$73[3] = "3"
$73[8] = True
$73[15] = $7b
$74[0] = GUICtrlCreatePic("", $7c[2] - $7a -($78 * $7d), $7a, $78, $79)
$74[1] = False
$74[2] = False
$74[3] = "4"
$74[8] = True
$74[15] = $7b
If $6i[3] Then
$77[0] = GUICtrlCreatePic("", $7c[2] - $7a -($78 * $7d), $7a, $78, $79)
$77[1] = False
$77[2] = False
$77[3] = "10"
$77[15] = $7b
EndIf
EndIf
If $6i[2] Then
$7d = $7d + 1
$72[0] = GUICtrlCreatePic("", $7c[2] - $7a -($78 * $7d), $7a, $78, $79)
$72[1] = False
$72[2] = False
$72[3] = "0"
$72[15] = $7b
EndIf
If $6i[3] Then
$7d = $7d + 1
$76[0] = GUICtrlCreatePic("", $7c[2] - $7a -($78 * $7d), $7a, $78, $79)
$76[1] = False
$76[2] = False
$76[3] = "9"
$76[15] = $7b
If $77[15] <> $7b Then
$77[0] = GUICtrlCreatePic("", $7c[2] - $7a -($78 * $7d), $7a, $78, $79)
$77[1] = False
$77[2] = False
$77[3] = "10"
$77[15] = $7b
EndIf
EndIf
If $6i[4] Then
$75[0] = GUICtrlCreatePic("", $7a, $7a, $78, $79)
$75[1] = False
$75[2] = False
$75[3] = "8"
$75[15] = $7b
EndIf
If $6i[0] Then
Local $7e = _156($78, $79, $6f, 4, 4), $7f = _156($78, $79, "0xFFE81123", 4, 4), $7g = _156($78, $79, $6f, 4, 4)
EndIf
If $6i[1] Then
Local $7h = _156($78, $79, $6f, 0, 4), $7i = _156($78, $79, $6u, 0, 4), $7j = _156($78, $79, $6f, 0, 4)
Local $7k = _156($78, $79, $6f, 0, 4), $7l = _156($78, $79, $6u, 0, 4), $7m = _156($78, $79, $6f, 0, 4)
EndIf
If $6i[2] Then
Local $7n = _156($78, $79, $6f, 0, 4), $7o = _156($78, $79, $6u, 0, 4), $7p = _156($78, $79, $6f, 0, 4)
EndIf
If $6i[3] Then
Local $7q = _156($78, $79, $6f, 0, 4), $7r = _156($78, $79, $6u, 0, 4), $7s = _156($78, $79, $6f, 0, 4)
Local $7t = _156($78, $79, $6f, 0, 4), $7u = _156($78, $79, $6u, 0, 4), $7v = _156($78, $79, $6f, 0, 4)
EndIf
If $6i[4] Then
Local $7w = _156($78, $79, $6f, 0, 4), $7x = _156($78, $79, $6u, 0, 4), $7y = _156($78, $79, $6f, 0, 4)
EndIf
If $6r Then
_e5($7e[0], "0xFFB52231")
_e5($7g[0], "0xFFB52231")
EndIf
If $6i[0] Then
If $6r Then
_ek($7e[0], 17 * $6s, 9 * $6s, 27 * $6s, 19 * $6s, $6w)
_ek($7e[0], 27 * $6s, 9 * $6s, 17 * $6s, 19 * $6s, $6w)
_ek($7g[0], 17 * $6s, 9 * $6s, 27 * $6s, 19 * $6s, $6y)
_ek($7g[0], 27 * $6s, 9 * $6s, 17 * $6s, 19 * $6s, $6y)
Else
_ek($7e[0], 17 * $6s, 9 * $6s, 27 * $6s, 19 * $6s, $25)
_ek($7e[0], 27 * $6s, 9 * $6s, 17 * $6s, 19 * $6s, $25)
_ek($7g[0], 17 * $6s, 9 * $6s, 27 * $6s, 19 * $6s, $6x)
_ek($7g[0], 27 * $6s, 9 * $6s, 17 * $6s, 19 * $6s, $6x)
EndIf
_ek($7f[0], 17 * $6s, 9 * $6s, 27 * $6s, 19 * $6s, $6w)
_ek($7f[0], 27 * $6s, 9 * $6s, 17 * $6s, 19 * $6s, $6w)
EndIf
If $6i[1] Then
_eo($7h[0], Round(17 * $6s), 9 * $6s, 9 * $6s, 9 * $6s, $25)
_eo($7i[0], Round(17 * $6s), 9 * $6s, 9 * $6s, 9 * $6s, $6v)
_eo($7j[0], Round(17 * $6s), 9 * $6s, 9 * $6s, 9 * $6s, $6x)
Local $7z = Round(7 * $6s), $80 = Round(2 * $6s)
_eo($7k[0], Round(17 * $6s) + $80,(11 * $6s) - $80, $7z, $7z, $25)
_ex($7k[0], Round(17 * $6s), 11 * $6s, $7z, $7z, $1s)
_eo($7k[0], Round(17 * $6s), 11 * $6s, $7z, $7z, $25)
_eo($7l[0], Round(17 * $6s) + $80,(11 * $6s) - $80, $7z, $7z, $6v)
_ex($7l[0], Round(17 * $6s), 11 * $6s, $7z, $7z, $6z)
_eo($7l[0], Round(17 * $6s), 11 * $6s, $7z, $7z, $6v)
_eo($7m[0], Round(17 * $6s) + $80,(11 * $6s) - $80, $7z, $7z, $6x)
_ex($7m[0], Round(17 * $6s), 11 * $6s, $7z, $7z, $1s)
_eo($7m[0], Round(17 * $6s), 11 * $6s, $7z, $7z, $6x)
EndIf
If $6i[2] Then
_ek($7n[0], 18 * $6s, 14 * $6s, 27 * $6s, 14 * $6s, $25)
_ek($7o[0], 18 * $6s, 14 * $6s, 27 * $6s, 14 * $6s, $6v)
_ek($7p[0], 18 * $6s, 14 * $6s, 27 * $6s, 14 * $6s, $6x)
EndIf
If $6i[3] Then
Local $81 =($6t * 0.3)
Local $82[2], $83
$82[0] = Round($78 / 2.9)
$82[1] = Round($79 / 1.5)
$83 = _15a($82[0], $82[1], 135, $78 / 2.5)
$83[0] = Round($83[0])
$83[1] = Round($83[1])
Local $84 = _15a($82[0] + $81, $82[1] + $81, 180, 5 * $6s)
Local $85 = _15a($82[0] - $81, $82[1] - $81, 90, 5 * $6s)
_ek($7q[0], $82[0] + $81, $82[1] + $81, $84[0], $84[1], $25)
_ek($7q[0], $82[0] - $81, $82[1] - $81, $85[0], $85[1], $25)
_ek($7r[0], $82[0] + $81, $82[1] + $81, $84[0], $84[1], $25)
_ek($7r[0], $82[0] - $81, $82[1] - $81, $85[0], $85[1], $25)
_ek($7s[0], $82[0] + $81, $82[1] + $81, $84[0], $84[1], $6x)
_ek($7s[0], $82[0] - $81, $82[1] - $81, $85[0], $85[1], $6x)
$84 = _15a($83[0] + $81, $83[1] + $81, 270, 5 * $6s)
$85 = _15a($83[0] - $81, $83[1] - $81, 0, 5 * $6s)
_ek($7q[0], $83[0] + $81, $83[1] + $81, $84[0], $84[1], $25)
_ek($7q[0], $83[0] - $81, $83[1] - $81, $85[0], $85[1], $25)
_ek($7r[0], $83[0] + $81, $83[1] + $81, $84[0], $84[1], $25)
_ek($7r[0], $83[0] - $81, $83[1] - $81, $85[0], $85[1], $25)
_ek($7s[0], $83[0] + $81, $83[1] + $81, $84[0], $84[1], $6x)
_ek($7s[0], $83[0] - $81, $83[1] - $81, $85[0], $85[1], $6x)
_ek($7q[0], $82[0] + $81, $82[1] - $81, $83[0], $83[1], $25)
_ek($7r[0], $82[0] + $81, $82[1] - $81, $83[0], $83[1], $25)
_ek($7s[0], $82[0] + $81, $82[1] - $81, $83[0], $83[1], $6x)
$81 =($6t * 0.3)
Local $86 = Round($78 / 2, 0), $87 = Round($79 / 2.35, 0)
$84 = _15a($86 - $81, $87 - $81, 90, 4 * $6s)
$85 = _15a($86 + $81, $87 + $81, 180, 4 * $6s)
Local $88 = _15a($86 + $81, $87 - $81, 135, 8 * $6s)
_ek($7t[0], $86 - $81, $87 - $81, $84[0], $84[1], $25)
_ek($7t[0], $86 + $81, $87 + $81, $85[0], $85[1], $25)
_ek($7u[0], $86 - $81, $87 - $81, $84[0], $84[1], $25)
_ek($7u[0], $86 + $81, $87 + $81, $85[0], $85[1], $25)
_ek($7v[0], $86 - $81, $87 - $81, $84[0], $84[1], $6x)
_ek($7v[0], $86 + $81, $87 + $81, $85[0], $85[1], $6x)
$81 =($6t * 0.3)
Local $89 = Round($78 / 2.2, 0), $8a = Round($79 / 2, 0)
$84 = _15a($89 - $81, $8a - $81, 360, 4 * $6s)
$85 = _15a($89 + $81, $8a + $81, 270, 4 * $6s)
Local $8b = _15a($89 - $81, $8a + $81, 315, 8 * $6s)
_ek($7t[0], $89 - $81, $8a - $81, $84[0], $84[1], $25)
_ek($7t[0], $89 + $81, $8a + $81, $85[0], $85[1], $25)
_ek($7u[0], $89 - $81, $8a - $81, $84[0], $84[1], $25)
_ek($7u[0], $89 + $81, $8a + $81, $85[0], $85[1], $25)
_ek($7v[0], $89 - $81, $8a - $81, $84[0], $84[1], $6x)
_ek($7v[0], $89 + $81, $8a + $81, $85[0], $85[1], $6x)
_ek($7t[0], $89 - $81, $8a + $81, $8b[0] + $81, $8b[1] - $81, $25)
_ek($7t[0], $86 + $81, $87 - $81, $88[0] - $81, $88[1] + $81, $25)
_ek($7u[0], $89 - $81, $8a + $81, $8b[0] + $81, $8b[1] - $81, $25)
_ek($7u[0], $86 + $81, $87 - $81, $88[0] - $81, $88[1] + $81, $25)
_ek($7v[0], $89 - $81, $8a + $81, $8b[0] + $81, $8b[1] - $81, $6x)
_ek($7v[0], $86 + $81, $87 - $81, $88[0] - $81, $88[1] + $81, $6x)
EndIf
If $6i[4] Then
_ek($7w[0], $78 / 3, $79 / 2.9,($78 / 3) * 2, $79 / 2.9, $25)
_ek($7w[0], $78 / 3, $79 / 2.9 +($6t * 4),($78 / 3) * 2, $79 / 2.9 +($6t * 4), $25)
_ek($7w[0], $78 / 3, $79 / 2.9 +($6t * 8),($78 / 3) * 2, $79 / 2.9 +($6t * 8), $25)
_ek($7x[0], $78 / 3, $79 / 2.9,($78 / 3) * 2, $79 / 2.9, $25)
_ek($7x[0], $78 / 3, $79 / 2.9 +($6t * 4),($78 / 3) * 2, $79 / 2.9 +($6t * 4), $25)
_ek($7x[0], $78 / 3, $79 / 2.9 +($6t * 8),($78 / 3) * 2, $79 / 2.9 +($6t * 8), $25)
_ek($7y[0], $78 / 3, $79 / 2.9,($78 / 3) * 2, $79 / 2.9, $6x)
_ek($7y[0], $78 / 3, $79 / 2.9 +($6t * 4),($78 / 3) * 2, $79 / 2.9 +($6t * 4), $6x)
_ek($7y[0], $78 / 3, $79 / 2.9 +($6t * 8),($78 / 3) * 2, $79 / 2.9 +($6t * 8), $6x)
EndIf
_jg($25)
_jg($6v)
_jg($6w)
_jg($6x)
_jg($6y)
_d2($1s)
_d2($6z)
If $6i[0] Then
$71[5] = _157($71[0], $7e)
$71[6] = _157($71[0], $7f, False)
$71[7] = _157($71[0], $7g, False)
GUICtrlSetResizing($71[0], 768 + 32 + 4)
$70[0] = $71[0]
_13g($71[0], "_iHoverOff", "_iHoverOn", '', "", _155($71), $7b)
EndIf
If $6i[1] Then
$73[5] = _157($73[0], $7h)
$73[6] = _157($73[0], $7i, False)
$73[7] = _157($73[0], $7j, False)
$74[5] = _157($74[0], $7k)
$74[6] = _157($74[0], $7l, False)
$74[7] = _157($74[0], $7m, False)
GUICtrlSetResizing($73[0], 768 + 32 + 4)
GUICtrlSetResizing($74[0], 768 + 32 + 4)
$70[1] = $73[0]
$70[2] = $74[0]
GUICtrlSetState($74[0], 32)
_13g($73[0], "_iHoverOff", "_iHoverOn", "", "", _155($73), $7b)
_13g($74[0], "_iHoverOff", "_iHoverOn", "", "", _155($74), $7b)
EndIf
If $6i[2] Then
$72[5] = _157($72[0], $7n)
$72[6] = _157($72[0], $7o, False)
$72[7] = _157($72[0], $7p, False)
GUICtrlSetResizing($72[0], 768 + 32 + 4)
$70[3] = $72[0]
_13g($72[0], "_iHoverOff", "_iHoverOn", "", "", _155($72), $7b)
EndIf
If $6i[3] Then
$76[5] = _157($76[0], $7q)
$76[6] = _157($76[0], $7r, False)
$76[7] = _157($76[0], $7s, False)
$77[5] = _157($77[0], $7t)
$77[6] = _157($77[0], $7u, False)
$77[7] = _157($77[0], $7v, False)
GUICtrlSetResizing($76[0], 768 + 32 + 4)
GUICtrlSetResizing($77[0], 768 + 32 + 4)
GUICtrlSetState($77[0], 32)
$70[4] = $76[0]
$70[5] = $77[0]
_13g($76[0], "_iHoverOff", "_iHoverOn", "_iFullscreenToggleBtn", "", _155($76), $7b)
_13g($77[0], "_iHoverOff", "_iHoverOn", "_iFullscreenToggleBtn", "", _155($77), $7b)
EndIf
If $6i[4] Then
$75[5] = _157($75[0], $7w)
$75[6] = _157($75[0], $7x, False)
$75[7] = _157($75[0], $7y, False)
GUICtrlSetResizing($75[0], 768 + 32 + 2)
$70[6] = $75[0]
_13g($75[0], "_iHoverOff", "_iHoverOn", "", "", _155($75), $7b)
EndIf
Return $70
EndFunc
Func _14d($8c, $5q, $5r, $5o, $5p, $8d = $3, $8e = $4, $8f = "Arial", $8g = 10, $8h = 1, $8i = "0xFFFFFF")
Local $8j[16]
Local $8k = _159()
If $5k Then
$5q = Round($5q * $5d)
$5r = Round($5r * $5d)
$5o = Round($5o * $5d)
$5p = Round($5p * $5d)
Else
$8g =($8g / $5c)
EndIf
$8j[1] = False
$8j[3] = "2"
$8j[15] = _158()
If StringInStr($6, "Light") Then
Local $8l = _15f($8e, 7)
Else
Local $8l = _15f($8e, -15)
EndIf
$8d = "0xFF" & Hex($8d, 6)
$8e = "0xFF" & Hex($8e, 6)
$8l = "0xFF" & Hex($8l, 6)
$8i = "0xFF" & Hex($8i, 6)
Local $8m = _d1($8e)
Local $8n = _d1($8l)
Local $8o = _d1(StringReplace(_15f($8e, -30), "0x", "0xFF"))
Local $8p = _156($5o, $5p, StringReplace($0, "0x", "0xFF"), 5, 5)
Local $8q = _156($5o, $5p, StringReplace($0, "0x", "0xFF"), 5, 5)
Local $8r = _156($5o, $5p, StringReplace($0, "0x", "0xFF"), 5, 5)
Local $8s = 3, $8t =($8s / 2) * $5d
Local $1l = $5o -($8t * 2), $1m = $5p -($8t * 2)
Local $2d = _in()
_hl($2d, $8t + $1l -($8s * 2), $8t, $8s * 2, $8s * 2, 270, 90)
_hl($2d, $8t + $1l -($8s * 2), $8t + $1m -($8s * 2), $8s * 2, $8s * 2, 0, 90)
_hl($2d, $8t, $8t + $1m -($8s * 2), $8s * 2, $8s * 2, 90, 90)
_hl($2d, $8t, $8t, $8s * 2, $8s * 2, 180, 90)
_im($2d)
Local $1s = _d1($8d)
Local $8u = _d1(StringReplace(_15f($8d, +25), "0x", "0xFF"))
_eu($8p[0], $2d, $1s)
_eu($8q[0], $2d, $8u)
_eu($8r[0], $2d, $1s)
Local $2c = _km(), $1t = _dt($8f), $1x = _dr($1t, $8g, $8h)
Local $2b = _k5(0, 0, $5o, $5p)
_kp($2c, 1)
_kq($2c, 1)
_eq($8p[0], $8c, $1x, $2b, $2c, $8n)
_eq($8q[0], $8c, $1x, $2b, $2c, $8m)
_eq($8r[0], $8c, $1x, $2b, $2c, $8o)
_ds($1x)
_dv($1t)
_kn($2c)
_d2($8m)
_d2($8n)
_d2($8o)
_d2($1s)
_d2($8u)
_ip($2d)
$8j[0] = GUICtrlCreatePic("", $5q, $5r, $5o, $5p)
$8j[5] = _157($8j[0], $8p)
$8j[6] = _157($8j[0], $8q, False)
$8j[7] = _157($8j[0], $8r, False)
GUICtrlSetResizing($8j[0], 768)
_13g($8j[0], "_iHoverOff", "_iHoverOn", "", "", _155($8j))
Return $8j[0]
EndFunc
Func _155($8v)
Local $8w
For $1a = 0 To UBound($5e) - 1 Step +1
If $5e[$1a][0] = "" Then
$8w = $1a
ExitLoop
EndIf
Next
If $8w == "" Then
$8w = UBound($5e)
ReDim $5e[$8w + 1][16]
EndIf
For $1a = 0 To 15
$5e[$8w][$1a] = $8v[$1a]
Next
Return $8w
EndFunc
Func _156($8x, $8y, $8z = 0, $90 = 4, $91 = 0)
Local $92[2]
$92[1] = _cp($8x, $8y, $h)
$92[0] = _g3($92[1])
_fl($92[0], $90)
_fm($92[0], $91)
If $8z <> 0 Then _e5($92[0], $8z)
Return $92
EndFunc
Func _157($93, $92, $94 = True)
Local $95 = _cr($92[1])
If $94 Then _2l(GUICtrlSendMsg($93, 0x0172, 0, $95))
_e8($92[0])
_cs($92[1])
Return $95
EndFunc
Func _158()
Local $96 = GUICtrlCreateLabel("", 0, 0, 0, 0)
Local $97 = _m4(GUICtrlGetHandle($96))
GUICtrlDelete($96)
Return $97
EndFunc
Func _159()
If $5k Then
Return $5d
Else
Return 1
EndIf
EndFunc
Func _15a($98, $99, $9a, $9b)
Local $9c[2]
$9c[0] = $98 +($9b * Sin($9a / 180 * 3.14159265358979))
$9c[1] = $99 +($9b * Cos($9a / 180 * 3.14159265358979))
Return $9c
EndFunc
Func _15c()
Local $9d[3]
Local $9e, $9f, $9g = 90, $17 = 0
Local $11 = DllCall("user32.dll", "long", "GetDC", "long", $17)
Local $0z = DllCall("gdi32.dll", "long", "GetDeviceCaps", "long", $11[0], "long", $9g)
$11 = DllCall("user32.dll", "long", "ReleaseDC", "long", $17, "long", $11)
$9e = $0z[0]
Select
Case $9e = 0
$9e = 96
$9f = 94
Case $9e < 84
$9f = $9e / 105
Case $9e < 121
$9f = $9e / 96
Case $9e < 145
$9f = $9e / 95
Case Else
$9f = $9e / 94
EndSelect
$9d[0] = 2
$9d[1] = $9e
$9d[2] = $9f
Return $9d
EndFunc
Func _15f($9h, $9i, $9j = 7)
Local $9k = $9i *(BitAND(1, $9j) <> 0) + BitAND($9h, 0xff0000) / 0x10000
Local $9l = $9i *(BitAND(2, $9j) <> 0) + BitAND($9h, 0x00ff00) / 0x100
Local $9m = $9i *(BitAND(4, $9j) <> 0) + BitAND($9h, 0x0000FF)
Return "0x" & Hex(String(_15g($9k) * 0x10000 + _15g($9l) * 0x100 + _15g($9m)), 6)
EndFunc
Func _15g($9n)
If $9n > 255 Then Return 255
If $9n < 0 Then Return 0
Return $9n
EndFunc
Func _15h($5y, $9o, $9p, $9q = 0xFFFFFF)
Local $9r, $9s, $9t, $9u
Local $5v = _15o($5y)
$9t = GUICtrlCreateLabel("", 0, 0, $9o, 1)
GUICtrlSetColor(-1, $9q)
GUICtrlSetBkColor(-1, $9q)
GUICtrlSetResizing(-1, 544)
GUICtrlSetState(-1, 128)
$9u = GUICtrlCreateLabel("", 0, $9p - 1, $9o, 1)
GUICtrlSetColor(-1, $9q)
GUICtrlSetBkColor(-1, $9q)
GUICtrlSetResizing(-1, 576)
GUICtrlSetState(-1, 128)
$9r = GUICtrlCreateLabel("", 0, 1, 1, $9p - 1)
GUICtrlSetColor(-1, $9q)
GUICtrlSetBkColor(-1, $9q)
GUICtrlSetResizing(-1, 256 + 2)
GUICtrlSetState(-1, 128)
$9s = GUICtrlCreateLabel("", $9o - 1, 1, 1, $9p - 1)
GUICtrlSetColor(-1, $9q)
GUICtrlSetBkColor(-1, $9q)
GUICtrlSetResizing(-1, 256 + 4)
GUICtrlSetState(-1, 128)
If $5v <> "" Then
$5f[$5v][12] = $9t
$5f[$5v][13] = $9u
$5f[$5v][14] = $9r
$5f[$5v][15] = $9s
EndIf
EndFunc
Func _15i($9v, $9w, $9x)
Local $9y[2]
$9y[0] = "-1"
$9y[1] = "-1"
Local $7c = WinGetPos($9v)
If Not @error Then
$9y[0] =($7c[0] +(($7c[2] - $9w) / 2))
$9y[1] =($7c[1] +(($7c[3] - $9x) / 2))
EndIf
Return $9y
EndFunc
Func _15j($9z = 96)
_kl()
Local $a0 = _e7(0)
If @error Then Return SetError(1, @extended, 0)
Local $u
#forcedef $1g, $a1
$u = DllCall($1g, "int", "GdipGetDpiX", "handle", $a0, "float*", 0)
If @error Then Return SetError(2, @extended, 0)
Local $9e = $u[2]
_e8($a0)
_kk()
Return $9e / $9z
EndFunc
Func _iHoverOn($4c, $a2)
Switch $5e[$a2][3]
Case 5, 7
If $5e[$a2][2] Then
_2l(GUICtrlSendMsg($5e[$a2][0], 0x0172, 0, $5e[$a2][8]))
Else
_2l(GUICtrlSendMsg($5e[$a2][0], 0x0172, 0, $5e[$a2][6]))
EndIf
Case "6"
If $5e[$a2][2] Then
_2l(GUICtrlSendMsg($5e[$a2][0], 0x0172, 0, $5e[$a2][14]))
Else
_2l(GUICtrlSendMsg($5e[$a2][0], 0x0172, 0, $5e[$a2][13]))
EndIf
Case Else
_2l(GUICtrlSendMsg($4c, 0x0172, 0, $5e[$a2][6]))
EndSwitch
EndFunc
Func _iHoverOff($4c, $a2)
Switch $5e[$a2][3]
Case 0, 3, 4, 8, 9, 10
If WinActive($5e[$a2][15]) Then
_2l(GUICtrlSendMsg($4c, 0x0172, 0, $5e[$a2][5]))
Else
_2l(GUICtrlSendMsg($4c, 0x0172, 0, $5e[$a2][7]))
EndIf
Case 5, 7
If $5e[$a2][2] Then
_2l(GUICtrlSendMsg($5e[$a2][0], 0x0172, 0, $5e[$a2][7]))
Else
_2l(GUICtrlSendMsg($5e[$a2][0], 0x0172, 0, $5e[$a2][5]))
EndIf
Case "6"
If $5e[$a2][2] Then
_2l(GUICtrlSendMsg($5e[$a2][0], 0x0172, 0, $5e[$a2][12]))
Else
_2l(GUICtrlSendMsg($5e[$a2][0], 0x0172, 0, $5e[$a2][5]))
EndIf
Case Else
_2l(GUICtrlSendMsg($4c, 0x0172, 0, $5e[$a2][5]))
EndSwitch
EndFunc
Func _15k($a3, $17)
For $1a = 0 To UBound($5e) - 1
If($a3 = $5e[$1a][3]) And($17 = $5e[$1a][15]) Then Return $5e[$1a][0]
Next
Return False
EndFunc
Func _15l($17, $2w, $2x, $1e, $a4, $5v)
Switch $2w
Case 0x00AF, 0x0085, 0x00AE, 0x0083, 0x0086
Return -1
Case 0x031A
DllCall("uxtheme.dll", "none", "SetThemeAppProperties", "int", BitOR(2, 4))
_mn($17, 0, 0, 0, 0, 0, 0x0020 + 0x0002 + 0x0001 + 0x0008)
DllCall("uxtheme.dll", "none", "SetThemeAppProperties", "int", BitOR(1, 2, 4))
Return 0
Case 0x0005
If Not $5f[$5v][11] Then
Switch $2x
Case 2
Local $a5 = _15n($17)
Local $a6 = WinGetPos($17)
WinMove($17, "", $a6[0] - 1, $a6[1] - 1, $a5[2], $a5[3])
For $a7 = 0 To UBound($5e) - 1
If $17 = $5e[$a7][15] Then
Switch $5e[$a7][3]
Case 3
GUICtrlSetState($5e[$a7][0], 32)
$5e[$a7][8] = False
Case 4
GUICtrlSetState($5e[$a7][0], 16)
$5e[$a7][8] = True
EndSwitch
EndIf
Next
Case 0
For $a7 = 0 To UBound($5e) - 1
If $17 = $5e[$a7][15] Then
Switch $5e[$a7][3]
Case 3
If Not $5e[$a7][8] Then
GUICtrlSetState($5e[$a7][0], 16)
$5e[$a7][8] = True
EndIf
Case 4
If $5e[$a7][8] Then
GUICtrlSetState($5e[$a7][0], 32)
$5e[$a7][8] = False
EndIf
EndSwitch
EndIf
Next
EndSwitch
EndIf
Case 0x0024
Local $a8 = DllStructCreate("int;int;int;int;int;int;int;int;int;dword", $1e)
Local $a9 = _15n($17)
DllStructSetData($a8, 3, $a9[2])
DllStructSetData($a8, 4, $a9[3])
DllStructSetData($a8, 5, $a9[0] + 1)
DllStructSetData($a8, 6, $a9[1] + 1)
DllStructSetData($a8, 7, $5f[$5v][3])
DllStructSetData($a8, 8, $5f[$5v][4])
Case 0x0084
If $5f[$5v][2] And Not $5f[$5v][11] Then
Local $aa = 0, $ab = 0, $ac
Local $a6 = WinGetPos($17)
Local $ad = GUIGetCursorInfo($17)
If Not @error Then
If $ad[0] < $5j Then $aa = 1
If $ad[0] > $a6[2] - $5j Then $aa = 2
If $ad[1] < $5j Then $ab = 3
If $ad[1] > $a6[3] - $5j Then $ab = 6
$ac = $aa + $ab
Else
$ac = 0
EndIf
If WinGetState($17) <> 47 Then
Local $ae = 2, $af = 2
Switch $ac
Case 1
$af = 13
$ae = 10
Case 2
$af = 13
$ae = 11
Case 3
$af = 11
$ae = 12
Case 4
$af = 12
$ae = 13
Case 5
$af = 10
$ae = 14
Case 6
$af = 11
$ae = 15
Case 7
$af = 10
$ae = 16
Case 8
$af = 12
$ae = 17
EndSwitch
GUISetCursor($af, 1)
If $ae <> 2 Then Return $ae
EndIf
If Abs(BitAND(BitShift($1e, 16), 0xFFFF) - $a6[1]) <(28 * $5d) Then Return 2
EndIf
Case 0x0201
If $5f[$5v][1] And Not $5f[$5v][11] And Not(WinGetState($17) = 47) Then
Local $ag = GUIGetCursorInfo($17)
If($ag[4] = 0) Then
DllCall("user32.dll", "int", "ReleaseCapture")
DllCall("user32.dll", "long", "SendMessageA", "hwnd", $17, "int", 0x00A1, "int", 2, "int", 0)
Return 0
EndIf
EndIf
Case 0x001C
For $a7 = 0 To UBound($5e) - 1
Switch $5e[$a7][3]
Case 0, 3, 4, 8, 9, 10
If $2x Then
_2l(GUICtrlSendMsg($5e[$a7][0], 0x0172, 0, $5e[$a7][5]))
Else
_2l(GUICtrlSendMsg($5e[$a7][0], 0x0172, 0, $5e[$a7][7]))
EndIf
EndSwitch
Next
Case 0x0020
If MouseGetCursor() <> 2 Then
Local $ad = GUIGetCursorInfo($17)
If Not @error And $ad[4] <> 0 Then
Local $aa = 0, $ab = 0, $ac = 0
Local $a6 = WinGetPos($17)
If $ad[0] < $5j Then $aa = 1
If $ad[0] > $a6[2] - $5j Then $aa = 2
If $ad[1] < $5j Then $ab = 3
If $ad[1] > $a6[3] - $5j Then $ab = 6
$ac = $aa + $ab
If $ac = 0 Then
If $ad[4] <> $5f[$5v][12] And $ad[4] <> $5f[$5v][13] And $ad[4] <> $5f[$5v][14] And $ad[4] <> $5f[$5v][15] Then
GUISetCursor(2, 0, $17)
EndIf
EndIf
EndIf
EndIf
EndSwitch
Return DllCall("comctl32.dll", "lresult", "DefSubclassProc", "hwnd", $17, "uint", $2w, "wparam", $2x, "lparam", $1e)[0]
EndFunc
Func _15m()
For $66 = 0 To UBound($5f) - 1 Step +1
_140($5f[$66][0])
Next
DllCallbackFree($5h)
_kk()
EndFunc
Func _15n($17, $ah = False)
Local $ai[4], $aj = 1
$ai[0] = 0
$ai[1] = 0
$ai[2] = @DesktopWidth
$ai[3] = @DesktopHeight
Local $ak, $al = _7t()
If @error Then Return $ai
ReDim $al[$al[0][0] + 1][5]
For $1a = 1 To $al[0][0]
$ak = _92($al[$1a][1])
For $am = 0 To 3
$al[$1a][$am + 1] = $ak[$am]
Next
Next
Local $an = _a1($17)
Local $ao = _a1(WinGetHandle("[CLASS:Shell_TrayWnd]"))
For $ap = 1 To $al[0][0] Step +1
If $al[$ap][0] = $an Then
If $ah Then
$ai[0] = $al[$ap][1]
$ai[1] = $al[$ap][2]
Else
$ai[0] = 0
$ai[1] = 0
EndIf
$ai[2] = $al[$ap][3]
$ai[3] = $al[$ap][4]
$aj = $ap
EndIf
Next
Local $aq = DllCall("shell32.dll", "int", "SHAppBarMessage", "int", 0x00000004, "ptr*", 0)
If Not @error Then
$aq = $aq[0]
Else
$aq = 0
EndIf
If $ao = $an Then
Local $ar = WinGetPos("[CLASS:Shell_TrayWnd]")
If @error Then Return $ai
If $ah Then Return $ai
If($ar[0] = $al[$aj][1] - 2) Or($ar[1] = $al[$aj][2] - 2) Then
$ar[0] += 2
$ar[1] += 2
$ar[2] -= 4
$ar[3] -= 4
EndIf
If $ar[2] = $ai[2] Then
If $aq = 1 Then
If($ar[1] > 0) Then
$ai[3] -= 1
Else
$ai[1] += 1
$ai[3] -= 1
EndIf
Return $ai
EndIf
$ai[3] = $ai[3] - $ar[3]
If($ar[0] = $al[$aj][1]) And($ar[1] = $al[$aj][2]) Then $ai[1] = $ar[3]
Else
If $aq = 1 Then
If($ar[0] > 0) Then
$ai[2] -= 1
Else
$ai[0] += 1
$ai[2] -= 1
EndIf
Return $ai
EndIf
$ai[2] = $ai[2] - $ar[2]
If($ar[0] = $al[$aj][1]) And($ar[1] = $al[$aj][2]) Then $ai[0] = $ar[2]
EndIf
EndIf
Return $ai
EndFunc
Func _15o($5y)
For $as = 0 To UBound($5f) - 1
If $5f[$as][0] = $5y Then
Return $as
EndIf
Next
Return SetError(1, 0, "")
EndFunc
Func _iFullscreenToggleBtn($4c, $17)
If $5l Then _144($17)
EndFunc
Global Const $at = 0X400
Global Const $au = $at + 10
Global Const $av = DllOpen("kernel32.dll")
Global Const $aw = DllOpen("user32.dll")
Global Const $ax = DllOpen("gdi32.dll")
Global Const $ay = DllOpen("comctl32.dll")
Global Const $az = DllOpen("ole32.dll")
Global Const $b0 = DllOpen("gdiplus.dll")
Global $b1 = ";"
Func _15y($b2, $b3, $b4, $b5, $1l = Default, $1m = Default, $b6 = Default, $b7 = Default, $b8 = 0)
If $1l = -1 Then $1l = Default
If $1m = -1 Then $1m = Default
Local $a2
If IsBinary($b2) Then
$a2 = $b2
Else
If $b3 Then
Local $w = StringSplit($b3, ";", 2)
If UBound($w) < 3 Then ReDim $w[3]
$a2 = _17n($b2, $w[0], $w[1], $w[2])
If @error Then
$a2 = $b2
Else
If $w[0] = 2 Then $a2 = _17o($a2)
EndIf
Else
$a2 = $b2
EndIf
EndIf
Local $b9, $ba
If Not IsKeyword($b9) = 1 Then $b9 = $1l
If Not IsKeyword($ba) = 1 Then $ba = $1m
Local $bb = _16g($a2, $b9, $ba, $b8, $b4, $b5, $b7)
If @error Then
$a2 = FileRead($a2)
$bb = _16g($a2, $b9, $ba, $b8, $b4, $b5, $b7)
If @error Then
$bb = _16g(Binary($b2), $b9, $ba, $b8, $b4, $b5, $b7)
If @error Then Return SetError(1, @extended = True, 0)
EndIf
EndIf
Local $bc = DllStructCreate("handle GIFThread;" & "ptr CodeBuffer;" & "hwnd ControlHandle;" & "handle ImageList;" & "bool ExitFlag;" & "bool Transparent;" & "dword CurrentFrame;" & "dword NumberOfFrames;", $bb)
Local $bd = DllStructGetData($bc, "NumberOfFrames")
$bc = DllStructCreate("handle GIFThread;" & "ptr CodeBuffer;" & "hwnd ControlHandle;" & "handle ImageList;" & "bool ExitFlag;" & "bool Transparent;" & "dword CurrentFrame;" & "dword NumberOfFrames;" & "dword FrameDelay[" & $bd & "];", $bb)
GUICtrlSetResizing($b8, 802)
DllStructSetData($bc, "ControlHandle", GUICtrlGetHandle($b8))
If $bd = 1 Then
$b1 &= $b8 & "|" & $bb & ";"
Return SetExtended(1, $b8)
EndIf
Local $be = 157
If @AutoItX64 Then $be = 220
Local $bf = _17c($be, 64)
If @error Then Return SetError(2, 0, $b8)
DllStructSetData($bc, "CodeBuffer", $bf)
_165($bf, $be, 64)
If @error Then Return SetError(3, 0, $b8)
Local $bg = DllStructCreate("byte[" & $be & "]", $bf)
Local $bh = _166(_167("comctl32.dll"), "ImageList_DrawEx")
If @error Then Return SetError(4, 1, $b8)
Local $bi = _166(_167("kernel32.dll"), "Sleep")
If @error Then Return SetError(4, 2, $b8)
Local $bj = _166(_167("gdi32.dll"), "GetPixel")
If @error Then Return SetError(4, 3, $b8)
Local $bk = _167("user32.dll")
Local $bl = _166($bk, "GetDC")
If @error Then Return SetError(4, 4, $b8)
Local $bm = _166($bk, "ReleaseDC")
If @error Then Return SetError(4, 5, $b8)
Local $bn = DllStructGetData($bc, "ImageList")
Local $68 = DllStructGetData($bc, "ControlHandle")
Local $1v
If $b6 = Default Then
$1v = 1
If DllStructGetData($bc, "Transparent") Then $1v = 0
Else
$1v = $b6
EndIf
If @AutoItX64 Then
DllStructSetData($bg, 1, "0x" & "4883EC" & _17p(88, 1) & "" & "4831F6" & "" & "" & "8BC6" & "A3" & _17p(DllStructGetPtr($bc, "CurrentFrame"), 8) & "" & "48B9" & _17p($68, 8) & "48B8" & _17p($bl, 8) & "FFD0" & "" & "4889C3" & "" & "49C7C0" & _17p(0, 4) & "BA" & _17p(0, 4) & "4889C1" & "48B8" & _17p($bj, 8) & "FFD0" & "" & "3D" & _17p(-1, 4) & "75" & _17p(2, 1) & "8BC7" & "" & "8BF8" & "" & "89442438" & "B8" & _17p($1v, 4) & "89442448" & "4989D8" & "49C7C1" & _17p(0, 4) & "89F2" & "48B9" & _17p($bn, 8) & "" & "48B8" & _17p($bh, 8) & "FFD0" & "" & "4889DA" & "48B9" & _17p($68, 8) & "48B8" & _17p($bm, 8) & "FFD0" & "" & "A1" & _17p(DllStructGetPtr($bc, "ExitFlag"), 8) & "85C0" & "75" & _17p(46, 1) & "" & "48BB" & _17p(DllStructGetPtr($bc, "FrameDelay"), 8) & "488B0CB3" & "48B8" & _17p($bi, 8) & "FFD0" & "" & "FFC6" & "" & "81FE" & _17p($bd, 4) & "" & "74" & _17p(5, 1) & "E9" & _17p(-200, 4) & "E9" & _17p(-208, 4) & "" & "4831C0" & "4883C4" & _17p(88, 1) & "C3" )
Else
DllStructSetData($bg, 1, "0x" & "" & "33F6" & "" & "" & "8BC6" & "A3" & _17p(DllStructGetPtr($bc, "CurrentFrame"), 4) & "68" & _17p($1v, 4) & "68" & _17p(-1, 4) & "" & "68" & _17p($68, 4) & "B8" & _17p($bl, 4) & "FFD0" & "" & "8BD8" & "" & "68" & _17p(0, 4) & "68" & _17p(0, 4) & "53" & "B8" & _17p($bj, 4) & "FFD0" & "" & "3D" & _17p(-1, 4) & "75" & _17p(2, 1) & "8BC7" & "" & "8BF8" & "" & "50" & "68" & _17p(0, 4) & "68" & _17p(0, 4) & "68" & _17p(0, 4) & "68" & _17p(0, 4) & "53" & "56" & "68" & _17p($bn, 4) & "" & "B8" & _17p($bh, 4) & "FFD0" & "" & "53" & "68" & _17p($68, 4) & "B8" & _17p($bm, 4) & "FFD0" & "" & "A1" & _17p(DllStructGetPtr($bc, "ExitFlag"), 4) & "85C0" & "75" & _17p(35, 1) & "" & "BB" & _17p(DllStructGetPtr($bc, "FrameDelay"), 4) & "8B0CB3" & "51" & "B8" & _17p($bi, 4) & "FFD0" & "" & "46" & "" & "81FE" & _17p($bd, 4) & "" & "74" & _17p(5, 1) & "E9" & _17p(-147, 4) & "E9" & _17p(-154, 4) & "" & "33C0" & "C3" )
EndIf
Local $bo = _162($bf)
If @error Then Return SetError(5, 0, $b8)
DllStructSetData($bc, "GIFThread", $bo)
_16b(_16f($68))
$b1 &= $b8 & "|" & $bb & ";"
Return $b8
EndFunc
Func _162($13)
Local $bp = DllCall($av, "handle", "CreateThread", "ptr", 0, "dword_ptr", 0, "ptr", $13, "ptr", 0, "dword", 0, "dword*", 0)
If @error Or Not $bp[0] Then Return SetError(1, 0, 0)
Return $bp[0]
EndFunc
Func _165($13, $bq, $br)
Local $bp = DllCall($av, "bool", "VirtualProtect", "ptr", $13, "dword_ptr", $bq, "dword", $br, "dword*", 0)
If @error Or Not $bp[0] Then Return SetError(1, 0, 0)
Return 1
EndFunc
Func _166($t, $bs)
Local $3i = "str"
If IsNumber($bs) Then $3i = "int"
Local $bp = DllCall($av, "ptr", "GetProcAddress", "handle", $t, $3i, $bs)
If @error Or Not $bp[0] Then Return SetError(1, 0, 0)
Return $bp[0]
EndFunc
Func _167($bt = 0)
Local $3i = "wstr"
If Not $bt Then $3i = "ptr"
Local $bp = DllCall($av, "ptr", "GetModuleHandleW", $3i, $bt)
If @error Or Not $bp[0] Then Return SetError(1, 0, 0)
Return $bp[0]
EndFunc
Func _16b($17, $1d = 0, $bu = True)
Local $bp = DllCall($aw, "bool", "InvalidateRect", "hwnd", $17, "ptr", $1d, "bool", $bu)
If @error Or Not $bp[0] Then Return SetError(1, 0, 0)
Return 1
EndFunc
Func _16f($17)
Local $bp = DllCall($aw, "hwnd", "GetParent", "hwnd", $17)
If @error Or Not $bp[0] Then Return SetError(1, 0, 0)
Return $bp[0]
EndFunc
Func _16g($bv, ByRef $1l, ByRef $1m, ByRef $b8, $b4 = 0, $b5 = 0, $1r = Default)
If $1r = Default Then $1r = 0xFF000000
Local $bw
Local $bx
Local $by, $bz, $c0
If IsBinary($bv) Then
$by = _16q($bw, $bx, $bv, $bz, $c0)
Else
$by = _16p($bw, $bv, $bz, $c0)
EndIf
If @error Then
Local $c1 = @error
_17b($by, $bw, $bx)
Return SetError(1, $c1, 0)
EndIf
Local $c2
If $1l = Default Then
$1l = $bz
Else
$c2 = True
EndIf
If $1m = Default Then
$1m = $c0
Else
$c2 = True
EndIf
Local $c3 = _16w($by)
If @error Then
_17b($by, $bw, $bx)
Return SetError(2, 0, 0)
EndIf
Local $c4 = DllStructCreate("dword;word;word;byte[8]")
Local $c5 = DllStructGetPtr($c4)
_16x($by, $c5, $c3)
If @error Then
_17b($by, $bw, $bx)
Return SetError(3, 0, 0)
EndIf
Local $bd = _16y($by, $c5)
If @error Then
_17b($by, $bw, $bx)
Return SetError(4, 0, 0)
EndIf
Local $bb = _17c(4 *(8 + 4 * @AutoItX64 + $bd), 64)
If @error Then
_17b($by, $bw, $bx)
Return SetError(3, 0, 0)
EndIf
Local $bc = DllStructCreate("handle GIFThread;" & "ptr CodeBuffer;" & "hwnd ControlHandle;" & "handle ImageList;" & "bool ExitFlag;" & "bool Transparent;" & "dword CurrentFrame;" & "dword NumberOfFrames;" & "dword FrameDelay[" & $bd & "];", $bb)
DllStructSetData($bc, "GIFThread", 0)
DllStructSetData($bc, "ControlHandle", 0)
DllStructSetData($bc, "ExitFlag", 0)
DllStructSetData($bc, "CurrentFrame", 0)
DllStructSetData($bc, "NumberOfFrames", $bd)
Local $c6 = False
If Not $b8 Then
$c6 = True
$b8 = GUICtrlCreatePic("", $b4, $b5, $1l, $1m)
EndIf
If $bd = 1 Then
Local $c7 = _176($by, $1r)
If $c2 Then _16r($c7, $1l, $1m)
_17b($by, $bw, $bx)
_16j(GUICtrlSendMsg($b8, 370, 0, $c7))
_16j($c7)
Return $bb
EndIf
Local $bn = _16l($1l, $1m, 32, $bd)
If @error Then
If $c6 Then GUICtrlDelete($b8)
_17b($by, $bw, $bx, $bb)
Return SetError(4, 0, 0)
EndIf
DllStructSetData($bc, "ImageList", $bn)
Local $1q
For $am = 0 To $bd - 1
_16z($by, $c5, $am)
If @error Then ContinueLoop
$1q = _176($by, $1r)
If $c2 Then _16r($1q, $1l, $1m)
_16m($bn, $1q)
If $am = 0 Then
_16j(GUICtrlSendMsg($b8, 370, 0, $1q))
_16j($1q)
EndIf
_16j($1q)
Next
Local $c8 = _170($by, 0x5100)
If @error Then
If $c6 Then GUICtrlDelete($b8)
_17b($by, $bw, $bx, $bb)
Return SetError(5, 0, 0)
EndIf
Local $c9 = DllStructCreate("byte[" & $c8 & "]")
_171($by, 0x5100, $c8, DllStructGetPtr($c9))
If @error Then
If $c6 Then GUICtrlDelete($b8)
_17b($by, $bw, $bx, $bb)
Return SetError(6, 0, 0)
EndIf
Local $ca = DllStructCreate("int Id;" & "dword Length;" & "word Type;" & "ptr Value", DllStructGetPtr($c9))
Local $bq = DllStructGetData($ca, "Length") / 4
Local $cb = DllStructCreate("dword[" & $bq & "]", DllStructGetData($ca, "Value"))
Local $cc
For $am = 1 To $bd
$cc = DllStructGetData($cb, 1, $am) * 10
If Not $cc Then $cc = 130
If $cc < 50 Then $cc = 50
DllStructSetData($bc, "FrameDelay", $cc, $am)
Next
Local $cd = True
Local $ce = _172($by, 0, 0)
If BitShift($ce, 24) Then $cd = False
DllStructSetData($bc, "Transparent", $cd)
_17b($by, $bw, $bx)
Return $bb
EndFunc
Func _16h($cf, $1b = 1)
Local $bp = DllCall($az, "long", "CreateStreamOnHGlobal", "handle", $cf, "int", $1b, "ptr*", 0)
If @error Or $bp[0] Then Return SetError(1, 0, 0)
Return $bp[3]
EndFunc
Func _16i($10, $bq, $cg)
Local $bp = DllCall($ax, "int", "GetObject", "handle", $10, "int", $bq, "ptr", $cg)
If @error Then Return SetError(1, 0, 0)
Return $bp[0]
EndFunc
Func _16j($10)
Local $bp = DllCall($ax, "bool", "DeleteObject", "handle", $10)
If @error Or Not $bp[0] Then Return SetError(1, 0, 0)
Return 1
EndFunc
Func _16l($1l, $1m, $1b, $ch, $ci = 0)
Local $bp = DllCall($ay, "handle", "ImageList_Create", "int", $1l, "int", $1m, "dword", $1b, "int", $ch, "int", $ci)
If @error Or Not $bp[0] Then Return SetError(1, 0, 0)
Return $bp[0]
EndFunc
Func _16m($bn, $1q)
Local $bp = DllCall($ay, "int", "ImageList_Add", "handle", $bn, "handle", $1q, "handle", 0)
If @error Or $bp[0] = -1 Then Return SetError(1, 0, 0)
Return $bp[0]
EndFunc
Func _16p(ByRef $bw, $cj, ByRef $1l, ByRef $1m)
$bw = _16s()
If @error Then Return SetError(1, 0, 0)
Local $by = _173($cj)
If @error Then
_16t($bw)
Return SetError(2, 0, 0)
EndIf
_16v($by, $1l, $1m)
If @error Then
_17b($by, $bw)
Return SetError(3, 0, 0)
EndIf
Return $by
EndFunc
Func _16q(ByRef $bw, ByRef $bx, $bv, ByRef $1l, ByRef $1m)
$bv = Binary($bv)
Local $bq = BinaryLen($bv)
$bx = _17c($bq, 2)
If @error Then Return SetError(1, 0, 0)
Local $ck = _17e($bx)
If @error Then
_17d($bx)
Return SetError(2, 0, 0)
EndIf
Local $cl = DllStructCreate("byte[" & $bq & "]", $ck)
DllStructSetData($cl, 1, $bv)
Local $cm = _16h($ck, 0)
If @error Then
_17d($bx)
Return SetError(3, 0, 0)
EndIf
_17f($ck)
$bw = _16s()
If @error Then
_17d($bx)
Return SetError(4, 0, 0)
EndIf
Local $by = _175($cm)
If @error Then
_16t($bw)
_17d($bx)
Return SetError(5, 0, 0)
EndIf
_16v($by, $1l, $1m)
If @error Then
_17b($by, $bw, $bx)
Return SetError(6, 0, 0)
EndIf
DllCallAddress("dword", DllStructGetData(DllStructCreate("ptr QueryInterface; ptr AddRef; ptr Release;", DllStructGetData(DllStructCreate("ptr pObj;", $cm), "pObj")), "Release"), "ptr", $cm)
Return $by
EndFunc
Func _16r(ByRef $1q, $cn, $co)
Local $cp = DllStructCreate("long Type;long Width;long Height;long WidthBytes;word Planes;word BitsPixel;ptr Bits;")
_16i($1q, DllStructGetSize($cp), DllStructGetPtr($cp))
Local $by = _174(DllStructGetData($cp, "Width"), DllStructGetData($cp, "Height"), DllStructGetData($cp, "WidthBytes"), 0x26200A, DllStructGetData($cp, "Bits"))
_17a($by, 6)
Local $cq = _174($cn, $co)
Local $20 = _177($cq)
_178($20, $by, 0, 0, $cn, $co)
Local $cr = _176($cq)
_16u($by)
_179($20)
_16j($1q)
_16u($cq)
$1q = $cr
Return 1
EndFunc
Func _16s()
Local $cs = DllStructCreate("dword GdiplusVersion;" & "ptr DebugEventCallback;" & "int SuppressBackgroundThread;" & "int SuppressExternalCodecs")
DllStructSetData($cs, "GdiplusVersion", 1)
Local $bp = DllCall($b0, "dword", "GdiplusStartup", "dword_ptr*", 0, "ptr", DllStructGetPtr($cs), "ptr", 0)
If @error Or $bp[0] Then Return SetError(1, 0, 0)
Return $bp[1]
EndFunc
Func _16t($bw)
DllCall($b0, "none", "GdiplusShutdown", "dword_ptr", $bw)
EndFunc
Func _16u($2g)
Local $bp = DllCall($b0, "dword", "GdipDisposeImage", "handle", $2g)
If @error Or $bp[0] Then Return SetError(1, 0, 0)
Return 1
EndFunc
Func _16v($by, ByRef $1l, ByRef $1m)
Local $bp = DllCall($b0, "dword", "GdipGetImageDimension", "ptr", $by, "float*", 0, "float*", 0)
If @error Or $bp[0] Then Return SetError(1, 0, 0)
$1l = $bp[2]
$1m = $bp[3]
EndFunc
Func _16w($by)
Local $bp = DllCall($b0, "dword", "GdipImageGetFrameDimensionsCount", "ptr", $by, "dword*", 0)
If @error Or $bp[0] Then Return SetError(1, 0, 0)
Return $bp[2]
EndFunc
Func _16x($by, $c5, $c3)
Local $bp = DllCall($b0, "dword", "GdipImageGetFrameDimensionsList", "ptr", $by, "ptr", $c5, "dword", $c3)
If @error Or $bp[0] Then Return SetError(1, 0, 0)
Return 1
EndFunc
Func _16y($by, $c5)
Local $bp = DllCall($b0, "dword", "GdipImageGetFrameCount", "ptr", $by, "ptr", $c5, "dword*", 0)
If @error Or $bp[0] Then Return SetError(1, 0, 0)
Return $bp[3]
EndFunc
Func _16z($by, $c5, $ct)
Local $bp = DllCall($b0, "dword", "GdipImageSelectActiveFrame", "ptr", $by, "ptr", $c5, "dword", $ct)
If @error Or $bp[0] Then Return SetError(1, 0, 0)
Return 1
EndFunc
Func _170($by, $cu)
Local $bp = DllCall($b0, "dword", "GdipGetPropertyItemSize", "ptr", $by, "ptr", $cu, "dword*", 0)
If @error Or $bp[0] Then Return SetError(1, 0, 0)
Return $bp[3]
EndFunc
Func _171($by, $cu, $bq, $3t)
Local $bp = DllCall($b0, "dword", "GdipGetPropertyItem", "ptr", $by, "dword", $cu, "dword", $bq, "ptr", $3t)
If @error Or $bp[0] Then Return SetError(1, 0, 0)
Return 1
EndFunc
Func _172($by, $33, $34)
Local $bp = DllCall($b0, "dword", "GdipBitmapGetPixel", "ptr", $by, "int", $33, "int", $34, "dword*", 0)
If @error Or $bp[0] Then Return SetError(1, 0, 0)
Return $bp[4]
EndFunc
Func _173($cj)
Local $bp = DllCall($b0, "dword", "GdipLoadImageFromFile", "wstr", $cj, "ptr*", 0)
If @error Or $bp[0] Then Return SetError(1, 0, 0)
Return $bp[2]
EndFunc
Func _174($1l, $1m, $1o = 0, $1n = 0x26200A, $1p = 0)
Local $bp = DllCall($b0, "dword", "GdipCreateBitmapFromScan0", "int", $1l, "int", $1m, "int", $1o, "dword", $1n, "ptr", $1p, "ptr*", 0)
If @error Or $bp[0] Then Return SetError(1, 0, 0)
Return $bp[6]
EndFunc
Func _175($cm)
Local $bp = DllCall($b0, "dword", "GdipCreateBitmapFromStream", "ptr", $cm, "ptr*", 0)
If @error Or $bp[0] Then Return SetError(1, 0, 0)
Return $bp[2]
EndFunc
Func _176($by, $1r = 0xFF000000)
Local $bp = DllCall($b0, "dword", "GdipCreateHBITMAPFromBitmap", "ptr", $by, "handle*", 0, "dword", $1r)
If @error Or $bp[0] Then Return SetError(1, 0, 0)
Return $bp[2]
EndFunc
Func _177($2g)
Local $bp = DllCall($b0, "dword", "GdipGetImageGraphicsContext", "ptr", $2g, "ptr*", 0)
If @error Or $bp[0] Then Return SetError(1, 0, 0)
Return $bp[2]
EndFunc
Func _178($20, $2g, $33, $34, $1l, $1m)
Local $bp = DllCall($b0, "dword", "GdipDrawImageRectI", "ptr", $20, "ptr", $2g, "int", $33, "int", $34, "int", $1l, "int", $1m)
If @error Or $bp[0] Then Return SetError(1, 0, 0)
Return 1
EndFunc
Func _179($20)
Local $bp = DllCall($b0, "dword", "GdipDeleteGraphics", "handle", $20)
If @error Or $bp[0] Then Return SetError(1, 0, 0)
Return 1
EndFunc
Func _17a($2g, $cv)
Local $bp = DllCall($b0, "dword", "GdipImageRotateFlip", "handle", $2g, "dword", $cv)
If @error Or $bp[0] Then Return SetError(1, 0, 0)
Return 1
EndFunc
Func _17b($by = 0, $bw = 0, $cw = 0, $bb = 0)
If $by Then _16u($by)
If $bw Then _16t($bw)
If $cw Then _17d($cw)
If $bb Then _17d($bb)
EndFunc
Func _17c($bq, $1b)
Local $bp = DllCall($av, "handle", "GlobalAlloc", "dword", $1b, "dword_ptr", $bq)
If @error Or Not $bp[0] Then Return SetError(1, 0, 0)
Return $bp[0]
EndFunc
Func _17d($cw)
Local $bp = DllCall($av, "ptr", "GlobalFree", "handle", $cw)
If @error Or $bp[0] Then Return SetError(1, 0, 0)
Return 1
EndFunc
Func _17e($cw)
Local $bp = DllCall($av, "ptr", "GlobalLock", "handle", $cw)
If @error Or Not $bp[0] Then Return SetError(1, 0, 0)
Return $bp[0]
EndFunc
Func _17f($cw)
Local $bp = DllCall($av, "bool", "GlobalUnlock", "handle", $cw)
If @error Then Return SetError(1, 0, 0)
If $bp[0] Or _17g() Then Return $bp[0]
Return 1
EndFunc
Func _17g()
Local $bp = DllCall($av, "dword", "GetLastError")
If @error Then Return SetError(1, 0, -1)
Return $bp[0]
EndFunc
Func _17h($t, $cx, $cy, $cz = 0)
Local $d0 = "wstr"
If $cx == Number($cx) Then $d0 = "int"
Local $d1 = "wstr"
If $cy == Number($cy) Then $d1 = "int"
Local $bp = DllCall($av, "handle", "FindResourceExW", "handle", $t, $d0, $cx, $d1, $cy, "int", $cz)
If @error Or Not $bp[0] Then Return SetError(1, 0, 0)
Return $bp[0]
EndFunc
Func _17i($t, $d2)
Local $bp = DllCall($av, "int", "SizeofResource", "handle", $t, "handle", $d2)
If @error Or Not $bp[0] Then Return SetError(1, 0, 0)
Return $bp[0]
EndFunc
Func _17j($t, $d2)
Local $bp = DllCall($av, "handle", "LoadResource", "handle", $t, "handle", $d2)
If @error Or Not $bp[0] Then Return SetError(1, 0, 0)
Return $bp[0]
EndFunc
Func _17k($d2)
Local $bp = DllCall($av, "ptr", "LockResource", "handle", $d2)
If @error Or Not $bp[0] Then Return SetError(1, 0, 0)
Return $bp[0]
EndFunc
Func _17l($d3, $1b = 0)
Local $bp = DllCall($av, "handle", "LoadLibraryExW", "wstr", $d3, "handle", 0, "dword", $1b)
If @error Or Not $bp[0] Then Return SetError(1, 0, 0)
Return $bp[0]
EndFunc
Func _17m($t)
Local $bp = DllCall($av, "bool", "FreeLibrary", "handle", $t)
If @error Or Not $bp[0] Then Return SetError(1, 0, 0)
Return $bp[0]
EndFunc
Func _17n($d3, $cx, $cy, $cz = 0)
Local $t = _17l($d3, 2)
If @error Then Return SetError(1, 0, "")
Local $d2 = _17h($t, $cx, $cy, $cz)
If @error Then
_17m($t)
Return SetError(2, 0, "")
EndIf
Local $d4 = _17i($t, $d2)
If @error Then
_17m($t)
Return SetError(3, 0, "")
EndIf
$d2 = _17j($t, $d2)
If @error Then
_17m($t)
Return SetError(4, 0, "")
EndIf
Local $d5 = _17k($d2)
If @error Then
_17m($t)
Return SetError(5, 0, "")
EndIf
Local $cl = DllStructCreate("byte[" & $d4 & "]", $d5)
Local $bv = DllStructGetData($cl, 1)
_17m($t)
Return $bv
EndFunc
Func _17o($bv)
Local $cl = DllStructCreate("byte[" & BinaryLen($bv) & "]")
DllStructSetData($cl, 1, $bv)
Local $d6 = DllStructGetData(DllStructCreate("dword HeaderSize", DllStructGetPtr($cl)), "HeaderSize")
Local $d7, $d8
Switch $d6
Case 40
$d7 = DllStructCreate("dword HeaderSize;" & "dword Width;" & "dword Height;" & "word Planes;" & "word BitPerPixel;" & "dword CompressionMethod;" & "dword Size;" & "dword Hresolution;" & "dword Vresolution;" & "dword Colors;" & "dword ImportantColors", DllStructGetPtr($cl))
$d8 = 4
Case 12
$d7 = DllStructCreate("dword HeaderSize;" & "word Width;" & "word Height;" & "word Planes;" & "word BitPerPixel", DllStructGetPtr($cl))
$d8 = 3
Case Else
Return SetError(1, 0, 0)
EndSwitch
Local $d9 = DllStructGetData($d7, "BitPerPixel")
Local $da = DllStructCreate("align 2;char Identifier[2];" & "dword BitmapSize;" & "short;" & "short;" & "dword BitmapOffset;" & "byte Body[" & BinaryLen($bv) & "]")
DllStructSetData($da, "Identifier", "BM")
DllStructSetData($da, "BitmapSize", BinaryLen($bv) + 14)
Local $db = DllStructGetData($d7, "Size")
If $db Then
DllStructSetData($da, "BitmapOffset", BinaryLen($bv) - $db + 14)
Else
If $d9 = 24 Then
DllStructSetData($da, "BitmapOffset", $d6 + 14)
Else
Local $1l = DllStructGetData($d7, "Width")
Local $1m = DllStructGetData($d7, "Height")
$db = 4 * Floor(($1l * $d9 + 31) / 32) * $1m
Local $dc = BinaryLen($bv) - $db + 14
Local $dd = 2 ^ $d9 * $d8 + $d6 + 14
If $dd < $dc Then
DllStructSetData($da, "BitmapOffset", $dd)
Else
DllStructSetData($da, "BitmapOffset", $dc - 2)
EndIf
EndIf
EndIf
DllStructSetData($da, "Body", $bv)
Return DllStructGetData(DllStructCreate("byte[" & DllStructGetSize($da) & "]", DllStructGetPtr($da)), 1)
EndFunc
Func _17p($de, $bq = 0)
If $bq Then
Local $df = "00000000"
Return Hex(BinaryMid($de, 1, $bq)) & StringLeft($df, 2 *($bq - BinaryLen($de)))
EndIf
Return Hex(Binary($de))
EndFunc
Func _17r($dg, $dh, $di, $dj, $dk)
Dim $dl, $dm, $dn
$dl = WinGetPos($dg)
$dm = DllCall("gdi32.dll", "long", "CreateRoundRectRgn", "long", $dh, "long", $di, "long", $dl[2], "long", $dl[3], "long", $dj, "long", $dk)
If $dm[0] Then
$dn = DllCall("user32.dll", "long", "SetWindowRgn", "hwnd", $dg, "long", $dm[0], "int", 1)
If $dn[0] Then
Return 1
Else
Return 0
EndIf
Else
Return 0
EndIf
EndFunc
Dim Const $do = 'struct;' & 'char fadeIn[10];' & 'char fadeOut[10];' & 'char slideInLeft[10];' & 'char slideOutLeft[10];' & 'char slideInRight[10];' & 'char slideOutRight[10];' & 'char slideInTop[10];' & 'char slideOutTop[10];' & 'char slideInBottom[10];' & 'char slideOutBottom[10];' & 'char diagSlideInTopLeft[10];' & 'char diagSlideOutTopLeft[10];' & 'char diagslideInTopRight[10];' & 'char diagSlideOutTopRight[10];' & 'char diagSlideInBottomLeft[10];' & 'char diagSlideOutBottomLeft[10];' & 'char diagSlideInBottomRight[10];' & 'char diagSlideOutBottomRight[10];' & 'char explode[10];' & 'char implode[10];' & 'char horPositive[10];' & 'char horNegative[10];' & 'char verPositive[10];' & 'char verNegative[10];' & 'char center[10];' & 'char hide[10];' & 'char activate[10];' & 'char slide[10];' & 'char blend[10];' & 'endstruct'
Dim $dp = DllStructCreate($do)
$dp.fadeIn = 0x00080000
$dp.fadeOut = 0x00090000
$dp.slideInLeft = 0x00040001
$dp.slideOutLeft = 0x00050002
$dp.slideInRight = 0x00040002
$dp.slideOutRight = 0x00050001
$dp.slideInTop = 0x00040004
$dp.slideOutTop = 0x00050008
$dp.slideInBottom = 0x00040008
$dp.slideOutBottom = 0x00050004
$dp.diagSlideInTopLeft = 0x00040005
$dp.diagSlideOutTopLeft = 0x0005000A
$dp.diagslideInTopRight = 0x00040006
$dp.diagSlideOutTopRight = 0x00050009
$dp.diagSlideInBottomLeft = 0x00040009
$dp.diagSlideOutBottomLeft = 0x00050006
$dp.diagSlideInBottomRight = 0x0004000A
$dp.diagSlideOutBottomRight = 0x00050005
$dp.explode = 0x00040010
$dp.implode = 0x00050010
$dp.horPositive = 0x00000001
$dp.horNegative = 0x00000002
$dp.verPositive = 0x00000004
$dp.verNegative = 0x00000008
$dp.center = 0x00000010
$dp.hide = 0x00010000
$dp.activate = 0x00020000
$dp.slide = 0x00040000
$dp.blend = 0x00080000
Dim $dq = _19v
Func _19v($dr, $ds = 'fadeIn', $dt = 200)
Return _mv($dr, DllStructGetData($dp, $ds), $dt)
EndFunc
_19y(True)
_19z(True)
_1a0(True)
_1a1(True)
Func _19y($du = False, $dv = @TempDir)
Local $dw
$dw &= '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'
$dw &= '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'
$dw &= '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'
$dw &= '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'
$dw &= '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'
$dw &= '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'
$dw &= 'G+BExo0t6luwTDrnBdDT+MtYjM/SakqL2JXUzdlMPiIS+fP4aWNbpczZsZvydWWizD3DoVROQPqUIsC/DH/Zhi9UoDY3nXbZ8YGBgeS2bdtu2b9//xOrVq3i6quvJhqN+nP2nPL5e94p1cmTZ7jPvc0BSXK5LNlslkKhQL6QJy/OoEKhQHY6SyYzzchIYmo0MXpzMpl8+TXij1emNq3FT9Fahp86VpBzLn7Sb61IEGTkPyQ22bhIvFq593nh+9vk+b1iPyE2XZsArg+4U86vFwl8SI4TchyT52/l7JOCz5MB5G5RoxeJTfeOMvt19ho4L4s9h6jhlwjgSp8BuF6ekROV9nfl//4K1M4BgACGYSSefPLJD+3cuXNvd3c3W7ZsobGx8bTgetV93vNwHY+i4X8HsFAsUigWKRoG09ks6UyaY8fiY/39R7YODA4+8RrxxhWQPY0/zSUrat39oqY9g5+7mBFAfFHswu9wYlnA98q5i6ST/7FIq0fFPjLldwJ/JkQ9/qrLLn7+Z5OUfTcnlhdEVOIPS5l7xMHhCBjTZdK75AQxOTEtqUQjUp+9UuZz8l7XyTM3iASOl0nPp2QA2SvvuUcGi4zYl5fjJ2iXwJqUa40K1E7l9z/TCxWldevWrX+zYcOG24rFovrUU08xPDx8kqo5o26WGXtntACTLLyE4nc9F5eF7QtYvfoCdF3Htm2KxQL5fIFCocixY8PHksnktYODR/sqTfgLp88JKLfNOh/jxDKN+ytsOgsv6Cko19fXt71QKCiLFy9es2TJkpCiKExOTuI4zkkSsdwGPBMdD8okqCBx8aIuqqqqME1DEq3zpDMZ9+jRoX9JJBI3Dg/HhyrN97qgbvzlOma3x/nipLqPSkxzXgAI4AwPD/+kWCz+EGjv6ek5v7GxkVQq5TtnTuFgeaVV0PA8PFlbRlEU6lvaWNDWgm3bFHIFTMsicXx0JD488oHe3pe+kM1mM5Wme93QXuZeHW0Mf6pQBXzzoYLO5UFdtWrVXZs2bbonEAgsHxgY4NChQ+Tz+ZM+PfZKqqjnubiexJcVlZrmVrq7OolqCoZh4Dju8LHh+NO7d+/+BD+7PHqFKvSWBSAAK1eurK+qqrotFot9rK6ublU2mw0ODh5VikVfIpZAWG4flktE13PwUNHDEZra2mmpr6EmErJHR5NjxULhN8fGk09PTU5NjY+P25XmqlAFgKeh9vb2DR0dHTcZhnlFZjrTY5lWB/jhitkA9MD/tFgoSDAUJhiOUhUJPWPm8zvGxkafj8dHvk8ldalCFQCeHUWjUSUSiYSiVVVaNpNZalnWjYqitHme14CfR9jseZ4DTKiqekhR1clINLrNtp1hTWFIURRzdHTUrTRNhSpUoQpVqEIVqlCFKlShCs07/X+JxfHfCapBuQAAAABJRU5ErkJggg=='
Local Const $dx = Binary(_1a2($dw))
If $du Then
Local Const $dy = FileOpen($dv & "\Logo_SmartConnect.png", 18)
If @error Then Return SetError(1, 0, 0)
FileWrite($dy, $dx)
FileClose($dy)
EndIf
Return $dx
EndFunc
Func _19z($du = False, $dv = @TempDir)
Local $dz
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= 'BlthqjMGxGi3F/fw770uPDf2A5Z03xiTH7Omg4Hn5gFCv0ruAiYfBWtPJWiFw3GBhMk2M2MZDbFSG7SqmNrI5aeV2sJWt9OZFB3XRufHbezuB81jC924Sk3XDRFPjk/w9dV2AqdiN3T1QXkCFyafq6o680xO3qkZKoUW77yuhGHg+lQ8pjQqCFIbQRO0IjwvYdfIerVr+cLlVQ3/2k0H7UzMi1zfVo0LHWIUytvVCvPLHwLUzYPjhupaLw8NXdFJhgoAi3k4PFqlXk6yq5dGhVE+akMkbJFG3fLLE9vG+/p4opgS11XpvCrsydNLs6tqeUxMbJhy9tUPb39I2xRk4COEJHBt8oOHma+vTPbTgdkvUPlNPZUXtT4YDjai1U09lZN7YU6Av1QgFmpqzLqU8/TRicl+XlKZty5w/tRgnc6768oIMDctjNB1c1xR/IaSq7ZuG6Lyzkzz0vPdRYim+/ronCenpntpjTLThL3ZL3/66fJktQJQ22SyaoraoBlruyvUeqzf+g0jqxjkBKbvtSY86/j0yipD5annS7cEE3lwUERtsbayt1Ss0fh0mr9ubkOFElUEzCxxvIFcjcMbzGU1hHJoc+eYqW3mydyYtd0t1Db9dG7Uxk4auVAGq8h6eHySv7cUVSp8gpfezAjf2s8gQXnK6rMvPM0KWx/kZRDJPI0TDsLWX5qpIjCOvFoJg+c11mgFtAbSxwE6nkrbdVN0QeKmHp58cB1lCt2YPAYLl3fdnvgs//gEL7nGc+IJJ94uFxNUn4N1H0/u3XbJzRtLu8CrrM0TUosn0NT2F6CcqzaMzZMTXjPOPs1+9OhhRsaDBw8fPco6P69ugIwrYfFEQnnAzIsFhYk7uugVLCaK6oM3Rec8vTTHSy53hzdWfSccyryzsrtaJnFjYxKv3hviCgoeZSZsGybDUNSzwfzLeU8fwXca7meELuugV+o6LrqVeWiyJY7rvDbkSfiqoBLUFrTqTubRiZ4GhIsw+WpDjc/OP819mPkwKe70oun7I+8dGqODAek4smqS2nygGcu7yGRKrOOGiEeAfR88yMi4s36grxZjcgS4T6NSLcHgNvZcPiL1pdI8epCRmZmREbqht47APdjCEsd7qSQ4ouqy7E5ZDSEd2to5JLUZpxx8ELK8i5nadJOOPLizupNOzWEJUK/6/XbEPH5AVZEZtmVIVb2MKRCzeWKF/6AtsblZDx9m3E+OO7V0yt7oewcm61UyN5bAicEy6f/Ch7R/B8B4CWReIw9kZsdu62JQ8iyP7Dk8HPp8bP6jQyMNXn6j9mc48/YRCvLlD5Cej8okGj+9Rg2fmVpKtvEEmtr+ApQ7IEWkApFW418roEa9ajUhKlf2lsBX53EeHCocrONMJiMKX14Fo6KQe1b11Gn5YOTIN1cJQxW9lhxI8KdQLvOsDm/9+JiEKM7micS6av5ksQEBVZRQ10el8KyiUVKvYhNCwqT38VMS8E+rPZbj3oSYvHOEYBy+SgXMq1mvajV/AjPovLzgKWvVpD/B3xq1AJUKcKOxal2QOKBGLZOaAK3gCuGnzmVYQnaCfZoatT01CmgMrL3kcVCjWvmBhjh0DljI6jWWNDCL0tvkacLg7WT4qo1AWdnPXAU0mwXFRCirCMKzRhV4qk4VL51I5WvQ6xCwTCjFMHrJ9pEA3iuWKbyqe3mSrk5daKnjwOdNVb1NRkQil+qdeHsVHxNCDjGZBb7tAbVgqOzkETtPKD5O4yNRoccIEiZb6F4M29ucOJuLuHNQi3QYxuIg7lxr1AMua4gHzzqQ4CxZgiUBh2stkxTvIbV/mJYLF08ohto/kDGp7GaQxy3rOIBi80RsAQpOkebZVk3+pj6rBHnNiYXgrLkEkKBMS0qkKS2v9TjG+nBD7DsHtMImDXxowxVbBdnAfChRBQVLlwJwxVD3yPLqXOkG0/g4OLi6FRafB1eaMr29dDhkpPGnUBFqo0GDBo3/J6CpjQYNGp8gaGqjQYPG'
$dz &= 'Jwia2mjQoPEJgqY2GjRofIKgqY0GDRqfIGhqo0GDxieIilEb3Oqab4P/mGwSTyixmkSa+jEbwnDhbsCO79BVFOUsBBoMe5LeuOb/KXBq83eHN9H+Ehei8SdRMWoTSpSoVI3LtSTUYrG0XENIMs6HX0QsZ7LSIZAoRBK4KTkUB5JqMJlKVHFVJyEs5M9uAViuQhCMhyokMg1O2fmnm0/jn4cQU6Jml7M5aDv6f8WwcoUYgMNBGmWjvNRGClMZh2xPTH/4MAN+efkg48G9xF1j1AoZ84NrN7EcMM6HZcfKmcwZ4K7ihKn1l2dCt45RExI2Zhy6KzY2ds8wXQU28wNtRBTew7ZEnPqqk4rAPlpKsjyFkLsWG1p8fSUtM/NePLnpoAAXfmzzafzjwDl8TKRo++2VlKTvl7RUKrjkjgNORv9PeDUAYDSOQAJ+COgddyuIclMbuR/szIuvXt9dF9iisX/Vxo0DV97Kf3h5aScFbp7AlvCKilXJKS0Ue4jUymFbQk9+3UqpYHHE8PIFP2y0JiMvaE6T2RUoKfFdixlg8Q8SsDgCJu4ZtDG+8NwcoxqwrVTpWzegZjU18CoE5wkxh3K4QhgyFJdPmkF+ouw//WxR3CaL6lVJU8kaOTZsDgqB29hZ7SlZSMmGIBIWX4a3Wfj946QD4wPrBniLxVrl0M0Ozafx3wXcoEGhaLU85nF+4S8JS9uaUHJ7UbvRl4oYAmVJr6YA3abMiIciNfB/vaf/tBlzRo6ZIJaqKJqjUR5UjNqmnc7LOTFdLkEYDJYr4ttzd8qzqDWBWhUHrIyEEi6qEBNqTAYjQRTGqhjgLI7M13fuhaKE7b18PeEXxRAykZRKpkYlBFxpl0gGagRjTxYIk0mkCgEI3+xNAgCV8qF4lUaCy1C1T8diJSeMy0eZXJQDeA1qOMlQaJgakyqEZIgqFMuFKM4j81rMsO5Pb7tnloOp0BcRTCGySGdBoHIUVwitJpUoxLEhILhAJByx0dRnW1z++ZmV9YgHz03m6zP3om3zafyXAaeD3Hf4rtSYfTNX3Xp6b/8EnbyEopUUdcO9HbzaCoFYjth6kQ2spKY1+s6c81lKStrLV68WLl4mFMs8OIjlGukEcCqVKO1/FhWmttxTs9QyrJI7jyn17LQu6unZeb5quQcb4UqNrb69knwvk4xV0xN2jyUDQ93ArfFphW9+ffcy52FazJYhUkItafHtxaR7ZLKM1MsLmysIvkQ3wDbZ1uFQ6UpsaPnN5aR0EPxmpqdc+TrQKLaXYuIKoGbK8F1JqTBATo6/sfGrXXFPjkzVyjGO1NMcFOCoq0irHrErLhVuop2ecvmL5ipcbhy0IeTk4v49llyIhseBGYtaqpUspoDa6RT6JYG68hXyNgscTcWNw7ZHR20fr1EAPxNxcWOrby5GnVvQSqMyhyT21AbTSI22DfmqtRYVqxrMv5CU9eLdr6/z7yXF75kyfm9iYk5x8y273xQ3lsZ/CeQux6Zxhx9Gr+1dvWrfLVGPjo3ycqJo1WdjrK1XU8NKKVq1+OzEsc/bWxWtrLAltcTE5Ldvf3hP/luybCUu14KwVASurKUAcJ9tUf/jqDC15Z37zMeo5qAaTYeFF9MitvYLEAuELFTfcvGVtKzry9q2qlmlXt1WEw/GP4z/bqxGRqB+zVsv+T4v4cD4Ni0CjBqh0tTo871rh7epV71Wjabj9iVlpe0Zp5E7JNPyAR18eyEhZPfIpg19qzdttuRyZvJ3Y4xaoUWKCaptE54j9yRkJhwd27JJldrNmnx7Iafo9Ztz05VSMYfwhUHBhp5yQiFpvehCRuy+Ma1rN2ze8LN1X7dQKVXGiRd/+vVN3t3NIxrUbVCr+cRDKU/T9k4APMiV+VCspMJFLNzY+At7U3ePkqs9fedfLYre0F6vYnqIRNqgJeF5175tYpCKqdjTltpAIR6ovtWCi/YN2TPGqJFo6jaZsD8h/+qSdq3reOplAa1aWZpfzdsoFNts'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= 'XUhkYkpySmpKalpKSnzIukFSXFp+RSuyENPgbeHh4TuG6Iq3zP1r8RG18IRirtTYfM7By6uHaZR/6UeaCMZio4iyzYx9V1cO9naiVvXBBKBFfBGfMA5cd/vWhtEahXPzPrpvYUaF14BVV/fNaaeUmhV8/lrA7sU09WedjE5JTYraMkBTwaGHvA8mPBQtazHvyLW1Q5X/vo4a/ChFJG8550RYyIkvGkNFK0hAdp1JkJ1JGl9ObuIJRO5ChbT/xtA4coqlpoJZFrphCP3h8Eeg3NRGfh4/6/LbH6N29ureqXGzzp17b4squHfiy0CpVdHKZiFt+3md9SC82IoVxjqBzVs1MmEyASnmVHyWSkDmcl6UBfBs8XXbLpSjMpK1tIW14KAW0gCEih0cC6TSc3gIm/Dqsinx+YW5Ro2cmja2NtgZVkbVxacggKMLpPq+a8Pi72W//uWnSzN8CAm1lSY0CZhRagKbQsDcYKJq1cD1CefXd29R3dyfcLN8q3nkogBUbdO3fHjlty4WzHETVaBtu6ANfCjCNOP88wSrjpc5VzGopjnWaHvWpkDyINUzpKkCMZMvk7b68lxm2un5fdq1qquTmGXGSuRyLA3mRTXKgasv75/XTClnccSKOkHTdlw7NLu1DP+7pPDKBahoJSeaLIzMfvXq15hvWuhtFa3MnUmIKglVlPHNoaKV3XuUVJda/wQ9xuFLEGnzWadj4p7c3hgc3LZV22atu3XtveFmxMoWRi2P3qqvgqgYtcGtKI9PlaJ8BsPDRVil34F7zyJXttEqOaDfyUiBoir4g1pFA+cmf5Nuav5a3sODxXATsMC42rAetbA3i+A5LcoGVORoPohgIJSzejmYDHBKF9cCDoILLEhgKRDGfZbohiof/B9QG27sUCyIBSabuWrSPKgnRFFD2VXbLXmEEhaqUY/ckvw0dt+YvaF5uSdn+lqoDWQEZcJ56zyBtRBgPA9D1YGzLkfsHVJdyINflcKKbGyz6bfivoX2g+Pk5DH/LqVvqY9qi7e3c8YXpdZIFW5fINk5lj4HWQSoh0Cp7LY5Lv/cFKPUjcFxp3jNSS670mACPuqO6nUzzz9L2NJVp2KzBW4sXFlv4cXUHQON2n9xiycwHQRyrwGbk+KOfLEpIjd1x0i1HIYvkNqKNxAXMeCmRhbjrd8pk4COZOMtPCG5w+X8S4/vn5/duSHhwa3kxmG48d04Os8aVeXgWmV/1aTxQVSY2nJPzdYqpK5MPgvXBa6MzLv8VRVS0YotVjWYczIyEa6iE6JOzmyiRvhCN5FS2m/93Viwrk5NiD41q4kKkxn6rby6b1YbXKbC+m8KgwtvcDYlMTEpISkubONQuVTiJlQ6FCUUiqmvkeGCX+41ZP2ta2tHqORSN5YUUw9bdf3m6qGeGCJgYYZmsw9eXjlYZ/Ltvfz7fXPaEmJMqGwzbc+VtWO6f306PB4GRCdmNtEgiJjFE/EwbZ914TEpaSkpsREXVszZGvP4yDS9Wu5ONWc2sMEceoeuH4SjIkB/ZVf9/drhGrC4MMcOOA+Voz716tau6ameduxp7slZfjJU6MZXylp9cfjmsXmtDSIRLvC2T+BAbWDJJtZpB29POvdtTaOcyRaCeKf/ikvfze/a/suTofHAtqTI4/MaEDIWC56CodDM1nKVruFnJ+/e3jxQreQyRXxZq7nHQu5uGaly1rd8Dr94z+sS1EZFWE5rBNczjgAtOe58uI9Tm6m7r28YP3VXTFh4/P7Fi6/Ephf9+MvLp2lJ4RucDzEiBNc2WFp9c7enJkbf3TAyYPjm0Ninr3758dnj9MSwjUNkGMYUV+23J+Ti3HYqKcayvZb8c8CgNId+xL4H8ZsH1Ko5ZHdc5qEhRieKVsFrIxJzrcabNzUC4TmPMDWZsW/PzEAlgZMEh3G4Ukw3aueDgpuLGyh4PFc+vDyTvC9y9aA0Jx1soPEBfAS1zdLIxHDXihZfnLsfv39YLVLRStNo7rHo8GOz'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= 'yS8vzTNp5G4soSs7oM03N97+ln338Ox6MrvvGWh8wqAUrQbuzSrNi54dH2zw8p989gXwf0rRiqg3+Uzu69yosCtL+srMilYYX6LU1unQqq6PWCKlXhMrzW8HBVZnizArm5RFbSq/Od//8Pb7LwxqGZOHsviYsMakS0W/512c3cK76rQzz5PglBR7cHR1ui/4PudZGqjl1o3vz+5Zd+Ve7snpakImUPd0Mrl6eCI8sbhuiVZY+gRMWC4fsZ/m0Vv6aOQar2nn/wpO+NjndeWnNgBSCMpDVbXDkGFjJ44ZP2nMuPHDujeSCaGilX/z4MD6figq4UlU1G8wbByBmMkW6JsMGAjSj5s4clhwHZ1chHnXahfcNECNICiLixiaDR44amzHOsWaNGCF6M7iS2p0GzAa1jJ69MjOtdXuHJTNxxHcr3b74CYBahEq4SAy1NSkbfegOialUGQhFwTjieWael17Dhw9auwkmH3s6D7N/VxZILRX1ugwsEf7RkpHLSJjzfZ9erZtIMEINk/orIFSrkihq985qHktkIYrxDhCsYesXrv+I4b3CzThMmtpND5tUIpWNdqX7kWB9TCZ2rdZT9L/QVSFCYT6gA5DhoydMCyoPuk8ZBYEZ7O4IA4tfue+FL91Y4tsP+MrjdooLavKLXp1aVEb1gICPWCSUF+9Q//ePVt7yrX+TXu2oUziox4s6OFDx04cNXL40E71++x4kLhriE6Oc8Q+TieXQCDhC5y1wmoVqVNlP81liETp99dxwkegQtRGAhG7ubHIdTgJNwG5XCJlfsBQkZo05t8WTRoPD0v6Shw3UpPGzY3twsEpTRp4thKrEvzTtiIw9hwymAe5WGTJsDTbvKSilYDhwnFzVDW2yUvBQ0QWTtZlNtgGiNgVtMgDsRjsvIHQFz0Qa0fDqkEVriVKo/Fpg/LnUr1IBK589v4P3MnihB9wFWd+a5+lNGqDoOYd6caWI6QnuwlYVpPgrMGZHh7ktwHkv8CvI7Nj1gdWo976LHVyfbAVjtMcTFXSnr+SEyqGilMbDRo0/iVAaiPv0zl8Q1pOcAWokND3XHLp6p27t2/fvnE34u6D0O+Gd/DlSbgVLOq/D5raaND4/wPqPl3dTm3q+lrv05UfPCGMW6t3HjNi3KQxEBOHDww0sBHmp3izmKY2GjT+X6HkfboKwTYYhPEgz+PPfYX+nwVNbTRo0PgEQVMbDRo0PkHQ1EaDBo1PEDS10aBB4xMETW00aND4BFFxaqMe0LiwLOCbFa2Y7ErU63nU67uupT55ga/nuVOv5zme+otBvgfo+HYlgjOBeZWs9nPd4Bam5K7KJY6XaiH1CqI5JYvBFPHgpszwhcni5/FUGtvawREmB6Rxt+YF1VlrtCnE5q1Lx972IHsbHoTpLcnMhZNDYHuQxt+KUhzs4wfCwa8+/JYvjVJRMWrjCYQuLJHvkA0nr966cfP2jRs3L5/4qr1Ehkj0nefuXjqqmVQM1Wt6LTt/7tzKXhq1kO+wMQbOFeCostnw5btndzfhkuLtQ/9qQMEhRFp/+NrDB9aMrSGVgz/BcUr4p9Nnh45dvHb9xu0bN29dOrl+UFX4mQgPd3KcxbPb3YgCly9050pazz956QbshOs3vj/2eRChNXX7bN+uOT1xAu6uBSsitJ3n79uzalwNUu6IKwRHdJ1n7dy/eMzQ1RfPX4O9d+n8uVPnv78Gy7l6ZkGwQmvqNGf3rvl9FDKCLQSFOOttTM4XqeuMWrl9brBSLmOTb1pCASGZMYgcAhkOhZRsDabxN6BUByseCLOiFZ/hLmSX4wWLkn51/MvulDs5pKRRHlSA2qDgE1Jz8ObzkQVpZ+bNnTR6wqhpn888cm1nd1LR6uIbcoNglCVS1eo2buToXrVlCoHQ4VVAnEOp16S8KVavsUvwVwFj8WXiWvNCCn7/7fewWfVUCLktDLmNlO/MK+/yQ3fMmjpx9JT5m2PyH93cOqIaJpZ7Tb/seHxUbYXQ'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= 'VLL5WU+riwPbynmA0oLfOMwhbb28oPpZ5qJmIogwbY3QdzFtflnPz64ZagmjPZUjhsZuu/k820Nj2rBvcLW9s14mCzqG+RaqJYefo3e3FQYBYvGYkHzUlltPM5fKFdaSuRlP3hxxl2JfjsDHL+wfhU/mqsTOm67czvZxDci+e3PjCCuYwWDpgoXmoj2mKKCFhuvDoJMYKuXC7Kd1c6Mi2JdTUFM26gkCrAyFZDV+VcrpJz/d2ja2n/2C9IdvdLLCZm2wSlMvPsuEa6FamG2knFSlctFBI1fUZXfV1yw8kKe6CgzUX8YgXq0Cjr4+s7aXNYfZENOG3jguT2HvlfXyaEg3uZCH3g5Y6bLu/KvzhbuKbj88s9Wtr4xO4iiUC40Vsr7Cm3E48hbodOzmlokwLECtAIUl5HVfc+bNuXW9m8KojdA3bWC015o27Fn4NdNmpPNoGtlYg5xa1c1GptBQzeoxbXpN/eJ8tGubpotSH74sCjDoddl+wLQxUHtkoZiy7VpBuJWFgsqCGSw+W9h+TsbjN7dLUzOyUjMOZmRkpmVkFFe8eZK50JbHZ4rsDU3bmXhAqGLC6DOGScMcUqqwO+6QUjGHlMyjsoTCLvMz7j8r9u9Np7HIbAGbL0I9X1Mq1Mmv9On97JmOFmw2pP2iSuir+uOmTSS0Xpj56mmhXw8yqQmJ3GNm/p2fPuR6KFSoQ9oI04b6gGz07s5Lf/jqxNqRChwC5Dgfy8xHJpLwHOakP353Ztv0toB9ZUoiK7sMH2onljFoMCJ1Xn/zZUnu8XtnVg6SymlkDcQbcH0E/A5z1Qlxro+oe+f2Mlm3uakP6+QmkrM13xMZsALu7DqoOdYRSY5hF366snGIfa9Z+++/rc1K3KNLW4nUxjUaH0swx4whFHSeZ1hO5yHWiFzUUVOM2isOsYF02F31Nwue5/kdM9uBtGjD2A1Zd/re5XXOMgmZLpV93SEVglfXEvuRW67d3jpFLBLgnxFizjw6sNiqzZSIQ4/eX06c3MqMQmsxO/XRu7MNKvxQW1jIFTf1zH3/+Xb+jC5sUDBqtwmH7n64FjNCLmNqgOTf2bTpNHKdBokaKpLVUs0aYtqqLsY626u6+Ba8fXMqaoR+r/NTycRkOocqULXwL7y/dy6AvLAg4HS3XJz54OlRnw5UEB8c7Qkkkgm/uVfhs8dlPt2EsMQWZ7ljps3SKiC/+nbSaD5Hu/hD9zOCBf4ZAXxD4zO4koFex6uela6Y3EmdLYneeuqqY89eli0dzuchFO2XJUINUONNmy7OByz+gNmCzlNXnaiqOhW7NnplxN7DZ5/8/O+SpSoLkWz0pts/YYtCOWZURGA5YSv+p5ris+veP/RwU+jdZXJF/TwPVry+lxEbtSI8MmJv7unHaGaBFlLEnAH18dp+7v3bUxtiw0Mi18YeKDkU3EUpp9PYdKFy8Laq3/5ZfdK7Ix+CzOlcbNnkT7cB14dLZsLqhPEx4eExa/YWb5llIYJ53d2N5Kb+Qoo6HbC1Yv7hq0XxMZGrVkWnFBanLRkk5XJ5PT10syraPB1DBN3Cq8mjMCEmF6lbzs4yMZ0B9TY8vryDWAYpxiR+pVkgFlfQyyPpyMMHJ+LQtKsiYzNOn80Jm9iexeOZshTYJ+miZfbWPCrbjIN/ocb+1DFt4MMIVyVx2lR+OWlYKwmVzIPB7fi5wN8eZlItJqw58/79yejIGd0l/ZduPfO2IYUP7iQVsgU2S7LfvbxTfuLwuoiIyDVxp9+8PhU+1YHJgwH0R9Nn1LcjaaJKApmQxbWf1FksE8jaOgD9bYeLUswR2/tpv5Aqx6l7i0HnwRq5ngZpR2NBPEA1U59pTtNeWj/P2qauTBplK+C2HBOec7f6Ltbr1kTsySm59fxdjq9KLjYl89mi3l75J/fO7CGFYCqTz0CsB0dd+/ChzLeLiqN+TYxQWWK4Y+CxTzVPdzpZ2jTzyvsMKivimzDRB0/0pY/PTm+IXTG1D4wt/gAr'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= 'oKLQHv2Hjxk+auzwkWOGxHbQ185o9R+DQgSoT4B9a//fCJxCxUpTy95to4NYYq2wbiPihvYKl9ZOH+V4inW35T8KwF5JWhXdtXPLSEIs80a3lx+1O4JEUJvFNtCi/uu+9rqhAaENwSg+XxHUfdQ7F/JLM++kp6al3L6bVnD501a1Mlr9Z6AQQkGY23Zq31wlkUP/d61QX7Dv6C88/fj29hEqCudJjGO2Xbt2bcfY2umjHE/5oz8CtxAIbbv96MyyV5dA6M+D2h3BQGISLNizxTbIov7rvvYaot6hDZfwwEWn+dzjDx7du7F5iIQKaMT1EdKiAR+8N8xAM4xWfPvime/DIcB1CWW+smQX4VzLUb5PAPv9HSx3SMGYtbfj5Q4lGglk1JzjD9M296JIn8You7+jey+W+k5wqtaIg2O2TcDlFFco9m3s69NIyDA8eBAPyAANkT1l01CliO/jw7Ud8tiFoyQIijf24zu2Zv1iVODLxxuDQphZwBY4XKaaj78Pqu2zMbns2OJXd3usPwvqcITBaqFITMyyWywfI+2T7sPlK1myK+fNoOD3wsLG8DvienQxjGWPs9b0onbUN7RBAgRpi0lHCkouvdWWEvsLSLhNCi4BIYCDgtW1hCfAidDufYe+MXTE6KHDh/VqYfLnEzwUErgGNu/eIkwri+kTOxQcGtG7Y5SITyAEHdq2X+cW4ZhYKsAkCCGTR3Tu1rWdloKXO8jMRMhNXcdN+Dzxce6ZjyePi20fLSIlHB7m3gvfZYnuJMwbQ+IGNQ+UECozu22cWibmiejA5j1bRQbihERIehCPEJCgBfid+eGSm2tjTa169x38hu2QAHRXy3j5YCC4DFU27TRo1BBYPtxyilCCSUyhbXo2DY5qEzd80JCeoWIpj4sqm8fGDh89dNjQ2P5dh6y/9eDwQm9oe8lRqyMIMC4mC+wy3maxA9pFkTKTubVl0mMHdo7QR8QfKk103OeOuRehjOzUOsrkwDJVh6/Vcv/ECzfUM7SJuUKabrnqak3BV+ONYrj3v+0Qo3SMkMT0X3ImDyye01LSM+7kP0zcMah9uL8AQ5UhC049zj+/YcV3P15LykjPKnpSfGp+u2C+1DThcMUvFz8IUSr8OTgiixj9XWHl9Y+6aWg+IuFDBln9iI03U0qf/uPXh/lZqVc2jJFJSTyir3svXCCAwxWPEabvolN5pbez0tKyMnMqjs/XKXWW7fyZHTFDLckp/G12F29hxwgOFxXSMBreObXu429/vO5wiIeQHFTkcbxcYHyENnjSt6n3M2+npadnFT4pPDm/czSfRxLauA1pPyd89cW13FsJN7aMVCpMLYdsTnyYl3U7JT0lMfXsgXN5lYfn617Znf/+HKjVEUDcQaWOFpt8afVYvXno6qTnzKQn3ri6YWxIzPz9DxIcQpuFZWpTaupmG8tUnb5m+eHFi1G/0GahfTnzsPrEfL0OA5cRh6MMo1WzCUeyi9K2jpRLfH34AeJOS84WPk74JFomEVDGuWd++eezsmPL2iNcgR/RcfGZwkcJq1uEBCne+Dr3ztdjQlQ8DkmYJ35xt2DvuCApIbIwAWKEH6akZx8qSdjQm5Y2biREQC9HPfTSREXzEEs4AMIIqeYTjxVX5WwbJSd9/SXCJtMm9FMoDOY59tAWYqWPwkCEnecuXuL61oEUIjXOPfX8H/BQB8dDbQPlAiJ6vKfxxihkfLG25ewPJ0WKmN2Am808WfD0p/fNcjmqGLAh8+fc9O8WtJJyfPkCResPbz4u/OGdNmLcx58UjdpW8Ohvv55Z9Oru/PenQJ2O4GKxPj6YSD1oQ5Z10v2YhNS2ny0qQRDUp5Gfj1DZ6dPr11b2IoU8Hx9eYw4eQBr0tXXhRb3RoNDmidGK4WSkW31yuermp110mBDnoiQHUUi7rLpacW5ZuEYiDZx3vLJo3yxaKvHn4xxETnVeff1hxub+wRrNG3ty730xNgwn5LoxX9/N/3a0XosKrI/G'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= 'ZqMeEytVgaHjli5trdKhDA+IU8v2TkGGa4mwjjcN7GkULubwRDZGMQSOl2DScwnInlznDiP9UFoxc1/B1bU9FVLfABF7MfAwRsvUkxyeW76PklzSFLb06P1v54UZ1YyWQGbnUbba7ccBtlnzBxUQwhdVukvIZvG+/nxfwtAP2OqJJbY95uqrFj7BUJfZG2/sKyS0kW2WniNUZuAFbE2W0cowaFdmTnbBX7J3DAsnRYSN0cpiG1LcRyB3F5IB/JDOMWkFf4LQtuj0o5rTb9dGhulFg9Cw0NZ/Y1LpkfkaBdUY2LH1BV2UVNPGcJVcqQ5rHtm0VXh4qJwUIzhIrKRCyhgY1TKqaauoJs1DgvSoUMJHWDam0oT1g3TBEeaoltFNWzgdsmy1JgFXSL6QQFURYU1aRTdtxeRrDCEWkIfd6XTIjvSSo9MNSiGh7+sgGLD7AJ6EMg1Zn1L18Ie3zHDbAymlDVEraWhSmJgnDTZHt4JSRUYqZczlVPLHyMmANXf4ofuGOFoi8mW+BuUKHAtxHz+c0A/fll6VtHlU+KDNiQ/v7hyi43MRXwFUspCkMcjdZ58OkA0JQKfK8FCm06joJjqlHLJ8ORY2aW7Wq7hChqOL1GvMoUqZlaNLFqg3B8tIGUqoXOZORpIILqFCO3VeeanmzvdvdukQFqjHCMiS5TpGEBHg1EdoaL0hukVkTKQSXufYMAHqSynzyE1Xf1rRL1iEikCi7SSwXTaqVvuxjxduP2ubtcjICJVMKg3t2MlBQhTyaRGkPia8CdRGWEzTWMjCxewMDNbp9VdLcJCclFIhneyNGzWoSMknxwhFWnAlYEUCDeJ0dPzR/ITtU945UVR0apnZA6OVGA/uYFcjuFBZ7irA3FOsCdVr7Dc02NDG7Ie4zBvafhc0OLSVHJpHU4SPvxBcA8EqBkynRDto5ZWiH9bO333ldk5R8cOHmTtGRMkw3B9Ta4dsu5kHEjBI3VSZvmdkhInPY9iYDpWkfrt45s5L6dmQoaoy4/OR4UaGqMkWMsQBAhzTNx+141Z+flF+QVF+ScrOMTFKHL6dLxCSiDRiyK6U/H2z9VKxv9gIY67jDteYyA/T6heeqqw+u9CkIqWmmfsLr68brJYSftKwqLdOFhUVFxQV5RUnruujw3G5Mu6PkNOiOpu5J6yLhXQbAag/D+jN6gNMI34cEpf3XZtUBSJdcPjcvcUPL63sGqEhGoMlBnAYzOWeNGTGwgzNRu1Oe1BQXFBQVFhUcmiuiRIhAm3zNz5nCkFWXvyg9Mz7zUO0vlyZzBi/r+DmmoHWLdFj118vPDhTp5cq+n3iPHfbhobScs3oHZk5Nb/+62/PKopz0ndNVkhJvrqp8xij5ZC7K/bTn0rOrFl3vvjOnayvJti4uzCSIzGa5h7KP7ggEE4KiCMEZnCXTefLI0ntQA/2Q0AyVna8MK4pwm2zllNwbcPgqKk7U+9VO0lImtq8fbq0qAhImH0ned/mg3fLIAuX3J+Peeras1qu5H4XHxE1cUvqfdvwd0+h5XKOwLKyYyDhIgpp2JJTD2580i88sO/qaw/OLozQidwYrUZuz3BQ4xRHZqleq6789NlAcDG2rPq9oe33RoNCm6nfxuTy86u6dGgbGt0iumnLyPBgEqVI1cAt9//+66PET/oGaQwRs4+UVWXs6K9UCMXatku3vtUjWIqLRdr+n14vqTi11CAT8ynj3FPP//a8+vKqWK1SIzMNXpdQWv7DuyEqMSIzs96ukog4ZMjgHQn3z6/sqVVyca121vc5RaeXRhhEILNgDOvEg8S1sWYCEXKlzHLSMbSBZR3IKXpvTKxK29gP7kc691hVyqbBcplS2m/LrYqkjf2CpCqTZuK7C9ur5Upd68V/hJyWfUqZ0BYy72hFxt45Hdu0CItuGRkTIccIkIRa4h0u8GmM0dHTv7pbfmBGsEym6rDian5pzf1vZ7RtHq2WSzkIWEk5zAVkxgqL23O77MGh+LAgqTxY'
$dz &= '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'
$dz &= '0bU2luXoUsoGbUlxCG3Oc5e+ZaA1tNnYqhaedhujAsUcpt6FBUIoEqkj5h99cDA+iiYZlizPsiWt6WNSaWBoc5UhzhbaAMDlB3eYtbOLwwwCXOPMLnayEijEBOMXNAnK0G9jijW0nWiIWpypy9xCG8y1KVO/rXee//KotNga64vLHv3y851tgxUiO3GPR0YrlNLIFGq5qcngzbcSt7wRZtIzU69AvAnp743f8hhBaXuMwAO5htiyanNk3KlMXhcbEThwU+rDc8vCNQE+vj7i8JFfZD5M295XJWOppKovrIoxkI0ac32EpogPLlSXHX5Tp4Q5GjALkDnKaKrX6oSqe1+MjZIEcHwa8xtxCFKlw1ESkZoHbkkrPjLHoGSpAFwF8+MBMQIjO606X174zbwwCYogCuuFVCHly4wyQujjixH64dszaxLXD4sYsTW56neWUySyv8dkC21MbLW+LOIW73hgLEDPIGeRG3UaJVeA+3GRRr64OOyDC0+rj861snkzqwa635qEqvtfTWym4CONuHgArhLLVar+a25W3f96UnOFAGnkjzTiqYPGfpVe/P1UnVEJObqy9rwRhgZwGfqrH6sfnozXgvUss2pzZkvaHMuEtoUnK1K3DlBIfPwkctidyxi1KEJJtNapdwttwFGn7S9O2TREKSUaC2hWYDfZ9k3T1SLDIIfQRsgxOtA+a1lP0tb3ldJa5fwTLhJ+OSZKDHm8BDxDm48vPKw+sUhFayQ9V3nquja1WKnLFjHDp2V+lpc22FgDF6SEfhhMBzYPM+mZNTitluojB2xKrbr9RZyRwmXOjFYu7WBiLk/IoYy91ycnbRikpJipZzZV9oa23xcNC20Dtt5+dHl1l/atQyKbR8a0jIxuqpNLpfqhm9NrTi4OZ01TFbcr88ntzYPCDL1XXCzJ/HpKp6jI5k3H7kio+cu/cnf1ocGFyxh//h//eF5z6oPOMZFNm3ZcdbGq5Kd1A8EVD8SgBSdr0rcNV1E4nwqasT+n9OHVFV3aR5ibNe8wcf2X77WlNZBMO6lw36xwKZMEuQoWHhMa3a7VpN2J9/Py9s/V0VI/ePsjDDa7ZbBCbaDGf7Xv7a6tY6IiWs/YffPu7pnRpgErLj74feV8v4NWK7RwgrBRjBFg23CtU2hzLYRhCzIbrbx0/IOOHdqaw6LDW3Sd9E1G0b0DM0063P5cAiSzZkunndpGRLZvMWb9+2PUtDZwynfZheWXPu7cPiI4JqbDm7sTsi98FquAHCt9V15+UPnTynYt2kS1Xn6k7Nk//nlhnlorpQdtcJm7p3d2DDKiIlo580BJzdXPunUKV9MYbZ6+P9t1LiB3V9wm9nTn0AaXlmJD4JsHC05b7kABgUELHmQTiXHNEFf7ATIMDraENozkUYGqyV/bZy3h/tczgwmJgn7TQUJlyIzv8sru7JvSvlVwZJtWyyEN2T8vLFHLxDxJkOeuPavlxwU6FQ9RqmZZGo8yaIWETCBUCuHliuThGvO47+49Slvf34gxbPzwIsSXyftsSX/288W3I5XaoLnHmWkFoQ3TaB3aYT8pYZmlur5/8vgHIDewMEsxoS108dmnT84uN3hD2++B+oc2UkDpO390Mbe4pLCwqIBF9u1tY40qfa93TqbtmR4iJzE/oVLRe+UPt89/3FNHUrouH1/KhjVz0n/c/MayfcknPuqmlGNS44QdqT9u/nDLlay7hUWwme9mgyuVHw/HlOYpe9JOfzwAPtjiwZA047uc/KIisOYvzMv+8ZPeUplKO2h7wrX1vY1q9v1vN8EKgWDZWd/ODDXLcAnwDXjTl232w34yGS3utvJidn4hqJZ3//wnA8BlkysJ7P7J7yrnp/2VUjsZml0Apr7VlD0UMo8I5JT+zb338wuZ1uC3CPe/mxFkJAROH1EIhLi9U1jn0se99AQi5MvNvVZdzs5jzgWSrByolVPwRiGikAfO2nsfjLvoTsaBJRM2nUvcPUGjkyp6v3vaZe4u'
$dz &= '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'
$dz &= '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'
$dz &= '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'
$dz &= 'ST7i44/wdS3e+6G6+uRShoULBHe761npKOv0F7Bq0xkVvVYnenTnYK0gACwqZ+8vurN37Xe38/e9aVILeDI5UE5V1s4RYYQ/x8dX0ChAhMlUGO76ImGDQlvYghMP0xwZmJzKhzGhbcjmtIc2diJl3K7bT7K2xhqkCtObhwuAObzbupkpqHnUsJVvj9LrguPWp7hW3j7YdXNwaAGETjvnUNnDSyvatzbJZZgybNbhguKyc++2aWHShoa0mLTtRs5P6wdrHMhWGEj4QoU25oMfnv6l+Oic1tHh+uDIoNBIo0YpqqUFFSkSyEJmH/F4CEfkoQtOshpgpsq05ER1xpYhlqkyLDpZnbZjkDe0veaQ8AUKOnjhkaLS0qwv32jezGQ066PaNY3/YtNovUSmVM5iDbWVUUqLDcM2se5gCW2uHgSfkMqDun/0w5mP+6shEw0sZChgwoAROvjLquVvwMcI847D05nQFso2BTnVZKHOla3OlVx9LD5Qpg7qtzmxtOzCe21a6inmBQ52IHAFqqT7r7tWlrFnbKvgoMjwEVshnVvOzl4wIY3b6MGR9VI6eOaBorKMr8c2j9EGN41ZAlnA/nF+icbt6ZlzxKjNX7YP0ChQKniWJ48D7gwuG5g8ZNqJZyUlxZmb+msoyp8nsisH1NdFRLR4Y9Xu9zpo7BxyLBoS2pTm6V/fvbByoFrmHNos5bHMyx/9V1y4+/Uslp1IRfddcyn7p1X9AgmBANfFzDtcVFwMn0/n515Z0UNHa/t8cN69sol0CW3gUimkSD184lNeXJS1Z4qCIvl0eOzGG/nwaXdRUUHelfXDApVSIJXj2AQogcqMEz7PLX/6pLq8OB+m5cWFRbkZe6bQtbYgAQkspol0P+TPxyEjnEUDpB9XLjPM/irr4if9g8RCzI/Ua2d+k3VhdR+d2hvaXnPgEi5PRocM35AAzBkaSWFRwb1L6/sZlXwuSehYQy3M2DHZEDzovbNZ0MIlIg7IKD15ENygXK6XyWmHPdYpAcgq9Y7+cvWTnmopHTj1K3g6WN8JZLamxAE8zLmyg3PNDKFQnkAVGX+8rDg354vJRonYzj0G39FTmPuuvV7wgPGLSzsmvH8064dPuoNVG93vIw+ObBTxMcIwZO0NZuD5924fen/y9qvpX8zSuX2N4BwxavcXrZrPRVFPHgfdGZIHafRzj+QW3FzfP1AEI4OLckD93CtrB6llLsuaeoc2CEJGKgxwDuooh3xRBqlUhjIXB1Sikav1Egn8tk6Akrg8UB0Yqg8M1RmAimUoofBc2bFxG3AZqTRpAkO0Gg2ozxeSiNSgNobqTaG6wGCFVMpzeamNBSGTqINU2kCV3qxjuta/uIVaDoFo6zBS8CdKqKQWgYH8MlSqVSg1Xt6GPwVwCU9IEcogrd2o1CjOvFnqYKgYSYstFs6cVYsHAdewRzoWHvwFlDuebv3NvM5at3MJUDGuMKmNIbQc/unQEUPnJtWrDCFwCFotBnyQVkMbrsuRpaTKxAw8RKtSonVwX9TLX2Cbdbgz+B+hNLRGLyatzTqOF9Y30zKGrM4ZDQltMBJ7JuZxKKf4CGTDthzCxFyEsL1KBz8ogc8r4SNL5huLuiq7gfloA5xrvTiAxbytNVfLcIBDp1bUo4XaDjlrQMKzcHpBwCtMfT+h9eI1ALReq5GIOPalut1QQeDgCx0svHYP8gg3f3E63aUpt8pOzsUcta/XHGE3dWC9IMjaqM5q9U3bwAkOqAxP8bSqYOAsZF3+Upc7w5qukcFxvB7dv2GhzQsvvPDilYA3tHnhhRevIXysi7o6YFv4eeHFnxleR3iV4KPWB9UFXZBSGwj+dy33wos/FbyO8KrB5691/vvll1/y8/PB/5a/vf+8//6U/7yO8Ir9++tf/z9ezhPsmKU6OgAAAABJRU5ErkJggg=='
Local Const $dx = Binary(_1a2($dz))
If $du Then
Local Const $dy = FileOpen($dv & "\Atalhos.png", 18)
If @error Then Return SetError(1, 0, 0)
FileWrite($dy, $dx)
FileClose($dy)
EndIf
Return $dx
EndFunc
Func _1a0($du = False, $dv = @TempDir)
Local $e0
$e0 &= 'Cr0AiVBORw0KGgoAAAAADUlIRFIAAAACkAAAAZqECAYAiLjGc6sAMACEaUNDUElDQwAgcHJvZmlsZQAAACiRfZE9SADDQBzFX1O1IgAVBzuoOGSoTgAWioo4ShWLYAChtBVadTC59AALmjQkKS6OggBrwcGPxaqDiwCzrg6ugiD4AQDi6OSk6CIl/gAvKbSI8eC4HwDv7j3u3gFCowDCVLMrCqiaZQCk4jExm1sVAwCv8GMYQA+iEgAz9UR6MQPP8QB1Dx9f7yI8ywD73J+jX8mbDADwicRzTDcs4gAN4plNS+e8TwAcYiVJIT4nngAw6ILEj1yXXQB+41x0WOCZIQAjk5onDhGLxQAOljuYlQyVeACaOKyoGuULWQCXFc5bnNVKjQC17slfGMxrKwBprtMcRRxLSAAgCREyaiijAgALEVo1UkykaAA/5uEfcfxJcgDJ5CqDkWMBVQCokBw/+B/87gDWLExNuknBGADQ/WLbH2NAYAAXaNZt+/vYtgCbJ4D/GbjS2gD+agOY/SS93gDWwkfAwDZwcQDd1uQ94HIHGAB60iVDciQ/TQChUADez+ibcgDA4C3Qt+b21gDax+kDkKGulgBvgINDYLxI2QDrHu/u7ezt3wAzrf5+AFwCciCeDa3ZwgDLBmIgS0dEAP+BAKC9BKeTgAgJcEhZcxAAAC4jgQEBeKUEP3YACgd0SU1FAAfmAxkBJQ5oAPGnLQAAIABJAERBVHja7d3LAI9lV33o8d9aAHvvc+rZbj+IABMyIEoUwDZEAE5sR8prEEWKADKMyOOPuv/CAP0XEmQpAzK5AAIBAQQi4ioYAEikDDKIICZtAHA/qqvO2XutADuovU7vqn64AO3uhnLu5yOVAOrZp6qOa/D1DHpGQCA0AEAkTwEAAMDHy+/93u8ApWEYYrvdxj8A//M/VwEJAMAAfX7/938/lVIAotbzXuz7PqYAaYpxHKPruugAui6+/e1v/0IAYlJAAgBccW8AvfVWiogopaQAWmvUWqPv+0gAKcU0TTFNU3QAXVdzzjFN0zMIH5UUwLlX2JtvAL6Zaq2t2VpAAKZhGCKlFKWUCCil1IAU7/vadQBdjONY9/f34wCf/umfnklICgBIAIAr6I033gBIERFzPKY5HgBT3/cpIlJK5wAZV89FrbVO0wBUh2GoOedaSgCp6/U6zs7O4gA73/nOUw3JzgR/HgAOGY8ppZQAaq05InJKqcsAOeeUUpdSyhEA0S0+18Q4jqkA67rU931q6yMAX3755fTjH/8A+Kn9fEYgAQAArmg8RkTUWrsAiMjzSxcROecAvGy4mlIqKaUAUmsts7parUoAKaWmlOrp6WkA3dvbi2EY4usAX//6E49GGoEABAC4Qj75yU8A5jkgc621m0cAHIda65BS6iMAYqi19hHRpZQA+pRSC8yUUsoAXdelnHOapikAlVIiIuLg4CAAnZycRNd18eIAiy+m//qv/3oAop+x958JAOAASklzEHa11q4A1tqnlHJKaUgAKfWllDYSGSkApRLnyyDLOI4AY0RMOedUa50ASimxt7cXtdYA2Gw2dZqmOo4QYyqlGIAR+J/kAJOf/OQQEX1KAKmvtQ4RMaSUAFa11lVEDDnnAFUbjay1DrXWAG6apjSvj0xzAFimrutiPjcyIEVErFarwAjx3ABzz8WLL74YL0C//PJHHomiNisAINdxPk09pJQAhohYpZT2ImIAFRHriFh1XdcA11pX8xR2rrUAdvlc27EdtdYAKKVE20yzWq0A4uzsLOWcY70AXsft27fjU58A+lT67d/+7fQAH//xHx/qZzQAhQ0AcLWs50YAG9rLPBLZx/kAtHZfSmmRWCMAYkopjXM41mkAmmpKqUZEOycAcjw4OIizs7MANAzDNO/Sjvkgaz/SDyjhNJb9ALnRVnE+fd02AM308yaaFBGpAJQSXdeVWuvUADbSjOMYOefIADlHRNQ436FdAMdxjGma6v7+IH6eo7H8'
$e0 &= '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'
$e0 &= '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'
$e0 &= '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'
$e0 &= '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'
$e0 &= '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'
$e0 &= 'KSXOzs5SRADEdrttsVi//wD972/bv/njPwD+4731er2LwQD29e39NvX9JABKKdE26wAAPABIznk3zfxRDQDDcN/RP6vVqgDmnOPs7Cy+/gD1r58uP/faawCv9Tnn3HVdbSA9NB+XGCCO9eAU4CCAjPwgCmM9PQA9fZxIfOLYeQDaI24fGJGr1QIqQAN5880386cAPvWpXbCdnp4Axu3bt3cjk20Al3XE+XFAbaoAeg7G6cKzsKggvmvXrq1gvj/SAA8vHgGAR4bOCEc82WC2+OlPfwB61m7UW36u7wD7rs2kTtNUS0QpdWBI5UkyQDV1AB6ZjOvXr+/SAudAgvGlL32pdQBRfow4fCqx8wCspmwfazTyDwD+4A9ivV7HiwAvvphyznFycgASi6BMd+/evQD85Kezs7PlvQCS9z34ZrMpLwC88ELn6B4A4ACquHHjxrRarQAeuN6uXb3cdgBWLz83DEMcHQAd7T62v78fNwBu3NiNYH75ywBfftwwfKqjZIDPsrLSh/hcAkIYLUcAAIKAlSw94AAJjojz6e7T0wBTlQgAfGz1fQAf+/v7y8PGLwB0z3PPPbeLxQCUUnzxi19cXgBF+EuJx2cdkACP+/gP/JrXXwB/PT796U8/9ADft9HJmzdvigBIAOBj5+DgoAD2fR/r9ToetgAZ+N13361f+QDKVz5qGD6ztQB5v8j4Sh/26xAetUh14CXzP/8A83Tt2jV/gQAAwMfOdruNt98Afrt+UO884gAA8F9oNP6yAvIAaXzf+/7d668Av+4vEAD42PkA3ve+V+LDT0cA/1LD8ZcdkE8ANSIBAP4H+FgAxONVizFhCAAAcMVi8eMcbeIgEgAQigAGAHxkAP8PZYeBd9h1BKSx4QFJRU5ErgBCYII='
$e0 = _1a2($e0)
Local $e1 = DllStructCreate('byte[' & BinaryLen($e0) & ']')
DllStructSetData($e1, 1, $e0)
Local $e2
_1a3($e1, $e2, 10225)
$e1 = 0
Local Const $dx = Binary(DllStructGetData($e2, 1))
If $du Then
Local Const $dy = FileOpen($dv & "\Sombra_hWnd_Main.png", 18)
If @error Then Return SetError(1, 0, 0)
FileWrite($dy, $dx)
FileClose($dy)
EndIf
Return $dx
EndFunc
Func _1a1($du = False, $dv = @TempDir)
Local $e3
$e3 &= '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'
$e3 &= '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'
$e3 &= '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'
$e3 &= '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'
$e3 &= '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'
$e3 &= 'mUP56U9/6kVEyhDR7u6umpns7e1JmcMpLSoRkRCCvvLKKzKfz/WIRPmF55zDjxzx/vFz8ykt/lUDAF54Zf/bUSGntKHWlVZUbTqd2qeffipS3SNVwk+etSmdl7HacxZL/C5MwCl+8pOfuJdeemnMKI8ePdK+78dkeHh4qCklSSl9IdzkkKK3b9+W+gTUYrHQkwxOAQCAJ2Hmv5lMJqaqEmOUjz/+eBw4Xv/z+aSziSzbUPlouJSqTfmdPAyD/OY3v4nn8nf7Kr6h3/ve99xmsQCbb765UowpcwA6ZrZSzSmlsQAyYJxfi8jqKQAqAABw9kqoyQCDwlZv/6+rNgClJXXp0iWbzQBmK1/js88+kwDf//738Tyf9wBXFg5effVVZwBm8qMf/UhLyQBrfU4mxjiGHgCR5R0ZdfhZRwDFBgCAZwgFXwBS0Sm7a8rbswDZTMo24sI5JwApJXn33Xct7wDWkbNY3Pe1CQA4xa1bt9y3vgD1rZVwcvPmTQCte3XHuUtjdwB390uHjQEAwADTNU0jOzs7xwCuFpTZWlWVuwB371p5/MEHHwDIWe60+VoGnACj3L592925cwDnC7M19empdQB938vjx49pVwABAHBKly9fHgCPdK+rT1OtuwB//769++67FwDquPLXKhC89gDaa+6dd96R+QB8rru7u1/8ywQo+QBY03raqEcASknef/99+/hA44/ZuQIAFQDAADH8f0I8DDOrCFfXGoEHSUVORACuQmCC'
$e3 = _1a2($e3)
Local $e1 = DllStructCreate('byte[' & BinaryLen($e3) & ']')
DllStructSetData($e1, 1, $e3)
Local $e2
_1a3($e1, $e2, 8536)
$e1 = 0
Local Const $dx = Binary(DllStructGetData($e2, 1))
If $du Then
Local Const $dy = FileOpen($dv & "\Sombra_hWnd_Opcoes.png", 18)
If @error Then Return SetError(1, 0, 0)
FileWrite($dy, $dx)
FileClose($dy)
EndIf
Return $dx
EndFunc
Func _1a2($e4)
Local $e5 = DllCall("Crypt32.dll", "bool", "CryptStringToBinaryA", "str", $e4, "dword", 0, "dword", 1, "ptr", 0, "dword*", 0, "ptr", 0, "ptr", 0)
If @error Or Not $e5[0] Then Return SetError(1, 0, "")
Local $e6 = DllStructCreate("byte[" & $e5[5] & "]")
$e5 = DllCall("Crypt32.dll", "bool", "CryptStringToBinaryA", "str", $e4, "dword", 0, "dword", 1, "struct*", $e6, "dword*", $e5[5], "ptr", 0, "ptr", 0)
If @error Or Not $e5[0] Then Return SetError(2, 0, "")
Return DllStructGetData($e6, 1)
EndFunc
Func _1a3(ByRef $2o, ByRef $e7, $e8)
$e7 = DllStructCreate("byte[" & $e8 & "]")
If @error Then Return SetError(1, 0, 0)
Local $0z = DllCall("ntdll.dll", "uint", "RtlDecompressBuffer", "ushort", 0x0002, "struct*", $e7, "ulong", $e8, "struct*", $2o, "ulong", DllStructGetSize($2o), "ulong*", 0)
If @error Then Return SetError(2, 0, 0)
If $0z[0] Then Return SetError(3, $0z[0], 0)
Return $0z[6]
EndFunc
_142()
_0("RunMe")
Global $e9
Global $ea = 0x1
Global $eb, $ec, $ed
Global $ee = 0x1, $ef = 0x1
Global $eg
Global $eh
Global $ei = 0x1
Global $ej = @ScriptDir & '\Config.ini'
Global $ek = IniRead($ej, 'BitRate', 1, '8')
Global $el = IniRead($ej, 'Wifi', 1, 'False')
$em = _13y("SmartConnect", 641, 376, -1, -1, True)
GUISetFont(11, 400, 0, "Segoe UI")
$70 = _141(True, False, True, False, False)
$en = $70[0]
$eo = $70[1]
$ep = $70[2]
$eq = $70[3]
$er = $70[4]
$es = $70[5]
$et = $70[6]
_15y(@TempDir & '\Logo_SmartConnect.png', '', 15, 15, 224, 59)
GUICtrlCreateLabel("Configurar o dispositivo pela primeira vez", 184, 98, 282, 24)
$eu = _14d("Configurar agora", 240, 128, 155, 33)
GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
GUICtrlCreateLabel("Conectar smartphone", 240, 184, 146, 24)
$ev = _14d("Conectar", 240, 216, 155, 33)
GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
$ew = GUICtrlCreateGraphic(24, 304, 592, 1)
GUICtrlSetBkColor(-1, 0xBFBFBF)
$ex = GUICtrlCreateLabel("Sobre", 24, 336, 34, 17)
GUICtrlSetFont(-1, 8, 400, 0, "Segoe UI")
$ey = _14d("Atalhos", 320, 320, 139, 33)
GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
$ez = _14d("Opções", 472, 320, 139, 33)
GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
_17r($em, 3, 3, 20, 20)
GUISetState(@SW_SHOW)
_1a8()
GUISwitch($em)
While 1
$f0 = GUIGetMsg()
Switch $f0
Case -3, $en
_140($em)
Exit
Case $eq
GUISetState(@SW_MINIMIZE, $em)
Case $eu
_1a6('Recurso indisponivel no momento', True)
Case $ev
If $el = 'False' Then
_1a6('Aguarde. . .')
Run(StringFormat('%s %s "%s\scrcpy.exe" -b %sM --max-fps 30', @ComSpec, '/c', @ScriptDir, $ek), '', @SW_HIDE)
Else
Local $f1 = InputBox('SmartConnect', StringFormat('O dispositivo deve estar na mesma rede WiFi %s%s Digite o ip do smartphone', @CRLF, @CRLF),'')
If $f1 <> '' Then
_1a6('Aguarde. . .')
Local $f2 = Run(StringFormat('%s %s "%s\adb.exe" connect %s:5555', @ComSpec, '/c', @ScriptDir, $f1))
ProcessWaitClose($f2)
Run(StringFormat('%s %s "%s\scrcpy.exe" -b %sM --max-fps 30', @ComSpec, '/c', @ScriptDir, $ek), '', @SW_HIDE)
EndIf
EndIf
Case $ey
_1a4()
Case $ea
_140($e9)
$e9 = ''
Case $ez
_1a5()
Case $ee
Local $f3 = GUICtrlRead($ee)
GUICtrlSetData($ed, StringFormat('Configure o bit rate (%s)', $f3))
IniWrite($ej, 'BitRate', 1, $f3)
$ek = IniRead($ej, 'BitRate', 1, 8)
Case $ec
If GUICtrlRead($ec) = 1 Then
IniWrite($ej, 'Wifi', 1, 'True')
Local $f2 = Run(StringFormat('%s\adb.exe tcpip 5555', @ScriptDir), '', @SW_HIDE)
ProcessWaitClose($f2)
Local $f2 = Run(StringFormat('%s\adb.exe tcpip 5555', @ScriptDir), '', @SW_HIDE)
ProcessWaitClose($f2)
MsgBox(0, '', 'Desconecte o cabo')
Else
IniWrite($ej, 'Wifi', 1, 'False')
EndIf
$el = IniRead($ej, 'Wifi', 1, 'False')
Case $ef
_140($eb)
$eb = ''
_0("RunMe")
Case $ei
_140($eh)
Case $ex
MsgBox(262144+64, 'SmartConnect', 'Interface criada em Autoit' & @CRLF & @CRLF & 'Rodrigo Chaves Neto')
EndSwitch
WEnd
Func _1a4()
If $e9 = '' Then
$e9 = GUICreate("SmartConnect - Atalhos", 499, 628, 125, -90, 0x80000000, 0x00000040, $em)
GUISetBkColor(0x0D1117)
_15y(@TempDir & '\Atalhos.png', '', 30, 20, 441, 550)
GUICtrlSetState(-1, 128)
$ea = _14d("Fechar", 376, 580, 83, 33)
_17r($e9, 3, 3, 20, 20)
GUISetState(@SW_SHOW)
EndIf
EndFunc
Func _1a5()
If $eb = '' Then
_0("StoreApp")
$eb = GUICreate("SmartConnect - Opções", 513, 254, 75, 55, 0x80000000, 0x00000040, $em)
GUISetBkColor($0)
GUISetFont(10, 400, 0, "Segoe UI")
$ed = GUICtrlCreateLabel(StringFormat("Configure o bit rate (%s)", $ek), 80, 40, 150, 21)
$ee = GUICtrlCreateSlider(80, 72, 198, 45)
GUICtrlSetLimit(-1, 50, 1)
GUICtrlSetData(-1, $ek)
GUICtrlSetBkColor(-1, $0)
GUICtrlCreateLabel("Conectar por Wifi", 80, 120, 127, 21)
$ec = GUICtrlCreateCheckbox("Habilitar", 88, 152, 97, 17)
If $el = 'True' Then GUICtrlSetState($ec, 1)
$ef = _14d("Fechar", 360, 192, 115, 33)
_17r($eb, 3, 3, 20, 20)
GUISetState(@SW_SHOW)
_1a9()
GUISwitch($eb)
EndIf
EndFunc
Func _1a6($f4, $f5 = False)
_0("StoreApp")
$eh = GUICreate("SmartConnect - Mensagem", 433, 169, 110, 90, 0x80000000, 0x00000040, $em)
GUISetFont(10, 400, 0, "Segoe UI")
GUISetBkColor($0)
Local $f6 = WinGetPos($eh)
GUICtrlCreateLabel($f4, 0, 40, $f6[2] - 2, 21, 0x1)
GUICtrlSetColor(-1, $1)
If $f5 = False Then
GUICtrlCreateProgress(105, 72, 222, 9, 0x8)
_ls(GUICtrlGetHandle(-1), $au, True, 30)
AdlibRegister('_1a7', 5000)
Else
$ei = _14d("Fechar", 312, 120, 91, 33)
EndIf
_17r($eh, 3, 3, 20, 20)
GUISetState(@SW_SHOW)
_0("RunMe")
EndFunc
Func _1a7()
_140($eh)
AdlibUnRegister('_1a7')
EndFunc
Func _1a8()
$f7 = GUICreate("", 656, 410, 28, 9, 0x80000000, 0x00000040 + 0x00080000, $em)
Local $f8 = _gg(@TempDir & "\Sombra_hWnd_Main.png")
For $1a = 0 To 255 Step 10
_1aa($1a, $f7, $f8)
Next
GUISetState(@SW_SHOWNA)
GUISetState(@SW_DISABLE)
EndFunc
Func _1a9()
$eg = GUICreate("", 568, 310, -11, -13, 0x80000000, 0x00000040 + 0x00080000, $eb)
Local $f9 = _gg(@TempDir & "\Sombra_hWnd_Opcoes.png")
For $1a = 0 To 255 Step 10
_1aa($1a, $eg, $f9)
Next
GUISetState(@SW_SHOWNA)
GUISetState(@SW_DISABLE)
EndFunc
Func _1aa($1a, $fa, $fb)
Local $fc, $fd, $1q, $fe, $ff, $3c, $16, $e1, $fg, $3g
Local Const $fh = 1
$fc = _54(0)
$fd = _4t($fc)
$1q = _cr($fb)
$fe = _2v($fd, $1q)
$3c = DllStructCreate($k)
$ff = DllStructGetPtr($3c)
DllStructSetData($3c, "X", _gf($fb))
DllStructSetData($3c, "Y", _g4($fb))
$e1 = DllStructCreate($i)
$16 = DllStructGetPtr($e1)
$3g = DllStructCreate($n)
$fg = DllStructGetPtr($3g)
DllStructSetData($3g, "Alpha", $1a)
DllStructSetData($3g, "Format", $fh)
_oo($fa, $fc, 0, $ff, $fd, $16, 0, $fg, 0x02)
_5a(0, $fc)
_2v($fd, $fe)
_2l($1q)
_4u($fd)
Sleep(5)
GUISetState()
EndFunc
