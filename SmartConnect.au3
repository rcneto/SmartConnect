#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16.0
 Author:         Rodrigo Chaves

 Script Function:
	SmartConnect v2
	03/2022

#ce ----------------------------------------------------------------------------


;!Highly recommended for improved overall performance and responsiveness of the GUI effects etc.! (after compiling):
#AutoIt3Wrapper_Run_Au3Stripper=y
#Au3Stripper_Parameters=/so /rm /pe

;YOU NEED TO EXCLUDE FOLLOWING FUNCTIONS FROM AU3STRIPPER, OTHERWISE IT WON'T WORK:
#Au3Stripper_Ignore_Funcs=_iHoverOn,_iHoverOff,_iFullscreenToggleBtn,_cHvr_CSCP_X64,_cHvr_CSCP_X86,_iControlDelete
;Please not that Au3Stripper will show errors. You can ignore them as long as you use the above Au3Stripper_Ignore_Funcs parameters.

;Required if you want High DPI scaling enabled. (Also requries _Metro_EnableHighDPIScaling())
#AutoIt3Wrapper_Res_HiDpi=y
; ===============================================================================================================================

#NoTrayIcon
#include <MetroGUI_UDF.au3>
#include <GUIConstants.au3>
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <SliderConstants.au3>
#include <GDIPlus.au3>
#include <GifAnimation.au3>
#include <UDF_RoundCorners.au3>
#include <UDF_AnimateWindow.au3>
#include <UDF\UDF_Imagens.au3>

;=======================================================================Creating the GUI===============================================================================
;Enable high DPI support: Detects the users DPI settings and resizes GUI and all controls to look perfectly sharp.
_Metro_EnableHighDPIScaling() ;

;Set Theme
_SetTheme("RunMe") ;See MetroThemes.au3 for selectable themes or to add more

Global $hWnd_Atalhos
Global $idBtn_Fechar_Atalhos = 0x1

Global $hWnd_Opcoes, $idCheck_Habilitado, $sLabel_BitRate
Global $Slider1 = 0x1, $idBtn_Fechar_Opcoes = 0x1

Global $hWnd_ShadowOpcoes

Global $hWnd_Mensagem
Global $idBtn_Fechar_Mensagem = 0x1

Global $fConfig = @ScriptDir & '\Config.ini'
Global $rBitRate = IniRead($fConfig, 'BitRate', 1, '8')
Global $rWiFi = IniRead($fConfig, 'Wifi', 1, 'False')

$hWnd_Main = _Metro_CreateGUI("SmartConnect", 641, 376, -1, -1, True)
GUISetFont(11, 400, 0, "Segoe UI")

;Add/create control buttons to the GUI
$Control_Buttons = _Metro_AddControlButtons(True, False, True, False, False) ;CloseBtn = True, MaximizeBtn = True, MinimizeBtn = True, FullscreenBtn = True, MenuBtn = True

;Set variables for the handles of the GUI-Control buttons. (Above function always returns an array this size and in this order, no matter which buttons are selected.)
$GUI_CLOSE_BUTTON = $Control_Buttons[0]
$GUI_MAXIMIZE_BUTTON = $Control_Buttons[1]
$GUI_RESTORE_BUTTON = $Control_Buttons[2]
$GUI_MINIMIZE_BUTTON = $Control_Buttons[3]
$GUI_FULLSCREEN_BUTTON = $Control_Buttons[4]
$GUI_FSRestore_BUTTON = $Control_Buttons[5]
$GUI_MENU_BUTTON = $Control_Buttons[6]

_GUICtrlCreateGIF(@TempDir & '\Logo_SmartConnect.png', '', 15, 15, 224, 59)

GUICtrlCreateLabel("Configurar o dispositivo pela primeira vez", 184, 98, 282, 24)
$idBtn_ConfigurarAgora = _Metro_CreateButtonEx2("Configurar agora", 240, 128, 155, 33)
GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")

GUICtrlCreateLabel("Conectar smartphone", 240, 184, 146, 24)
$idBtn_Conectar = _Metro_CreateButtonEx2("Conectar", 240, 216, 155, 33)
GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")

$Graphic1 = GUICtrlCreateGraphic(24, 304, 592, 1)
GUICtrlSetBkColor(-1, 0xBFBFBF)

$idBtn_Sobre = GUICtrlCreateLabel("Sobre", 24, 336, 34, 17)
GUICtrlSetFont(-1, 8, 400, 0, "Segoe UI")

$idBtn_Atalhos = _Metro_CreateButtonEx2("Atalhos", 320, 320, 139, 33)
GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")

$idBtn_Opcoes = _Metro_CreateButtonEx2("Opções", 472, 320, 139, 33)
GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")

_RoundCorners($hWnd_Main, 3, 3, 20, 20)
GUISetState(@SW_SHOW)

shadow_hWnd_Main()
GUISwitch($hWnd_Main)

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE, $GUI_CLOSE_BUTTON
			_Metro_GUIDelete($hWnd_Main)
			Exit

		Case $GUI_MINIMIZE_BUTTON
			GUISetState(@SW_MINIMIZE, $hWnd_Main)

		Case $idBtn_ConfigurarAgora
			hWnd_Mensagem('Recurso indisponivel no momento', True)

		Case $idBtn_Conectar
			If $rWiFi = 'False' Then
				hWnd_Mensagem('Aguarde. . .')
				Run(StringFormat('%s %s "%s\scrcpy.exe" -b %sM --max-fps 30', @ComSpec, '/c', @ScriptDir, $rBitRate), '', @SW_HIDE)
			Else
				Local $idInput = InputBox('SmartConnect', StringFormat('O dispositivo deve estar na mesma rede WiFi %s%s Digite o ip do smartphone', @CRLF, @CRLF),'')
				If $idInput <> '' Then
					hWnd_Mensagem('Aguarde. . .')
					Local $iPID = Run(StringFormat('%s %s "%s\adb.exe" connect %s:5555', @ComSpec, '/c', @ScriptDir, $idInput));, '', @SW_HIDE)
					ProcessWaitClose($iPID)
					Run(StringFormat('%s %s "%s\scrcpy.exe" -b %sM --max-fps 30', @ComSpec, '/c', @ScriptDir, $rBitRate), '', @SW_HIDE)
					;~ Run(StringFormat('%s %s "%s\scrcpy.exe" -b %sM --max-fps 30', @ComSpec, '/c', @ScriptDir, $rBitRate))
				EndIf
			EndIf

		Case $idBtn_Atalhos
			hWnd_Atalhos()
		
		Case $idBtn_Fechar_Atalhos
			_WinAPI_AnimateWindow($hWnd_Atalhos, $tAW.fadeOut, 250)
			_Metro_GUIDelete($hWnd_Atalhos)
			$hWnd_Atalhos = ''

		Case $idBtn_Opcoes
			hWnd_Opcoes()

		Case $Slider1
			Local $iPosSlider = GUICtrlRead($Slider1)
			GUICtrlSetData($sLabel_BitRate, StringFormat('Configure o bit rate (%s)', $iPosSlider))
			IniWrite($fConfig, 'BitRate', 1, $iPosSlider)
			$rBitRate = IniRead($fConfig, 'BitRate', 1, 8)

		Case $idCheck_Habilitado
			If GUICtrlRead($idCheck_Habilitado) = $GUI_CHECKED Then
				IniWrite($fConfig, 'Wifi', 1, 'True')
				Local $iPID = Run(StringFormat('%s\adb.exe tcpip 5555', @ScriptDir), '', @SW_HIDE)
				ProcessWaitClose($iPID)				
				Local $iPID = Run(StringFormat('%s\adb.exe tcpip 5555', @ScriptDir), '', @SW_HIDE)
				ProcessWaitClose($iPID)
				MsgBox(0, '', 'Desconecte o cabo')
			Else
				IniWrite($fConfig, 'Wifi', 1, 'False')
			EndIf
			$rWiFi = IniRead($fConfig, 'Wifi', 1, 'False')

		Case $idBtn_Fechar_Opcoes
			_WinAPI_AnimateWindow($hWnd_Opcoes, $tAW.fadeOut, 250)
			_Metro_GUIDelete($hWnd_Opcoes)
			$hWnd_Opcoes = ''
			_SetTheme("RunMe")

		Case $idBtn_Fechar_Mensagem
			_Metro_GUIDelete($hWnd_Mensagem)

	EndSwitch
WEnd

Func hWnd_Atalhos()
	If $hWnd_Atalhos = '' Then
		$hWnd_Atalhos = GUICreate("SmartConnect - Atalhos", 499, 628, 125, -90, $WS_POPUP, $WS_EX_MDICHILD, $hWnd_Main)
		GUISetBkColor(0x0D1117)

		_GUICtrlCreateGIF(@TempDir & '\Atalhos.png', '', 30, 20, 441, 550)
		GUICtrlSetState(-1, $GUI_DISABLE)

		$idBtn_Fechar_Atalhos = _Metro_CreateButtonEx2("Fechar", 376, 580, 83, 33)
		_RoundCorners($hWnd_Atalhos, 3, 3, 20, 20)
		_WinAPI_AnimateWindow($hWnd_Atalhos, $tAW.explode, 250)
		GUISetState(@SW_SHOW)
	EndIf
EndFunc

Func hWnd_Opcoes()
	If $hWnd_Opcoes = '' Then
		_SetTheme("StoreApp")
		$hWnd_Opcoes = GUICreate("SmartConnect - Opções", 513, 254, 75, 55, $WS_POPUP, $WS_EX_MDICHILD, $hWnd_Main)
		GUISetBkColor($GUIThemeColor)
		GUISetFont(10, 400, 0, "Segoe UI")
		
		$sLabel_BitRate = GUICtrlCreateLabel(StringFormat("Configure o bit rate (%s)", $rBitRate), 80, 40, 150, 21)
		$Slider1 = GUICtrlCreateSlider(80, 72, 198, 45)
		GUICtrlSetLimit(-1, 50, 1)
		GUICtrlSetData(-1, $rBitRate)
		GUICtrlSetBkColor(-1, $GUIThemeColor)
		
		GUICtrlCreateLabel("Conectar por Wifi", 80, 120, 127, 21)
		$idCheck_Habilitado = GUICtrlCreateCheckbox("Habilitar", 88, 152, 97, 17)
		If $rWiFi = 'True' Then GUICtrlSetState($idCheck_Habilitado, $GUI_CHECKED)
		$idBtn_Fechar_Opcoes = _Metro_CreateButtonEx2("Fechar", 360, 192, 115, 33)

		_RoundCorners($hWnd_Opcoes, 3, 3, 20, 20)
		_WinAPI_AnimateWindow($hWnd_Opcoes, $tAW.explode, 250)
		GUISetState(@SW_SHOW)
		shadow_hWnd_Opcoes()
		GUISwitch($hWnd_Opcoes)
	EndIf
EndFunc

Func hWnd_Mensagem($Mensagem, $BotaoFechar = False)
	_SetTheme("StoreApp")
	$hWnd_Mensagem = GUICreate("SmartConnect - Mensagem", 433, 169, 110, 90, $WS_POPUP, $WS_EX_MDICHILD, $hWnd_Main)
	GUISetFont(10, 400, 0, "Segoe UI")
	GUISetBkColor($GUIThemeColor)
	Local $aGetPos = WinGetPos($hWnd_Mensagem)
	GUICtrlCreateLabel($Mensagem, 0, 40, $aGetPos[2] - 2, 21, $SS_CENTER)
	GUICtrlSetColor(-1, $FontThemeColor)
	If $BotaoFechar = False Then
		GUICtrlCreateProgress(105, 72, 222, 9, 0x8)
		_SendMessage(GUICtrlGetHandle(-1), $PBM_SETMARQUEE, True, 30)
		AdlibRegister('fechar_Mensagem_Auto', 5000)
	Else
		$idBtn_Fechar_Mensagem = _Metro_CreateButtonEx2("Fechar", 312, 120, 91, 33)
	EndIf
	_RoundCorners($hWnd_Mensagem, 3, 3, 20, 20)
	_WinAPI_AnimateWindow($hWnd_Mensagem, $tAW.explode, 250)
	GUISetState(@SW_SHOW)
	_SetTheme("RunMe")
EndFunc

Func fechar_Mensagem_Auto()
	_Metro_GUIDelete($hWnd_Mensagem)
	AdlibUnRegister('fechar_Mensagem_Auto')
EndFunc

Func shadow_hWnd_Main()
	$hWnd_ShadowApp = GUICreate("", 656, 410, 28, 9, $WS_POPUP, $WS_EX_MDICHILD + $WS_EX_LAYERED, $hwnd_Main)
	Local $iSplashShadowApp = _GDIPlus_ImageLoadFromFile(@TempDir & "\Sombra_hWnd_Main.png")
	For $i = 0 To 255 Step 10
		drawPNG($i, $hWnd_ShadowApp, $iSplashShadowApp)
	Next
	GUISetState(@SW_SHOWNA)
	GUISetState(@SW_DISABLE)
EndFunc   ;==>shadowApp

Func shadow_hWnd_Opcoes()
	$hWnd_ShadowOpcoes = GUICreate("", 568, 310, -11, -13, $WS_POPUP, $WS_EX_MDICHILD + $WS_EX_LAYERED, $hWnd_Opcoes)
	Local $iSplashShadowOpcoes = _GDIPlus_ImageLoadFromFile(@TempDir & "\Sombra_hWnd_Opcoes.png")
	For $i = 0 To 255 Step 10
		drawPNG($i, $hWnd_ShadowOpcoes, $iSplashShadowOpcoes)
	Next
	GUISetState(@SW_SHOWNA)
	GUISetState(@SW_DISABLE)
EndFunc   ;==>shadowApp

Func drawPNG($i, $sStrGui, $sStrSplashImage)
	Local $hScrDC, $hMemDC, $hBitmap, $hOld, $pSize, $tSize, $pSource, $tSource, $pBlend, $tBlend
	Local Const $AC_SRC_ALPHA = 1
	$hScrDC = _WinAPI_GetDC(0)
	$hMemDC = _WinAPI_CreateCompatibleDC($hScrDC)
	$hBitmap = _GDIPlus_BitmapCreateHBITMAPFromBitmap($sStrSplashImage)
	$hOld = _WinAPI_SelectObject($hMemDC, $hBitmap)
	$tSize = DllStructCreate($tagSIZE)
	$pSize = DllStructGetPtr($tSize)
	DllStructSetData($tSize, "X", _GDIPlus_ImageGetWidth($sStrSplashImage))
	DllStructSetData($tSize, "Y", _GDIPlus_ImageGetHeight($sStrSplashImage))
	$tSource = DllStructCreate($tagPOINT)
	$pSource = DllStructGetPtr($tSource)
	$tBlend = DllStructCreate($tagBLENDFUNCTION)
	$pBlend = DllStructGetPtr($tBlend)
	DllStructSetData($tBlend, "Alpha", $i)
	DllStructSetData($tBlend, "Format", $AC_SRC_ALPHA)
	_WinAPI_UpdateLayeredWindow($sStrGui, $hScrDC, 0, $pSize, $hMemDC, $pSource, 0, $pBlend, $ULW_ALPHA)
	_WinAPI_ReleaseDC(0, $hScrDC)
	_WinAPI_SelectObject($hMemDC, $hOld)
	_WinAPI_DeleteObject($hBitmap)
	_WinAPI_DeleteDC($hMemDC)
	Sleep(5)
	GUISetState()
EndFunc   ;==>drawPNG