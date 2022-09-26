#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=MaterialDesign\CSN_Logo.ico
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_Res_Description=Popup Termo de Posse
#AutoIt3Wrapper_Res_Fileversion=1.0.1.9
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#AutoIt3Wrapper_Res_ProductName=Popup Termo de Posse
#AutoIt3Wrapper_Res_ProductVersion=1.0.1.1
#AutoIt3Wrapper_Res_CompanyName=Stefanini
#AutoIt3Wrapper_Res_LegalCopyright=Stefanini
#AutoIt3Wrapper_Res_LegalTradeMarks=Stefanini
#AutoIt3Wrapper_Res_Language=1033
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=MaterialDesign\CSN_Logo.ico
#AutoIt3Wrapper_Res_Description=Popup Termo de Posse
#AutoIt3Wrapper_Res_Fileversion=1.0.1.9
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#AutoIt3Wrapper_Res_ProductName=Popup Termo de Posse
#AutoIt3Wrapper_Res_ProductVersion=1.0.1.1
#AutoIt3Wrapper_Res_CompanyName=Stefanini
#AutoIt3Wrapper_Res_LegalCopyright=Stefanini
#AutoIt3Wrapper_Res_LegalTradeMarks=Stefanini
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=MaterialDesign\CSN_Logo.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         Erik Cesar de Oliveira - ERIKOLIV
				 Rodrigo Chaves Neto - RCNETO

 Script Function:
	Popup para coleta de informações de equipamentos CSN

#ce ----------------------------------------------------------------------------


#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <GifAnimation.au3>
#include <GUIScroll.au3>
#include <SendMessage.au3>
#include <EditConstants.au3>
#include <Array.au3>
#include <String.au3>
#include <FontConstants.au3>
#include "UDF\UDF_GetSessionUser.au3"
#include "UDF\UDF_Embedded.au3"
#include <Excel.au3>
#include <ADO.au3>

_ADO_COMErrorHandler_UserFunction(_ADO_COMErrorHandler)
_ExtractCSNLogo(True)

;Variáveis e inicializações globais
Global $hWnd_Main
Global Const $iStep = 100
Global $cacheDir = @ScriptDir
Global $fCache = $cacheDir & '\Cache.ini'
Global $userName = _GetUsername('fname', True)
If $userName = "" Then $userName = _GetUsername()
Global $aAcessorio[7]
Global $sTermo = 'DECLARO PARA OS DEVIDOS FINS, QUE TENHO SOB MINHA RESPONSABILIDADE OS ITENS ABAIXO DISCRIMINADOS EM BOM ESTADO DE CONSERVAÇÃO E EM PLENO FUNCIONAMENTO, OS QUAIS ME RESPONSABILIZO PELA GUARDA E CONSERVAÇÃO, NÃO PODENDO, SEM AUTORIZAÇÃO DA DIRETORIA DE INFORMÁTICA, EMPRESTÁ-LO(S) A QUALQUER OUTRA PESSOA, MESMO QUE COLABORADOR DA CSN;' & @CRLF & @CRLF & 'OUTROSSIM, ME COMPROMETO A CUMPRIR TODAS AS NORMAS EXIGÍVEIS A SUA UTILIZAÇÃO, DEVENDO OBSERVAR AINDA:' & @CRLF & '- COMPROMETO-ME A SEGUIR TODAS AS RECOMENDAÇÕES DA ÁREA DE INFORMÁTICA, VISANDO GARANTIR A SEGURANÇA DAS INFORMAÇÕES ARMAZENADAS E A PROTEÇÃO DOS DADOS;' & @CRLF & @CRLF & '- EM CASO DE PERDA, ROUBO OU FURTO DEVEREI COMUNICAR IMEDIATAMENTE A ÁREA DE INFORMÁTICA. ASSIM COMO DEVEREI FORMALIZAR UM B.O. (BOLETIM DE COCORRÊNCIA) E ENTREGAR O ORIGINAL Á ÁREA DE INFORMÁTICA;' & @CRLF & '- EM CASO DE DESLIGAMENTO, IMEDIATAMENTE DEVO DEVOLVER AO SUPERIROR IMEDIATO (NÍVEL MÍNIMO GERENCIAL) O EQUIPAMENTO E OS RESPECTIVOS ACESSÓRIOS. NÃO HAVENDO A DEVOLUÇÃO, O CUSTO DO(S) EQUIPAMENTO(S) SERÁ(ÃO) DESCONTADO(S) NA RECISÃO CONTRATUAL.'

Global $matricula, $identificacaoEquipamento, $modoUso, $acessorio, $localizacaoEmpresa, $complementoLocalizacao, $gerencia, $tipoEquipamento
Global $cI_CompName = @ComputerName
Global $wbemFlagReturnImmediately = 0x10 ;DO NOT CHANGE
Global $wbemFlagForwardOnly = 0x20   ;DO NOT CHANGE


If Not FileExists($cacheDir & "\Cache.ini") Then _ExtractCacheIni(True)
If IniRead($cacheDir & "\Cache.ini", "identificacaoEquipamento", 1, "Vazio") = "False" Then IniWrite($cacheDir & "\Cache.ini", "identificacaoEquipamento", 1, @ComputerName)
IniWrite($cacheDir & "\Cache.ini", "userName", 1, StringUpper(_GetUsername()))

;Inicio do Popup
$hWnd_ScreenLock = GUICreate("", @DesktopWidth + 50, @DesktopHeight + 50, -1, -1, $WS_POPUP, $WS_EX_TOPMOST)
GUISetBkColor(0x000000, $hWnd_ScreenLock)
GUISetState(@SW_SHOW, $hWnd_ScreenLock)
GUISetState(@SW_DISABLE, $hWnd_ScreenLock)
WinSetTrans($hWnd_ScreenLock, "", 200)

hWnd_Alert()

Func hWnd_Form()

	$hWnd_Main = GUICreate("", 961, 601, (@DesktopWidth / 2) - 480.5, (@DesktopHeight / 2) - 250.5, $WS_POPUP, $WS_EX_MDICHILD, $hWnd_ScreenLock)
	GUISetFont(10, 400, 0, "Segoe UI")
	$aGetPos = WinGetPos($hWnd_Main)
	_GUICtrlCreateGIF($img_Extract_CSN_Logo, '', 40, 10, 212, 118)
	$Label1 = GUICtrlCreateLabel("Termo de responsabilidade de equipamento de TI", 0, 120, $aGetPos[2] - 1, 34, $SS_CENTER)
	GUICtrlSetFont(-1, 16, 400, 0, "Segoe UI")
	$Label2 = GUICtrlCreateLabel($sTermo, 70, 170, 834, 389)

	GUICtrlCreateLabel('Olá ' & $userName & ', quando enviar este formulário, todos os dados preenchidos serão exibidos para o proprietário do formulário.' & @CRLF & @CRLF & '* Obrigatória', 70, 430, 900, 35)

	;Matrícula
	Local $sLeft = 70, $sTop = 470, $sHeight = 810
	GUICtrlCreateLabel('     Matrícula:*', $sLeft, $sTop, $sHeight, 70, $SS_CENTERIMAGE)
	GUICtrlSetBkColor(-1, 0xdddddd)
	GUICtrlSetColor(-1, 0x000000)
	GUICtrlCreateLabel('1', $sLeft + 20, $sTop, 21, 21, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	GUICtrlSetBkColor(-1, 0x000000)
	GUICtrlSetColor(-1, 0xFFFFFF)
	Local $idInput_Matricula = GUICtrlCreateInput(_GetUsername(), 70, $sTop + 75, $sHeight, 25, $SS_CENTERIMAGE)
	GUICtrlSetState($idInput_Matricula, $GUI_DISABLE)
	IniWrite($fCache, "matricula", 1, _GetUsername())
	GUICtrlSetFont(-1, 10, 400, 0, 'Segoe UI', 0)

	;Identificação do equipamento
	Local $sLeft = 70, $sTop = 600, $sHeight = 810
	GUICtrlCreateLabel('     Identificação do equipamento:*', $sLeft, $sTop, $sHeight, 70, $SS_CENTERIMAGE)
	GUICtrlSetBkColor(-1, 0xdddddd)
	GUICtrlSetColor(-1, 0x000000)
	_GUICtrlCreateGIF($img_Extract_ExHostname, '', $sLeft + 320, $sTop + 2, 207, 65)
	GUICtrlSetState(-1, $GUI_DISABLE)
	GUICtrlCreateLabel(@ComputerName, $sLeft + 330, $sTop + 45, 205, 21, $SS_CENTER)
	GUICtrlSetBkColor(-1, -2)
	GUICtrlSetColor(-1, 0x6e6e6e)
	GUICtrlCreateLabel('     Ex.: ACFL0001', $sLeft, $sTop + 45, 200, 21)
	GUICtrlSetFont(-1, 10, 400, 2, 'Segoe UI', 0)
	GUICtrlSetColor(-1, 0x6e6e6e)
	GUICtrlSetBkColor(-1, -2)
	GUICtrlCreateLabel('2', $sLeft + 20, $sTop, 21, 21, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	GUICtrlSetBkColor(-1, 0x000000)
	GUICtrlSetColor(-1, 0xFFFFFF)
	Local $idInput_IdentificacaoEquipamento = GUICtrlCreateInput(@ComputerName, 70, $sTop + 75, $sHeight, 25, $SS_CENTERIMAGE)
	GUICtrlSetState($idInput_IdentificacaoEquipamento, $GUI_DISABLE)
	GUICtrlSetFont(-1, 10, 400, 0, 'Segoe UI', 0)

	;Modo de uso
	Local $sLeft = 70, $sTop = 730, $sHeight = 810
	GUICtrlCreateLabel('     Modo de uso:*', $sLeft, $sTop, $sHeight, 70, $SS_CENTERIMAGE)
	GUICtrlSetBkColor(-1, 0xdddddd)
	GUICtrlSetColor(-1, 0x000000)
	GUICtrlCreateLabel('     Em caso de computador compartilhado , o preenchimento como proprietário deverá ser o superior imediato', $sLeft, $sTop + 45, $sHeight, 21)
	GUICtrlSetFont(-1, 10, 400, 2, 'Segoe UI', 0)
	GUICtrlSetColor(-1, 0x6e6e6e)
	GUICtrlSetBkColor(-1, -2)
	GUICtrlCreateLabel('3', $sLeft + 20, $sTop, 21, 21, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	GUICtrlSetBkColor(-1, 0x000000)
	GUICtrlSetColor(-1, 0xFFFFFF)
	GUIStartGroup()
	Local $idRadio_ModoUsoIndividual = GUICtrlCreateRadio('Individual', $sLeft, $sTop + 75, $sHeight, 25)
	GUICtrlSetFont(-1, 10, 400, 0, 'Segoe UI', 0)
	Local $idRadio_ModoUsoCompartilhado = GUICtrlCreateRadio('Compartilhado', $sLeft, $sTop + 105, $sHeight, 25)
	GUICtrlSetFont(-1, 10, 400, 0, 'Segoe UI', 0)

	;Acessórios
	Local $sLeft = 70, $sTop = 880, $sHeight = 810
	GUICtrlCreateLabel('     Acessórios', $sLeft, $sTop, $sHeight, 70, $SS_CENTERIMAGE)
	GUICtrlSetBkColor(-1, 0xdddddd)
	GUICtrlSetColor(-1, 0x000000)
	GUICtrlCreateLabel('     Somente se utilizar', $sLeft, $sTop + 45, $sHeight, 21)
	GUICtrlSetFont(-1, 10, 400, 2, 'Segoe UI', 0)
	GUICtrlSetColor(-1, 0x6e6e6e)
	GUICtrlSetBkColor(-1, -2)
	GUICtrlCreateLabel('4', $sLeft + 20, $sTop, 21, 21, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	GUICtrlSetBkColor(-1, 0x000000)
	GUICtrlSetColor(-1, 0xFFFFFF)
	GUIStartGroup()
	Local $idCheck_AcessorioFonte = GUICtrlCreateCheckbox('Fonte', $sLeft, $sTop + 75, $sHeight, 25)
	GUICtrlSetFont(-1, 10, 400, 0, 'Segoe UI', 0)
	Local $idCheck_AcessorioBateria = GUICtrlCreateCheckbox('Bateria', $sLeft, $sTop + 105, $sHeight, 25)
	GUICtrlSetFont(-1, 10, 400, 0, 'Segoe UI', 0)
	Local $idCheck_AcessorioTravaSeguranca = GUICtrlCreateCheckbox('Trava de segurança', $sLeft, $sTop + 135, $sHeight, 25)
	GUICtrlSetFont(-1, 10, 400, 0, 'Segoe UI', 0)
	Local $idCheck_AcessorioMouse = GUICtrlCreateCheckbox('Mouse', $sLeft, $sTop + 165, $sHeight, 25)
	GUICtrlSetFont(-1, 10, 400, 0, 'Segoe UI', 0)
	Local $idCheck_AcessorioTeclado = GUICtrlCreateCheckbox('Teclado', $sLeft, $sTop + 195, $sHeight, 25)
	GUICtrlSetFont(-1, 10, 400, 0, 'Segoe UI', 0)
	Local $idCheck_AcessorioMaleta = GUICtrlCreateCheckbox('Maleta', $sLeft, $sTop + 225, $sHeight, 25)
	GUICtrlSetFont(-1, 10, 400, 0, 'Segoe UI', 0)
	Local $idCheck_AcessorioVazio = GUICtrlCreateCheckbox('', $sLeft, $sTop + 265, 13, 13)
	GUICtrlSetFont(-1, 10, 400, 0, 'Segoe UI', 0)
	Local $idInput_AcessorioOutro = GUICtrlCreateInput('Outro', $sLeft + 20, $sTop + 260, $sHeight, 21)
	GUICtrlSetState(-1, $GUI_DISABLE)

	;Localização / Empresa
	Local $sLeft = 70, $sTop = 1190, $sHeight = 810
	GUICtrlCreateLabel('     Localização / Empresa:*', $sLeft, $sTop, $sHeight, 70, $SS_CENTERIMAGE)
	GUICtrlSetBkColor(-1, 0xdddddd)
	GUICtrlSetColor(-1, 0x000000)
	GUICtrlCreateLabel('     ', $sLeft, $sTop + 45, 200, 21)
	GUICtrlSetFont(-1, 10, 400, 2, 'Segoe UI', 0)
	GUICtrlSetColor(-1, 0x6e6e6e)
	GUICtrlSetBkColor(-1, -2)
	GUICtrlCreateLabel('5', $sLeft + 20, $sTop, 21, 21, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	GUICtrlSetBkColor(-1, 0x000000)
	GUICtrlSetColor(-1, 0xFFFFFF)
	Local $idCombo_LocalizacaoEmpresa = GUICtrlCreateCombo('', 70, $sTop + 75, $sHeight, 25, BitOR($GUI_SS_DEFAULT_COMBO, $CBS_SIMPLE))
	GUICtrlSetData(-1, "CSN-ARARA-RJ|CSN-ARAUCARIA|CSN-CIMENTOS-ARCOS|CSN-ASIA-HONG KONG|CSN-CAMACARI|CSN-CAMPO GRANDE|CSN-CANOAS|CSN-CAXIAS DO SUL|CSN-CBSI-ARAUCARIA|CSN-CBSI-ARCOS|CSN-CBSI-CONGONHAS|CSN-CBSI-ITAGUAI|CSN-CBSI-SEDE-VOLTA REDONDA|CSN-CBSI-UPV-CIVIL-VOLTA REDONDA|CSN-CBSI-UPV-DAF-VOLTA REDONDA|CSN-CBSI-UPV-ESTRUTURA-VOLTA REDONDA|CSN-CBSI-VOLTA REDONDA|CSN-CBS-MINAS GERAIS|CSN-CBS-VILA OLIMPIA|CSN-CBS-VOLTA REDONDA|CSN-CIMENTOS-CAPUAVA|CSN-CIMENTOS-GUARULHOS|CSN-CIMENTOS-ITABORAI|CSN-CIMENTOS-JUIZ DE FORA|CSN-CIMENTOS-OSASCO|CSN-CIMENTOS-RIBEIRÃO PRETO|CSN-CIMENTOS-VOLTA REDONDA|CSN-CMIN-CONGONHAS|CSN-CMIN-ITAGUAI|CSN-CMIN-OURO PRETO|CSN-CMIN-RIO ACIMA|CSN-CMIN-SAO PAULO|CSN-CONTAGEM|CSN-CRICIUMA|CSN-ERSA-ARIQUEMES|CSN-ERSA-ITAPOA DO OESTE|CSN-FARIA LIMA-SEDE|CSN-FTL-COROATA|CSN-FTL-FORTALEZA|CSN-FTL-RECIFE|CSN-FTL-SAO LUIS|CSN-FTL-TERESINA|CSN-FUNDACAO CSN-CENTRO CULTURAL|CSN-FUNDACAO CSN-ESCOLA TECNICA PANDIA CALOGERAS|CSN-FUNDACAO CSN-HOTEL BELA VISTA|CSN-FUNDACAO CSN-RECREIO DO TRABALHADOR|CSN-FUNDACAO CSN-VOLTA REDONDA|CSN-HANDEL-AUSTRIA|CSN-JABOATAO DOS GUARARAPES|CSN-JOINVILE|CSN-MAUA-SP|CSN-MOOCA|CSN-PRADA-DISTRIBUICAO-Valença|CSN-PORTO REAL|CSN-PRADA-DISTRIBUICAO-BEBEDOURO|CSN-PRADA-DISTRIBUICAO-CONTAGEM|CSN-PRADA-DISTRIBUICAO-MOGI DAS CRUZES|CSN-PRADA-DISTRIBUICAO-PIRACICABA|CSN-PRADA-JUIZ DE FORA|CSN-PRADA-METALURGICA-LINS|CSN-PRADA-METALURGICA-LUZIANIA|CSN-PRADA-METALURGICA-PELOTAS|CSN-PRADA-METALURGICA-RESENDE|CSN-PRADA-METALURGICA-SANTO AMARO|CSN-PRADA-METALURGICA-UBERLANDIA|CSN-QUEIMADOS|CSN-RIO DE JANEIRO|CSN-SANTO AMARO|CSN-SAO JOSE DOS CAMPOS|CSN-SEPETIBA TECON-ITAGUAI|CSN-SEPETIBA TECON-RIO DE JANEIRO|CSN-TLSA-FORTALEZA|CSN-TLSA-ITAUEIRA|CSN-TLSA-JOAO PESSOA|CSN-TLSA-LAVRAS DA MANGABEIRA|CSN-TLSA-MACEIO|CSN-TLSA-MISSAO VELHA|CSN-TLSA-RECIFE|CSN-TLSA-SALGUEIRO|CSN-TLSA-SAO LUIS|CSN-TLSA-SIMPLICIO MENDES|CSN-TLSA-TERESINA|CSN-VOLTA REDONDA|CSN-ALHANDRA-FABRICA|CSN-ALHANDRA-MINERACAO|CSN-ALHANDRA-ESCRITÓRIO", "Selecione")

	GUICtrlSetFont(-1, 10, 400, 0, 'Segoe UI', 0)

	;Complemento da localização
	Local $sLeft = 70, $sTop = 1320, $sHeight = 810
	GUICtrlCreateLabel('     Complemento da localização:*', $sLeft, $sTop, $sHeight, 70, $SS_CENTERIMAGE)
	GUICtrlSetBkColor(-1, 0xdddddd)
	GUICtrlSetColor(-1, 0x000000)
	GUICtrlCreateLabel('     Ex.: Bloco 1, Andar 3, Sala XPTO', $sLeft, $sTop + 45, 200, 21)
	GUICtrlSetFont(-1, 10, 400, 2, 'Segoe UI', 0)
	GUICtrlSetColor(-1, 0x6e6e6e)
	GUICtrlSetBkColor(-1, -2)
	GUICtrlCreateLabel('6', $sLeft + 20, $sTop, 21, 21, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	GUICtrlSetBkColor(-1, 0x000000)
	GUICtrlSetColor(-1, 0xFFFFFF)
	Local $idEdit_ComplementoLocalizacao = GUICtrlCreateEdit('', 70, $sTop + 75, $sHeight, 65, BitOR($ES_AUTOVSCROLL, $ES_AUTOHSCROLL, $ES_WANTRETURN))
	GUICtrlSetFont(-1, 10, 400, 0, 'Segoe UI', 0)

	;Gerencia
	Local $sLeft = 70, $sTop = 1490, $sHeight = 810
	GUICtrlCreateLabel('     Gerência:', $sLeft, $sTop, $sHeight, 70, $SS_CENTERIMAGE)
	GUICtrlSetBkColor(-1, 0xdddddd)
	GUICtrlSetColor(-1, 0x000000)
	GUICtrlCreateLabel('', $sLeft + 330, $sTop + 45, 205, 21, $SS_CENTER)
	GUICtrlSetBkColor(-1, -2)
	GUICtrlSetColor(-1, 0x6e6e6e)
	GUICtrlCreateLabel('     Ex.: GTI', $sLeft, $sTop + 45, 200, 21)
	GUICtrlSetFont(-1, 10, 400, 2, 'Segoe UI', 0)
	GUICtrlSetColor(-1, 0x6e6e6e)
	GUICtrlSetBkColor(-1, -2)
	GUICtrlCreateLabel('7', $sLeft + 20, $sTop, 21, 21, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	GUICtrlSetBkColor(-1, 0x000000)
	GUICtrlSetColor(-1, 0xFFFFFF)
	Local $idInput_Gerencia = GUICtrlCreateInput('', 70, $sTop + 75, $sHeight, 25, $SS_CENTERIMAGE)
	GUICtrlSetFont(-1, 10, 400, 0, 'Segoe UI', 0)

	;Tipo de equipamento
	Local $sLeft = 70, $sTop = 1620, $sHeight = 810
	GUICtrlCreateLabel('     Tipo de equipamento:*', $sLeft, $sTop, $sHeight, 70, $SS_CENTERIMAGE)
	GUICtrlSetBkColor(-1, 0xdddddd)
	GUICtrlSetColor(-1, 0x000000)
	GUICtrlCreateLabel('     ', $sLeft, $sTop + 45, $sHeight, 21)
	GUICtrlSetFont(-1, 10, 400, 2, 'Segoe UI', 0)
	GUICtrlSetColor(-1, 0x6e6e6e)
	GUICtrlSetBkColor(-1, -2)
	GUICtrlCreateLabel('8', $sLeft + 20, $sTop, 21, 21, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	GUICtrlSetBkColor(-1, 0x000000)
	GUICtrlSetColor(-1, 0xFFFFFF)
	GUIStartGroup()
	Local $idRadio_TipoEquipamentoDesktop = GUICtrlCreateRadio('Desktop', $sLeft, $sTop + 75, $sHeight, 25)
	GUICtrlSetFont(-1, 10, 400, 0, 'Segoe UI', 0)
	Local $idRadio_TipoEquipamentoNotebook = GUICtrlCreateRadio('Notebook', $sLeft, $sTop + 105, $sHeight, 25)
	GUICtrlSetFont(-1, 10, 400, 0, 'Segoe UI', 0)

	;RG, Data de Expedição e Orgão Expedidor
	Local $sLeft = 70, $sTop = 1760, $sHeight = 810
	Local $idLabel_RGBackground = GUICtrlCreateLabel('', $sLeft, $sTop, $sHeight, 70, $SS_CENTERIMAGE)
	GUICtrlSetBkColor(-1, 0xdddddd)
	GUICtrlSetColor(-1, 0x000000)
	GUICtrlSetState(-1, $GUI_DISABLE)
	Local $idLabel_RGB = GUICtrlCreateLabel('     Informe o RG:*', $sLeft, $sTop, 110, 70, $SS_CENTERIMAGE)
	GUICtrlSetBkColor(-1, 0xdddddd)
	GUICtrlSetColor(-1, 0x000000)
	Local $idInput_RG = GUICtrlCreateInput('', $sLeft + 115, $sTop + 23, 130, 25)
	Local $idLabel_shippingDate = GUICtrlCreateLabel('Data de Expedição:*', $sLeft + 260, $sTop, 123, 70, $SS_CENTERIMAGE)
	GUICtrlSetBkColor(-1, 0xdddddd)
	GUICtrlSetColor(-1, 0x000000)
	Local $idInput_shippingDate = GUICtrlCreateInput('', $sLeft + 388, $sTop + 23, 130, 25)
	Local $idLabel_dispatchingAgency = GUICtrlCreateLabel('Orgão expedidor:*', $sLeft + 535, $sTop, 113, 70, $SS_CENTERIMAGE)
	GUICtrlSetBkColor(-1, 0xdddddd)
	GUICtrlSetColor(-1, 0x000000)
	Local $idInput_dispatchingAgency = GUICtrlCreateInput('', $sLeft + 655, $sTop + 23, 130, 25)
	Local $idLabel_RGEmpty = GUICtrlCreateLabel('     ', $sLeft, $sTop + 45, $sHeight, 21)
	GUICtrlSetFont(-1, 10, 400, 2, 'Segoe UI', 0)
	GUICtrlSetColor(-1, 0x6e6e6e)
	GUICtrlSetBkColor(-1, -2)
	Local $idLabel_RGItemNumber = GUICtrlCreateLabel('8.1', $sLeft + 20, $sTop, 21, 21, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	GUICtrlSetBkColor(-1, 0x000000)
	GUICtrlSetColor(-1, 0xFFFFFF)
	GUICtrlSetState($idLabel_RGBackground, $GUI_HIDE)
	GUICtrlSetState($idLabel_RGB, $GUI_HIDE)
	GUICtrlSetState($idInput_RG, $GUI_HIDE)
	GUICtrlSetState($idLabel_shippingDate, $GUI_HIDE)
	GUICtrlSetState($idInput_shippingDate, $GUI_HIDE)
	GUICtrlSetState($idLabel_dispatchingAgency, $GUI_HIDE)
	GUICtrlSetState($idInput_dispatchingAgency, $GUI_HIDE)
	GUICtrlSetState($idLabel_RGEmpty, $GUI_HIDE)
	GUICtrlSetState($idLabel_RGItemNumber, $GUI_HIDE)


	Local $sLeft = 70, $sTop = 1880, $sHeight = 810
	Local $btnEnviar = GUICtrlCreateButton('Enviar', $sLeft, $sTop, 150, 35)

	_RoundCorners($hWnd_Main, 3, 3, 20, 20)

	$aRegisteredUser = _DB_Execute("SELECT * FROM POPUP_TERMO WHERE ID = (select MAX(ID) FROM POPUP_TERMO WHERE matricula like '" & _GetUsername() & "')", True)
	If IsArray($aRegisteredUser) Then
		GUICtrlSetData($idInput_Matricula, $aRegisteredUser[1][3])
		IniWrite($fCache, "matricula", 1, $aRegisteredUser[1][3])

		GUICtrlSetData($idInput_IdentificacaoEquipamento,@ComputerName)
		IniWrite($fCache, "identificacaoEquipamento", 1, @ComputerName)

		If $aRegisteredUser[1][5] = "Individual" Then
			GUICtrlSetState($idRadio_ModoUsoIndividual, $GUI_CHECKED)
			IniWrite($fCache, "modoUso", "Individual", True)
		Else
			GUICtrlSetState($idRadio_ModoUsoCompartilhado, $GUI_CHECKED)
			IniWrite($fCache, "modoUso", "Compartilhado", True)
		EndIf

		$aAcessorioSplit = StringSplit($aRegisteredUser[1][6], "/")
		If IsArray($aAcessorioSplit) Then
			For $iAcessorio = 1 To UBound($aAcessorioSplit) - 1
				If $aAcessorioSplit[$iAcessorio] = "Fonte" Then 
					GUICtrlSetState($idCheck_AcessorioFonte, $GUI_CHECKED)
					IniWrite($fCache, "acessorio", "Fonte", True)
				Endif
				If $aAcessorioSplit[$iAcessorio] = "Bateria" Then 
					GUICtrlSetState($idCheck_AcessorioBateria, $GUI_CHECKED)
					IniWrite($fCache, "acessorio", "Bateria", True)
				EndIf

				If $aAcessorioSplit[$iAcessorio] = "TravaSeguranca" Then 
					GUICtrlSetState($idCheck_AcessorioTravaSeguranca, $GUI_CHECKED)
					IniWrite($fCache, "acessorio", "TravaSeguranca", True)
				Endif

				If $aAcessorioSplit[$iAcessorio] = "Mouse" Then 
					GUICtrlSetState($idCheck_AcessorioMouse, $GUI_CHECKED)
					IniWrite($fCache, "acessorio", "Mouse", True)
				Endif

				If $aAcessorioSplit[$iAcessorio] = "Teclado" Then 
					GUICtrlSetState($idCheck_AcessorioTeclado, $GUI_CHECKED)
					IniWrite($fCache, "acessorio", "Teclado", True)
				EndIf
					
				If $aAcessorioSplit[$iAcessorio] = "Maleta" Then 
					GUICtrlSetState($idCheck_AcessorioMaleta, $GUI_CHECKED)
					IniWrite($fCache, "acessorio", "Maleta", True)
				EndIf

				If $aAcessorioSplit[$iAcessorio] <> "Fonte" And $aAcessorioSplit[$iAcessorio] <> "Bateria" And $aAcessorioSplit[$iAcessorio] <> "TravaSeguranca" And $aAcessorioSplit[$iAcessorio] <> "Mouse" And $aAcessorioSplit[$iAcessorio] <> "Teclado" And $aAcessorioSplit[$iAcessorio] <> "Maleta" Then
					GUICtrlSetState($idCheck_AcessorioVazio, $GUI_CHECKED)
					GUICtrlSetState($idInput_AcessorioOutro, $GUI_ENABLE)
					GUICtrlSetData($idInput_AcessorioOutro, "")
					GUICtrlSetData($idInput_AcessorioOutro, $aAcessorioSplit[$iAcessorio])
					IniWrite($fCache, "acessorio", "Outro", $aAcessorioSplit[$iAcessorio])
				EndIf
			Next
		EndIf

		GUICtrlSetData($idCombo_LocalizacaoEmpresa, $aRegisteredUser[1][7])
		IniWrite($fCache, "localizacaoEmpresa", 1, $aRegisteredUser[1][7])

		GUICtrlSetData($idEdit_ComplementoLocalizacao, $aRegisteredUser[1][8])
		IniWrite($fCache, "complementoLocalizacao", 1, $aRegisteredUser[1][8])

		GUICtrlSetData($idInput_Gerencia, $aRegisteredUser[1][9])
		IniWrite($fCache, "gerencia", 1, $aRegisteredUser[1][9])
		
		If $aRegisteredUser[1][10] = "Desktop" Then
			GUICtrlSetState($idRadio_TipoEquipamentoDesktop, $GUI_CHECKED)
			IniWrite($fCache, "tipoEquipamento", "Desktop", True)
		Else
			GUICtrlSetState($idRadio_TipoEquipamentoNotebook, $GUI_CHECKED)
			IniWrite($fCache, "tipoEquipamento", "Notebook", True)
			GUICtrlSetState($idLabel_RGBackground, $GUI_SHOW)
			GUICtrlSetState($idLabel_RGB, $GUI_SHOW)
			GUICtrlSetState($idInput_RG, $GUI_SHOW)
			GUICtrlSetState($idLabel_shippingDate, $GUI_SHOW)
			GUICtrlSetState($idInput_shippingDate, $GUI_SHOW)
			GUICtrlSetState($idLabel_dispatchingAgency, $GUI_SHOW)
			GUICtrlSetState($idInput_dispatchingAgency, $GUI_SHOW)
			GUICtrlSetState($idLabel_RGEmpty, $GUI_SHOW)
			GUICtrlSetState($idLabel_RGItemNumber, $GUI_SHOW)
		EndIf
		If $aRegisteredUser[1][14] <> "" AND $aRegisteredUser[1][14] <> "Null" Then
			GUICtrlSetData($idInput_RG, $aRegisteredUser[1][14])
			IniWrite($fCache, "RG", "RGNumber", $aRegisteredUser[1][14])
		EndIf

		If $aRegisteredUser[1][15] <> "" AND $aRegisteredUser[1][15] <> "Null" Then 
			GUICtrlSetData($idInput_shippingDate, $aRegisteredUser[1][15])
			IniWrite($fCache, "RG", "shippingDate", $aRegisteredUser[1][15])
		EndIf

		If $aRegisteredUser[1][16] <> "" AND $aRegisteredUser[1][16] <> "Null" Then 
			GUICtrlSetData($idInput_dispatchingAgency, $aRegisteredUser[1][16])
			IniWrite($fCache, "RG", "dispatchingAgency", $aRegisteredUser[1][16])
		EndIf
	EndIf

	GUISetState(@SW_SHOW)

	Scrollbar_Create($hWnd_Main, $SB_VERT, 1950)
	Scrollbar_Step($iStep, $hWnd_Main, $SB_VERT)
	GUIRegisterMsg($WM_MOUSEWHEEL, 'WM_MOUSEWHEEL')

	While 1
		If Not WinActive($hWnd_Main) Then WinActivate($hWnd_Main)
		$nMsg = GUIGetMsg()
		Switch $nMsg
			;~ Case $GUI_EVENT_CLOSE
			;~ 	Exit

			Case $idInput_Matricula
				Local $bCheck = (GUICtrlRead($idInput_Matricula) <> '') ? _IniWrite("matricula", 1, GUICtrlRead($idInput_Matricula)) : _IniWrite("matricula", 1, Default)

			Case $idInput_IdentificacaoEquipamento
				Local $bCheck = (GUICtrlRead($idInput_IdentificacaoEquipamento) <> '') ? _IniWrite("identificacaoEquipamento", 1, GUICtrlRead($idInput_IdentificacaoEquipamento)) : _IniWrite("identificacaoEquipamento", 1, Default)

			Case $idRadio_ModoUsoIndividual
				If GUICtrlRead($idRadio_ModoUsoIndividual) = 1 Then
					_IniWrite('modoUso', 'Individual', True)
					_IniWrite('modoUso', 'Compartilhado', False)
				EndIf

			Case $idRadio_ModoUsoCompartilhado
				If GUICtrlRead($idRadio_ModoUsoCompartilhado) = 1 Then
					_IniWrite("modoUso", "Individual", False)
					_IniWrite("modoUso", "Compartilhado", True)
				EndIf

			Case $idCheck_AcessorioFonte
				If GUICtrlRead($idCheck_AcessorioFonte) = 1 Then
					_IniWrite("acessorio", "Fonte", True)
				Else
					_IniWrite("acessorio", "Fonte", False)
				EndIf

			Case $idCheck_AcessorioBateria
				If GUICtrlRead($idCheck_AcessorioBateria) = 1 Then
					_IniWrite("acessorio", "Bateria", True)
				Else
					_IniWrite("acessorio", "Bateria", False)
				EndIf

			Case $idCheck_AcessorioTravaSeguranca
				If GUICtrlRead($idCheck_AcessorioTravaSeguranca) = 1 Then
					_IniWrite("acessorio", "TravaSeguranca", True)
				Else
					_IniWrite("acessorio", "TravaSeguranca", False)
				EndIf

			Case $idCheck_AcessorioMouse
				If GUICtrlRead($idCheck_AcessorioMouse) = 1 Then
					_IniWrite("acessorio", "Mouse", True)
				Else
					_IniWrite("acessorio", "Mouse", False)
				EndIf

			Case $idCheck_AcessorioTeclado
				If GUICtrlRead($idCheck_AcessorioTeclado) = 1 Then
					_IniWrite("acessorio", "Teclado", True)
				Else
					_IniWrite("acessorio", "Teclado", False)
				EndIf

			Case $idCheck_AcessorioMaleta
				If GUICtrlRead($idCheck_AcessorioMaleta) = 1 Then
					_IniWrite("acessorio", "Maleta", True)
				Else
					_IniWrite("acessorio", "Maleta", False)
				EndIf

			Case $idCheck_AcessorioVazio
				If GUICtrlRead($idCheck_AcessorioVazio) = 1 Then
					GUICtrlSetState($idInput_AcessorioOutro, $GUI_ENABLE)
					GUICtrlSetData($idInput_AcessorioOutro, "")
				Else
					GUICtrlSetState($idInput_AcessorioOutro, $GUI_DISABLE)
					_IniWrite("acessorio", "Outro", False)
					GUICtrlSetData($idInput_AcessorioOutro, "Outro")
				EndIf

			Case $idInput_AcessorioOutro
				If GUICtrlRead($idInput_AcessorioOutro) <> "" Then
					_IniWrite("acessorio", "Outro", GUICtrlRead($idInput_AcessorioOutro))
				Else
					_IniWrite("acessorio", "Outro", False)
				EndIf

			Case $idCombo_LocalizacaoEmpresa
				_IniWrite("localizacaoEmpresa", 1, GUICtrlRead($idCombo_LocalizacaoEmpresa))

			Case $idEdit_ComplementoLocalizacao
				_IniWrite("complementoLocalizacao", 1, GUICtrlRead($idEdit_ComplementoLocalizacao))

			Case $idInput_Gerencia
				_IniWrite("gerencia", 1, GUICtrlRead($idInput_Gerencia))

			Case $idRadio_TipoEquipamentoDesktop
				If GUICtrlRead($idRadio_TipoEquipamentoDesktop) = 1 Then
					GUICtrlSetState($idLabel_RGBackground, $GUI_HIDE)
					GUICtrlSetState($idLabel_RGB, $GUI_HIDE)
					GUICtrlSetState($idInput_RG, $GUI_HIDE)
					GUICtrlSetState($idLabel_shippingDate, $GUI_HIDE)
					GUICtrlSetState($idInput_shippingDate, $GUI_HIDE)
					GUICtrlSetState($idLabel_dispatchingAgency, $GUI_HIDE)
					GUICtrlSetState($idInput_dispatchingAgency, $GUI_HIDE)
					GUICtrlSetState($idLabel_RGEmpty, $GUI_HIDE)
					GUICtrlSetState($idLabel_RGItemNumber, $GUI_HIDE)
					_IniWrite("RG", "RGNumber", False)
					_IniWrite("RG", "shippingDate", False)
					_IniWrite("RG", "dispatchingAgency", False)
					_IniWrite("tipoEquipamento", "Desktop", True)
					_IniWrite("tipoEquipamento", "Notebook", False)
				EndIf

			Case $idRadio_TipoEquipamentoNotebook
				If GUICtrlRead($idRadio_TipoEquipamentoNotebook) = 1 Then
					GUICtrlSetState($idLabel_RGBackground, $GUI_SHOW)
					GUICtrlSetState($idLabel_RGB, $GUI_SHOW)
					GUICtrlSetState($idInput_RG, $GUI_SHOW)
					GUICtrlSetState($idLabel_shippingDate, $GUI_SHOW)
					GUICtrlSetState($idInput_shippingDate, $GUI_SHOW)
					GUICtrlSetState($idLabel_dispatchingAgency, $GUI_SHOW)
					GUICtrlSetState($idInput_dispatchingAgency, $GUI_SHOW)
					GUICtrlSetState($idLabel_RGEmpty, $GUI_SHOW)
					GUICtrlSetState($idLabel_RGItemNumber, $GUI_SHOW)
					_IniWrite("tipoEquipamento", "Desktop", False)
					_IniWrite("tipoEquipamento", "Notebook", True)
				EndIf

			Case $idInput_RG
				If GUICtrlRead($idInput_RG) <> "" Then
					_IniWrite("RG", "RGNumber", GUICtrlRead($idInput_RG))
				Else
					_IniWrite("RG", "RGNumber", False)
				EndIf

			Case $idInput_shippingDate
				If GUICtrlRead($idInput_shippingDate) <> "" Then
					_IniWrite("RG", "shippingDate", GUICtrlRead($idInput_shippingDate))
				Else
					_IniWrite("RG", "shippingDate", False)
				EndIf

			Case $idInput_dispatchingAgency
				If GUICtrlRead($idInput_dispatchingAgency) <> "" Then
					_IniWrite("RG", "dispatchingAgency", GUICtrlRead($idInput_dispatchingAgency))
				Else
					_IniWrite("RG", "dispatchingAgency", False)
				EndIf

			Case $btnEnviar
				If _Export() = False Then
					hWnd_Exit()
					Exit
				EndIf

		EndSwitch
	WEnd
EndFunc   ;==>hWnd_Form

Func hWnd_Alert()
	;~ Local $sMsg = 'Prezado(a) ' & $userName & ', essa máquina será retirada do domínio caso o Termo de Posse Digital não seja preenchido. Com a máquina fora do domínio ela irá perder diversos acessos e será recolhida pela equipe de TI.' & @CRLF & @CRLF & 'Esse tipo de problema é fácil de ser evitado, basta clicar no botão abaixo e preencher o Termo de Posse Digital na página que você será redirecionado.' & @CRLF & @CRLF & 'A Diretoria de Tecnologia da Informação ressalta que o preecnhimento é um item crítico e obrigatório para manter o controle sobre o inventário da CSN, conforme a norma NG1406.07.' & @CRLF & @CRLF & 'Qualquer dúvida entre em contato com o analista de TI da área.' & @CRLF & @CRLF & 'Agradecemos a compreensão.'
	Local $sMsg = 'Prezado(a) ' & $userName & ', é necessário atualizar o termo de posse deste equipamento! Ressaltamos que esta atualização é importante para que possamos manter o controle sobre o inventário da CSN, conforme a norma NG1406.07.' & @CRLF & @CRLF & 'Caso não ocorra a atualização do termo de posse, a máquina sairá da rede e será recolhida pela TI. Para que isso não ocorra, basta clicar no botão abaixo e seguir com o preenchimento do Termo de Posse Digital na página que você será redirecionado(a).' & @CRLF & @CRLF & 'Caso tenha dúvidas, por favor, entre em contato com o analista de TI da área.' & @CRLF & @CRLF & 'A Diretoria de Tecnologia da Informação agradece a compreensão!'
	$hWnd_Alert = GUICreate("", 961, 476, (@DesktopWidth / 2) - 480.5, (@DesktopHeight / 2) - 188, $WS_POPUP, $WS_EX_MDICHILD, $hWnd_ScreenLock)
	GUISetFont(12, 400, 0, "Segoe UI")
	$aGetPos = WinGetPos($hWnd_Alert)
	$Label1 = GUICtrlCreateLabel("Atenção", 0, 40, $aGetPos[2] - 1, 35, $SS_CENTER)
	GUICtrlSetFont(-1, 16, 800, 0, 'Segoe UI', 0)
	GUICtrlSetColor(-1, 0xff0000)
	$Label2 = GUICtrlCreateLabel($sMsg, 43, 88, 874, 301)
	$idBtn_Preencher = GUICtrlCreateButton("Preencher Termo de Posse", 312, 416, 307, 35)
	_GUICtrlCreateGIF($img_Extract_CSN_Logo, '', 700, 300, 170, 95)
	_RoundCorners($hWnd_Alert, 3, 3, 20, 20)
	GUISetState(@SW_SHOW)

	While 1
		If Not WinActive($hWnd_Alert) Then WinActivate($hWnd_Alert)
		$nMsg = GUIGetMsg()
		Switch $nMsg
			;~ Case $GUI_EVENT_CLOSE
			;~ 	Exit

			Case $idBtn_Preencher
				GUIDelete($hWnd_Alert)
				IniWrite($cacheDir & "\Cache.ini", "preencherTermo", 1, True)
				hWnd_Form()
				Return 0

		EndSwitch
	WEnd
EndFunc   ;==>hWnd_Alert

Func _IniWrite($sSession, $sKey, $sValue = '')
	If $sValue = '' Or $sValue = Default Then $sValue = 'False'
	IniDelete($fCache, $sSession, $sKey)
	IniWrite($fCache, $sSession, $sKey, $sValue)
EndFunc   ;==>_IniWrite

Func WM_MOUSEWHEEL($hWnd, $iMsg, $iwParam, $ilParam)
	Local $iDelta = BitShift($iwParam, 16)
	If $iDelta > 0 Then
		_SendMessage($hWnd_Main, $WM_VSCROLL, $SB_LINEUP)
		_SendMessage($hWnd_Main, $WM_VSCROLL, $SB_LINEUP)
	Else
		_SendMessage($hWnd_Main, $WM_VSCROLL, $SB_LINEDOWN)
		_SendMessage($hWnd_Main, $WM_VSCROLL, $SB_LINEDOWN)
	EndIf

	Return 'GUI_RUNDEFMSG'
EndFunc   ;==>WM_MOUSEWHEEL

Func _RoundCorners($hGUIByRef, $i_x1, $i_y1, $i_x2, $i_y2)
	Local $aPos, $aRet1, $aRet2
	$aPos = WinGetPos($hGUIByRef)
	$aRet1 = DllCall("gdi32.dll", "long", "CreateRoundRectRgn", "long", $i_x1, "long", $i_y1, "long", $aPos[2], "long", $aPos[3], "long", $i_x2, "long", $i_y2)
	If $aRet1[0] Then
		$aRet2 = DllCall("user32.dll", "long", "SetWindowRgn", "hwnd", $hGUIByRef, "long", $aRet1[0], "int", 1)
		If $aRet2[0] Then
			Return 1
		Else
			Return 0
		EndIf
	Else
		Return 0
	EndIf
EndFunc   ;==>_RoundCorners

Func _ExtractCacheIni($bSaveBinary = False, $sSavePath = @ScriptDir)
	Local $ExtractCacheIni
	$ExtractCacheIni &= 'AbEAW3ByZWVuY2gAZXJUZXJtb10ADQoxPUZhbHMAZQ0KW3VzZXIQTmFtZQpQbWF0QHJpY3VsYQpUaQBkZW50aWZpYwBhY2FvRXF1aRJwAG5udAuebW9kCG9VcwEmSW5kaUB2aWR1YWwFOEMAb21wYXJ0aWwQaGFkbwYxYWNlIHNzb3JpATNGbwhudGUFGUJhdGUIcmlhBQ5UcmF2AGFTZWd1cmFuMmMGFU1vAMEGImVjgmwIWk1hbGV0BikQT3V0coc6bG9jUGFsaXoCZW2Aj3Oli3VjAFVsZQJvTIcUUQoRZ2VyAKppixt0BGlwDI1EZXNrdARvcIUQTm90ZWIIb29rhQc='
	$ExtractCacheIni = _WinAPI_Base64Decode($ExtractCacheIni)
	If @error Then Return SetError(1, 0, 0)
	Local $tSource = DllStructCreate('byte[' & BinaryLen($ExtractCacheIni) & ']')
	DllStructSetData($tSource, 1, $ExtractCacheIni)
	Local $tDecompress
	_WinAPI_LZNTDecompress($tSource, $tDecompress, 412)
	If @error Then Return SetError(3, 0, 0)
	$tSource = 0
	Local Const $bString = Binary(DllStructGetData($tDecompress, 1))
	If $bSaveBinary Then
		Local Const $hFile = FileOpen($sSavePath & "\Cache.ini", 18)
		If @error Then Return SetError(2, 0, $bString)
		FileWrite($hFile, $bString)
		FileClose($hFile)
	EndIf
	Return $bString
EndFunc   ;==>_ExtractCacheIni

Func createBox($sTitle, $sEx, $sNum, $sLeft = 70, $sTop = 470, $sWidth = 810, $sHeight = 70)
	GUICtrlCreateLabel('     ' & $sTitle, $sLeft, $sTop, $sWidth, $sHeight, $SS_CENTERIMAGE)
	GUICtrlSetBkColor(-1, 0xdddddd)
	GUICtrlSetColor(-1, 0x000000)
	GUICtrlCreateLabel('     ' & $sEx, $sLeft, $sTop + 45, 200, 21)
	GUICtrlSetColor(-1, 0x6e6e6e)
	GUICtrlSetBkColor(-1, -2)
	GUICtrlCreateLabel('1', $sLeft + 20, $sTop, 21, 21, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	GUICtrlSetBkColor(-1, 0x000000)
	GUICtrlSetColor(-1, 0xFFFFFF)
	Local $idInput = GUICtrlCreateInput('', $sLeft, $sTop + 75, $sWidth, 25, $SS_CENTERIMAGE)
	GUICtrlSetFont(-1, 10, 400, 0, 'Segoe UI', 0)
	Return $idInput
EndFunc   ;==>createBox

Func _Export()
	Local $popUpError = False
	Local $sMsg_Erro = ''
	Local $sectionNames = IniReadSectionNames($fCache)
	Local $aAcessorio[0]

	If IsArray($sectionNames) Then
		For $i = 0 To UBound($sectionNames) - 1
			$keyValue = IniReadSection($fCache, $sectionNames[$i])

			If $sectionNames[$i] = "preencherTermo" Then
				If $keyValue[1][1] <> "False" Then
					$preencherTermo = $keyValue[1][1]
				Else
					$sMsg_Erro &= "Por favor aceite preencher o Termo" & @CRLF
					$popUpError = True
					ExitLoop
				EndIf
			EndIf

			If $sectionNames[$i] = "userName" Then
				If $keyValue[1][1] <> "False" Then
					$userName = $keyValue[1][1]
				Else
					$sMsg_Erro &= "Por favor preencher seu Nome" & @CRLF
					$popUpError = True
					ExitLoop
				EndIf
			EndIf

			If $sectionNames[$i] = "matricula" Then
				If $keyValue[1][1] <> "False" Then
					$matricula = $keyValue[1][1]
				Else
					$sMsg_Erro &= "Por favor preencher sua Matrícula" & @CRLF
					$popUpError = True
					ExitLoop
				EndIf
			EndIf

			If $sectionNames[$i] = "identificacaoEquipamento" Then
				If $keyValue[1][1] <> "False" Then
					$identificacaoEquipamento = $keyValue[1][1]
				Else
					$sMsg_Erro &= "Por favor preencher com a Identificação do Equipamento" & @CRLF
					$popUpError = True
					ExitLoop
				EndIf
			EndIf

			If $sectionNames[$i] = "modoUso" Then
				If $keyValue[1][1] <> "False" Then $modoUso = "Individual"
				If $keyValue[2][1] <> "False" Then $modoUso = "Compartilhado"
				If $keyValue[1][1] = "False" And $keyValue[2][1] = "False" Then
					$sMsg_Erro &= "Por favor selecionar o Modo de Uso do equipamento" & @CRLF
					$popUpError = True
					ExitLoop
				EndIf
			EndIf

			If $sectionNames[$i] = "acessorio" Then
				For $y = 1 To 7
					If $keyValue[$y][1] <> 'False' And $keyValue[$y][0] <> 'Outro' Then
						_ArrayAdd($aAcessorio, $keyValue[$y][0])
					ElseIf $keyValue[$y][0] = 'Outro' And $keyValue[$y][1] <> 'False' Then
						_ArrayAdd($aAcessorio, $keyValue[$y][1])
					EndIf
				Next

	
				;~ For $iSectionAcessorio = 1 To 7
				;~ 	If $keyValue[$iSectionAcessorio][1] <> "False" AND $keyValue[$iSectionAcessorio][0] = "Fonte" Then _ArrayAdd($aAcessorio, $keyValue[$iSectionAcessorio][0])
				;~ 	If $keyValue[$iSectionAcessorio][1] <> "False" AND $keyValue[$iSectionAcessorio][0] = "Bateria" Then _ArrayAdd($aAcessorio, $keyValue[$iSectionAcessorio][0])
				;~ 	If $keyValue[$iSectionAcessorio][1] <> "False" AND $keyValue[$iSectionAcessorio][0] = "TravaSeguranca" Then _ArrayAdd($aAcessorio, $keyValue[$iSectionAcessorio][0])
				;~ 	If $keyValue[$iSectionAcessorio][1] <> "False" AND $keyValue[$iSectionAcessorio][0] = "Mouse" Then _ArrayAdd($aAcessorio, $keyValue[$iSectionAcessorio][0])
				;~ 	If $keyValue[$iSectionAcessorio][1] <> "False" AND $keyValue[$iSectionAcessorio][0] = "Teclado" Then _ArrayAdd($aAcessorio, $keyValue[$iSectionAcessorio][0])
				;~ 	If $keyValue[$iSectionAcessorio][1] <> "False" AND $keyValue[$iSectionAcessorio][0] = "Maleta" Then _ArrayAdd($aAcessorio, $keyValue[$iSectionAcessorio][0])
				;~ 	If $keyValue[$iSectionAcessorio][1] <> "False" AND $keyValue[$iSectionAcessorio][0] = "Outro" Then _ArrayAdd($aAcessorio, $keyValue[$iSectionAcessorio][1])
				;~ Next
			EndIf

			If $sectionNames[$i] = "localizacaoEmpresa" Then
				If $keyValue[1][1] <> "False" Then
					$localizacaoEmpresa = $keyValue[1][1]
				Else
					$sMsg_Erro &= "Por favor selecionar o Localização da Empresa" & @CRLF
					$popUpError = True
					ExitLoop
				EndIf
			EndIf

			If $sectionNames[$i] = "complementoLocalizacao" Then
				If $keyValue[1][1] <> "False" Then
					$complementoLocalizacao = $keyValue[1][1]
				Else
					$sMsg_Erro &= "Por favor informar o Complemento da Localização" & @CRLF
					$popUpError = True
					ExitLoop
				EndIf
			EndIf

			If $sectionNames[$i] = "gerencia" Then
				If $keyValue[1][1] <> "False" Then
					$gerencia = $keyValue[1][1]
				Else
					$sMsg_Erro &= "Por favor informar a Gerencia" & @CRLF
					$popUpError = True
					ExitLoop
				EndIf
			EndIf

			If $sectionNames[$i] = "tipoEquipamento" Then
				If $keyValue[1][1] <> "False" Then $tipoEquipamento = "Desktop"
				If $keyValue[2][1] <> "False" Then $tipoEquipamento = "Notebook"
				If $keyValue[1][1] = "False" And $keyValue[2][1] = "False" Then
					$sMsg_Erro &= "Por favor selecionar o Tipo de Equipamento" & @CRLF
					$popUpError = True
					ExitLoop
				EndIf
			EndIf

			If $sectionNames[$i] = "RG" Then
				If IniRead($fCache, "tipoEquipamento", "Notebook", "False") <> "False" Then
					If $keyValue[1][1] <> "False" And $keyValue[1][0] = "RGNumber" Then $RGNumber = $keyValue[1][1]
					If $keyValue[2][1] <> "False" And $keyValue[2][0] = "RGNumber" Then $RGNumber = $keyValue[2][1]
					If $keyValue[3][1] <> "False" And $keyValue[3][0] = "RGNumber" Then $RGNumber = $keyValue[3][1]

					If $keyValue[1][1] <> "False" And $keyValue[1][0] = "shippingDate" Then $shippingDate = $keyValue[1][1]
					If $keyValue[2][1] <> "False" And $keyValue[2][0] = "shippingDate" Then $shippingDate = $keyValue[2][1]
					If $keyValue[3][1] <> "False" And $keyValue[3][0] = "shippingDate" Then $shippingDate = $keyValue[3][1]

					If $keyValue[1][1] <> "False" And $keyValue[1][0] = "dispatchingAgency" Then $dispatchingAgency = $keyValue[1][1]
					If $keyValue[2][1] <> "False" And $keyValue[2][0] = "dispatchingAgency" Then $dispatchingAgency = $keyValue[2][1]
					If $keyValue[3][1] <> "False" And $keyValue[3][0] = "dispatchingAgency" Then $dispatchingAgency = $keyValue[3][1]

					If $keyValue[1][1] = "False" Or $keyValue[2][1] = "False" Or $keyValue[3][1] = "False" Then
						$sMsg_Erro &= "Por favor, preencher todos os campos do RG" & @CRLF
						$popUpError = True
						ExitLoop
					EndIf
				Else
					$RGNumber = "False"
					$shippingDate = "False"
					$dispatchingAgency = "False"
				EndIf
			EndIf
		Next
	Else
		$sMsg_Erro &= 'Não foi possível coletar os dados em cache. Ocorreu um erro ao tentar acessar a sessão do arquivo. Contate o administrador da ferramenta'
	EndIf

	Local $acessorio = ""
	If IsArray($aAcessorio) Then
		For $i2 = 0 To UBound($aAcessorio) - 1
			$acessorio &= $aAcessorio[$i2] & "/"
		Next
	EndIf
	$acessorio = StringTrimRight($acessorio, 1)

	If $sMsg_Erro <> '' Then MsgBox($MB_TOPMOST + $MB_ICONWARNING, 'Aviso', $sMsg_Erro)

	If $popUpError = False Then
		Local $aComputerInfo = getCompInfo()
		If $RGNumber = "False" AND $shippingDate = "False" And $dispatchingAgency = "False" Then 
			_DB_Execute(StringFormat("Insert Into POPUP_TERMO(preencherTermo, userName, matricula, identificacaoEquipamento, modoUso, acessorio, localizacaoEmpresa, complementoLocalizacao, gerencia, tipoEquipamento, modeloEquipamento, serialEquipamento, dataColeta) VALUES('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s')", $preencherTermo, $userName, $matricula, $identificacaoEquipamento, $modoUso, $acessorio, $localizacaoEmpresa, $complementoLocalizacao, $gerencia, $tipoEquipamento, $aComputerInfo[1], $aComputerInfo[2], _Now()), Default)
		Else
			_DB_Execute(StringFormat("Insert Into POPUP_TERMO(preencherTermo, userName, matricula, identificacaoEquipamento, modoUso, acessorio, localizacaoEmpresa, complementoLocalizacao, gerencia, tipoEquipamento, modeloEquipamento, serialEquipamento, dataColeta, numeroRG, dataExpedicao, orgaoExpedidor) VALUES('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s')", $preencherTermo, $userName, $matricula, $identificacaoEquipamento, $modoUso, $acessorio, $localizacaoEmpresa, $complementoLocalizacao, $gerencia, $tipoEquipamento, $aComputerInfo[1], $aComputerInfo[2], _Now(), $RGNumber, $shippingDate, $dispatchingAgency), Default)
		EndIf
		FileDelete($fCache)
		FileOpen("C:\ProgramData\PopupTermo\Termo.txt", $FO_OVERWRITE + $FO_CREATEPATH)
	EndIf
	Return $popUpError
EndFunc   ;==>_Export

Func _DB_Execute($sByRefValue, $sByRef_Array = False, $sByRef_Mode = 'Microsoft')
;~ Func _DB_Execute($sByRefValue, $sByRef_Array = False, $sByRef_Mode = 'MySql')
	If $sByRef_Array = Default Then $sByRef_Array = False
	If $sByRef_Array = False Then
		If $sByRef_Mode = 'Microsoft' Then
			___DataBase_Execute_CMD_MSSQL($sByRefValue)
		Else
			___DataBase_Execute_CMD_MySQL($sByRefValue)
		EndIf
	Else
		If $sByRef_Mode = 'Microsoft' Then
			Return ___DataBase_Execute_CMD_MSSQL($sByRefValue, True)
		Else
			Return ___DataBase_Execute_CMD_MySQL($sByRefValue, True)
		EndIf
	EndIf
EndFunc   ;==>_DB_Execute

Func ___DataBase_Execute_CMD_MySQL($sByRefExecute, $sByRefQuery = False)
	Local $tagSTRUCTDATABASE = 'struct;char driver[64];char hostname[64];char database[64];char server[64];char user[16];char pass[16];endstruct'
	Local $oSQL = DllStructCreate($tagSTRUCTDATABASE)

	DllStructSetData($oSQL, 'driver', 'MySQL ODBC 8.0 ANSI Driver')
	DllStructSetData($oSQL, 'database', 'csn')
	DllStructSetData($oSQL, 'server', 'workspace.cd77ovbthozc.sa-east-1.rds.amazonaws.com')
	DllStructSetData($oSQL, 'user', 'admin')
	DllStructSetData($oSQL, 'pass', 'Qwe123123qwe')

	Local $oConnection = _ADO_Connection_Create()
	If IsObj($oConnection) Then
		Local $_ADO_Con = _ADO_Connection_OpenConString($oConnection, 'DRIVER={' & $oSQL.driver & '};SERVER=' & $oSQL.server & ';DATABASE=' & $oSQL.database & ';UID=' & $oSQL.user & ';PWD=' & $oSQL.pass & ';Trusted_Connection=Yes;')
		If @error Then
			;_Metro_MsgBox(0, 'Meu Ativo', 'An error occurred while trying to connect to the database.' & @CRLF & @CRLF & 'Check your connection and try again', 500, 11)
			;Exit
			Return False
		EndIf
		Local $aResult = _ADO_Execute($oConnection, $sByRefExecute, True, True)
	EndIf
	; CleanUp
	_ADO_Connection_Close($oConnection)
	$oConnection = Null
	If $sByRefQuery = True Then Return $aResult
EndFunc   ;==>___DataBase_Execute_CMD_MySQL

Func ___DataBase_Execute_CMD_MSSQL($sByRefExecute, $sByRefQuery = False)
	Local $tagSTRUCTDATABASE = 'struct;char driver[64];char hostname[64];char database[64];char server[64];char user[16];char pass[16];endstruct'
	Local $tSQL = DllStructCreate($tagSTRUCTDATABASE)

	DllStructSetData($tSQL, 'driver', BinaryToString('0x53514C20536572766572'))
	DllStructSetData($tSQL, 'database', BinaryToString('0x505231393034'))
	DllStructSetData($tSQL, 'server', BinaryToString('0x53514C3337434C315C494E53543337')) ;xx\xx
	DllStructSetData($tSQL, 'user', BinaryToString('0x41444D59393035'))
	DllStructSetData($tSQL, 'pass', BinaryToString('0x6276613056683074'))

	Local $oConnection = _ADO_Connection_Create()
	If IsObj($oConnection) Then
		Local $_ADO_Con = _ADO_Connection_OpenMSSQL($oConnection, $tSQL.server, $tSQL.database, $tSQL.user, $tSQL.pass)
		If @error Then
			If $sByRefQuery = True Then Return False
		EndIf
		Local $aResult = _ADO_Execute($oConnection, $sByRefExecute, True, True)
	EndIf
	; CleanUp
	_ADO_Connection_Close($oConnection)
	$oConnection = Null
	If $sByRefQuery = True Then Return $aResult
EndFunc   ;==>___DataBase_Execute_CMD_MSSQL

Func getCompInfo()
	Local $BIOS, $sSerialNumber
	Local $System, $sModel
	Local $aReturn

	_ComputerGetBIOS($BIOS)
	_ComputerGetSystem($System)

	For $y = 1 To $BIOS[0][0] Step 1
		$sSerialNumber = $BIOS[$y][16]
	Next

	For $y = 1 To $System[0][0] Step 1
		$sModel = $System[$y][22]
	Next
	$aReturn = $sModel & ';' & $sSerialNumber
	$aReturn = StringSplit($aReturn, ';', 1)
	Return $aReturn
EndFunc   ;==>getCompInfo

Func _ComputerGetBIOS(ByRef $aBIOSInfo)
	Local $colItems, $objWMIService, $objItem
	Dim $aBIOSInfo[1][25], $i = 1

	$objWMIService = ObjGet("winmgmts:\\" & $cI_CompName & "\root\CIMV2")
	$colItems = $objWMIService.ExecQuery("SELECT * FROM Win32_BIOS", "WQL", $wbemFlagReturnImmediately + $wbemFlagForwardOnly)

	If IsObj($colItems) Then
		For $objItem In $colItems
			ReDim $aBIOSInfo[UBound($aBIOSInfo) + 1][25]
			$aBIOSInfo[$i][16] = $objItem.SerialNumber
			$i += 1
		Next
		$aBIOSInfo[0][0] = UBound($aBIOSInfo) - 1
		If $aBIOSInfo[0][0] < 1 Then
			SetError(1, 1, 0)
		EndIf
	Else
		SetError(1, 2, 0)
	EndIf
EndFunc   ;==>_ComputerGetBIOS

Func _ComputerGetSystem(ByRef $aSystemInfo)
	Local $colItems, $objWMIService, $objItem
	Dim $aSystemInfo[1][52], $i = 1

	$objWMIService = ObjGet("winmgmts:\\" & $cI_CompName & "\root\CIMV2")
	$colItems = $objWMIService.ExecQuery("SELECT * FROM Win32_ComputerSystem", "WQL", $wbemFlagReturnImmediately + $wbemFlagForwardOnly)

	If IsObj($colItems) Then
		For $objItem In $colItems
			ReDim $aSystemInfo[UBound($aSystemInfo) + 1][52]
			$aSystemInfo[$i][22] = $objItem.Model
			$i += 1
		Next
		$aSystemInfo[0][0] = UBound($aSystemInfo) - 1
		If $aSystemInfo[0][0] < 1 Then
			SetError(1, 1, 0)
		EndIf
	Else
		SetError(1, 2, 0)
	EndIf
EndFunc   ;==>_ComputerGetSystem

Func hWnd_Exit()
	$hWnd_Exit = GUICreate('', 960, 600, 3, 3, $WS_POPUP, $WS_EX_MDICHILD, $hWnd_Main)
	GUISetBkColor(0x125bad)
	Local $aGetPos = WinGetPos($hWnd_Exit)
;~ GUICtrlCreatePic('', $aGetPos[2] - 175, (600/2)+250, 146, 33)
	GUICtrlCreatePic('', (960 / 2) - 106, (600 / 2) - 159, 212, 118)
	_GUICtrlSetGIF(-1, @TempDir & "\CSN_Logo_White.gif")
	_RoundCorners($hWnd_Exit, 3, 3, 20, 20)
	_WinAPI_AnimateWindow($hWnd_Exit, 0x00040010, 300)
	GUISetState(@SW_SHOW)
	GUISwitch($hWnd_Exit)
	GUICtrlCreateLabel('Obrigado pela colaboração!', 0, (600 / 2) - 20, $aGetPos[2] - 2, 36, $SS_CENTER)
	GUICtrlSetColor(-1, 0xFFFFFF)
	GUICtrlSetBkColor(-1, -2)
	GUICtrlSetFont(-1, 18, 400, 0, 'Segoe UI', 0)
	_WinAPI_AnimateWindow($hWnd_Main, 0x00090000, 250)
;~ For $i = 255 To 0 Step -10
;~ 	drawPNG($i, $hWnd_ShadowApp, $splashImage)
;~ Next
;~ _Metro_GUIDelete($hWnd_ShadowApp)
	Sleep(1500)
	_WinAPI_AnimateWindow($hWnd_Exit, 0x00090000, 300)
EndFunc   ;==>hWnd_Exit

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

Func _ExtractCSNLogo($bSaveBinary = False, $sSavePath = @TempDir)
	Local $ExtractCSNLogo
	$ExtractCSNLogo &= '07UAR0lGODlh1AAgdgD3iAAAAEtLAEtSUlJTU1NUAFRUVVVVV1dXAFlZWVxcXF1dAF1hYWFiYmJkAGRkZmZmaWlpAGpqam1tbXNzAHN0dHR1dXV2AHZ2enp6f39/AICAgIKCgoSEAISGhoaJiYmKAIqKjY2Njo6OAJCQkJGRkZOTAJOUlJSVlZWWAJaWl5eXmJiYAJmZmZqampubAJucnJydnZ2eAJ6en5+foaGhAKKioqOjo6WlAKWmpqaoqKipAKmpqqqqq6urAK2tra6urrCwALCxsbGysrKzALOztLS0tbW1ALa2tre3t7i4ALi5ubm6urq7ALu7vLy8vb29AL6+vr+/v8DAAMDBwcHCwsLDAMPDxMTExcXFAMbGxsfHx8jIAMjJycnKysrLAMvLzMzMzc3NAM7Ozs/Pz9DQANDR0dHS0tLTANPT1NTU1dXVANbW1tfX19jYANjZ2dna2trbANvb3Nzc3d3dAN7e3t/f3+DgAODh4eHi4uLjAOPj5OTk5eXlAObm5ufn5+joAOjp6enq6urrAOvr7Ozs7e3tAO7u7u/v7/DwAPDx8fHy8vLzAPPz9PT09fX1APb29vf39/j4APj5+fn6+vr7APv7/Pz8/f39wP7+/v///4HNfwAPPwA/AD8AFgAh+QQBAcIB/wtJQ0NSR0BCRzEwMTLAXgIAoGxjbXMEMAAgAG1udHIABiBYAFlaIAfmAAMAAAQADgAoABZhgGNzcE1TRlQXF8j21gACF9MtwRJsJgANZGVzYwAAAYIgwAJAY3BydMACQmDAAjZ3dHDBAphBwAIUY2hhZMACrFnAAixyACjAAtjBBWJVwwLswQJnwgICwRQUUHJUUkPAAhRgASAKZ2gBYmgBY2hy/wptgAE0gAEkZG1uqQAMAlhjAWRhAXxhAThtbHWAEwIAQRwMZRhuVVPhAmAAHABHAABJAE0AUAAgAABiAHUAaQBsUAB0AC3gAG4gAnNUAFLgA0L0Bxri'
	$ExtractCSNLogo &= 'B1BFoAZioAZpAGMgBkRAAG8AbQBh4gcAQ4EwjStzZjMyIwkMAEIAAAXe///zACUAAAeTAAD9AJD///uh///9AKIAAAPcAADAAm7nB2+gAAA49QXgApBnAiSfAAAPQIQAAKK2xIcCYgCXAAC3hwAAGKDZcGFyYUICA2AAgAJmZgAA8qcANQBZAAAT0AAACg5bICcAJ+QDAKPXAAQAVIAlTM0AAJmgmgAAJmeAC1wUHx4ICSd6BAQoIVZYTVAgIERhdGHgADw/AHhwYWNrZXQgAGJlZ2luPSfvALu/JyBpZD0nAFc1TTBNcENlAGhpSHpyZVN6AE5UY3prYzlkACc/Pgo8eDp4AG1wbWV0YSB4AG1sbnM6eD0nwGFkb2JlOmABwQIILycgQgR0az0nAEltYWdlOjpFAHhpZlRvb2wgQDEyLjE2J4AIcsBkZjpSREZECKABAD0naHR0cDovAC93d3cudzMuAG9yZy8xOTk5gC8wMi8yMi0gBAAtc3ludGF4LUhucyMgCAogYghEAQBecmlwdGlvbgIg4QFhYm91dD0QJycKIEQLdGlmEWcLbnMuQhUuY28EbS8hAy8xLjAvEaAJICA8wQE6T3KMaWWADMEJPjE8QgT7agKgDi/MDoAZQgKgGUEB/6YjgQofAB8AGwCfDB8Anwz/XwQPAA8ADwBPBg8ADwAPAP8PAA8ATwYPAA8ADwAPAE8G/w8ADwAPAA8ADwBPBg8ADwD/DwAPAA8ATwYPAA8ADwAPAP9PBg8ADwAPAA8ADwBPBg8A/w8ADwAPAE8GLwEPAA8ADwD/DwBPBg8ADwAPAA8ADwBPBv8PAA8ADwAPAE8GDwAPAA8A/w8ADwBPBg8ADwAPAA8ADwD/TwYPAA8ADwAPAE8GDwAPAP8PAA8ADwBPBg8ADwAPAA8A/08GDwAPAA8ADwAPAE8GDwD/DwAPAA8ADwBPBg8ADwAPAP8PAE8GDwAPAA8ADwAPAE8GAQ4A+boaIEMA'
	$ExtractCSNLogo &= 'CkSOG2Q8P3gAcGFja2V0IGUAbmQ9J3cnPz4AAf/+/fz7+vkA+Pf29fTz8vEA8O/u7ezr6ukA6Ofm5eTj4uEA4N/e3dzb2tkA2NfW1dTT0tEA0M/OzczLyskAyMfGxcTDwsEAwL++vby7urkAuLe2tbSzsrEAsK+urayrqqkAqKempaSjoqEAoJ+enZybmpkAmJeWlZSTkpEAkI+OjYyLiokAiIeGhYSDgoEAgH9+fXx7enkAeHd2dXRzcnEAcG9ubWxramkAaGdmZWRjYmEAYF9eXVxbWlkAWFdWVVRTUlEAUE9OTUxLSkkASEdGRURDQkEAQD8+PTw7OjkAODc2NTQzMjEAMC8uLSwrKikAKCcmJSQjIiEAIB8eHRwbGhkAGBcWFRQTEhEAEA8ODQwLCgkACAcGBQQDAgEQAAAsAAAA1AB2AAAACP4AAQgcAEiwoMGDCBMqAFzIsKHDhxAjAEqcSLGixYsYADNq3Mixo8ePACBDihxJsqTJAJMoU6pcybKlAMuXMGPKnEmzAKbNmzhz6tzJALOnz59AgwodAEq0qNGjSJMqAF3KtKnTp1CjAEqdSrWq1atYALNq3cqVYJpBAIP8hAXrp2zYALJmz5IFiwfkAKG3cOEOegv2ANDcu3bp5r2LAHevX791++KdAAvY7uC8iPUSAPZJOK7jx5DjAHLxaBis5cuWAMVi3sy581jPAKBDc668mKecAMioU9PterWJAOrXkeWwruoHALZtx0BmS7VyALv3W9m6odb2AN2bSnCnaIj7APZzvGlj5bYnADdPehp670HTAJEeSY3niBAhAEfC/osf//17AHLUaUZykcNHAKxdP3zkSJdoAOVN+8t+8KQ5AKKwSRo0AAKYAIYXC6XxxoFyACSIEx6oDWKDAER8pBZSGq8NAPIGRBS+5odxAAdV59gg/CUEAFl6NfGG2oUSACXBnUdoPPcaAIoKieGianwcAPRGZDWK+BgaADbNGFcIFDGIAFoS'
	$ExtractCSNLogo &= 'HAnpW44IAJ23nEEZQkYgAEKQiVGTF6lJAEnRDakhiVGEANAxdxCVXRbUAORjXh40o5UzAPlIlwcWeQjZAHwWGQmdlgOpAJkfHnyoeQiHAAKN+RiJBdngACRNYEZmxUUlAOhZZkViNCgHABpepIGHnmgKAEQFZIM0IcFAABpY4aOWSkZ2AINBNsz4pEwuAOQJWVsYFRrXACD+fBx6kZqVAA7kp1wFuQkXAJ8EAeGjCgOFAAoZcATJYKpNABi4kAQX9vmRAMYGGnHRnhxiAFBxgwcOYHTrAFu8FtQoZLxyAOkYsDZC1sRAAN+mFuJALry5AFMCEHSkQAMeAPlYq0FywgUjAADixnVqoFQEANxEwFSYEKyGABUQpIKLg8B5AJIVEFPRRBNJACQRXnlAZJzxAHfhVUykQ0dQAOzddxoDIYTJAOAdUfHAVEAsAOtCrj2G3UJUAAZmF6sC6QoXABoyKBBRuqm9AAzAwo85TJKwANYdcq5CQuh5AN2+B21770SXAKLmhxhAYOAQANKYsimQCpAJAF1S0jIvNBzZAHCJXVC+b+mgANHZjqJxBJAJAAH9WxMuwmjCAP6MaovUL9p7ACa0HeBw4XwQANyraWSibRYKAJHkY3gkoPODAACYEDZKTiv3AG9BVRN+CJ0FAM24KEaL38bHANIE2X0IHgGAAO0YHgcAUAK4AJh7/tbmBHVOADjoBM3Iu0U6APwNWxrxovsYAB8CAKC6cYk+ANZ3SJkTh/tAALoD/rtAon8kAMSNve2rOh7JAG/goh8SzP5YALcjIY42+gOpAGj79QCoPzpHACFQIYf6hh7sABgfBVj6mBjiAHNeSmx3iIVEAK830xsI2w4hAIORQKAESeAeAGqQpDr+CUQBAPkaBBX4lhIJAJKtYTA7IGyIAIUQD8IlgQRJAIJZ0OIHEjpEAAJHMKFcSiCQAO/1TyBCsM3zAEaChv+gQQz+AGLwAheG6LIiALpsiF4Q4kOsAEBEKwiM'
	$ExtractCSNLogo &= 'YCyDANgQueAFIAaoACGlg8v8DMI1AJzdYGQnA4LbABISs8eMsYKxABuIzi6XHYrkAE8hwjvEqTzUAJjcJGRbjgMAANLotLfX7PAlABYogQ2WZceMAHigCVwQggu8AJYRGdplVAhRAN1bvAIZHtUNADKQ3CMX/ViTAPXcJy6AsogMAM5GFjy8oZAVAIlMpg7CtdURACSLdIGkQSSgAL5BeK2CBsEAAP7i8keVDC4yAKiryBrfssWIADjyLXzwQsWoACCGXR5CbKpEAF/wIIMkpG2xAHpFo4kMUuMHAA1YpIzUzIgzAG0DumMeIj9vAEjD/VCDplsVADOOcDHaS1p5ALuK6DI1sv6cAJV1iinCyCzKAJ0I+eWgaqKnAEHQcCJcSE0oADEyzgYlxH3KAHEQJR1TTAAMAFOONnHVY1zoABDzocYjF8URAEMaSs18AkCGABUFAK1uAs+2AEnEnIeQJ0aoANDSuPgBhWISAKGzOlS2O0bGAJI1gShk/GCDABCUwARIRaoKAEywVKSWoAT1AMvSSNKAOLLIAGFdD2mCHOryACE/vOFjB7GCABzekKAELdQgAGQtqxzwYLiaACyQgNw6Ccs4AMIysOqmn9bhAGgbhUJPws1sAK9HwStxoAbYAKHA0nMpLexPAGqaNJkqFihCAEXsY6kDV7tOALYoJO0eZUSzABbOelYzavGsAGhB8xM0sHWtAKhdKx7UmqDVALr2tGx1/qxFADAjFs2gZSy1AL1tbtWi29zuAPYsteXtCn0LANzg3ja0oLVMAAEvy9zmOve5ANCNrnSnS93qAFr3utjNrna3AMvd7nr3u+ANAK94x0ve8pr3ALxQYetJgGqrAIa8AQ9AZa9EANqaEPk2BFD2AL0jUORE34+4AJIgiVVpXbw0ADqxOIQPhLVRAIALUpsc/bdAAAuGEvz8O7O5ANjqrJZc6ELfAFArQLkSUGg6ABC+DnGhN8zsAFTpyZOt8ssQAEgRBMWhJKtB'
	$ExtractCSNLogo &= 'AIYjkP+KgcMEAMExk866LxnXADgltTlIZbC3AJe7nNQwh5ANAIO2yhwG1SU9AEjGTouwl59DAMjXLnywJJWwAHcZ7N2nxnOhAKqDpZSXN9TGAD0WXa7+cqnMAKBQDqdGrhTLAGnacqO5MOc0AGAGS433cuT2ACx3uSex8NrUAAznGgWZQUcmAJCBBxIhACAaAACfg/SdC5gcAErS1z0zKyCeAOOHHT0nh0fnAPRyjcnMnIReAAjReFaxoy0NAOBBtGjOvcNOAKhXjedJiTrSAI1W459TEiHgANyPXxVmTpLjAMccCgHA2PzSADSsDPxoWEFaADaVnjKnI9RWAEveSDYFtDW/AJgzFz54m8yWAITPqCFtSSsfADnNnGYwrB5MAOxkuzJPkxI2AAnxXBYqQ/pCAFulcpAhrZKbAAkpzekZRFuGAF1vY19bpcKuABGimw3ntlTaANibZje1HX0IACjrkcSQxs6iAIFjbgEnm8xWAALLVqA1nW01AKvzz4Zb9FsGAB7wTmMH1SQHANCwMY7oIN/oAMcqIcxfaxMWAOzJRsVfOfJdAHgU3JdXeODQAM40mGvT1uE4AJvfySYLl3uuANKB1HnfrmY0AB9QPTMueek9AAIniKon1RbMAExdNvmOH5ZrAIxvZdcF20G5APlSVpvu7/6VADqWQa/e9873AL77/e+AD7zgAAdP+MIb/vCIAE+84hfP+MY7AP7xkI+85CdPAHmqBAQAOw=='
	$ExtractCSNLogo = _WinAPI_Base64Decode($ExtractCSNLogo)
	If @error Then Return SetError(1, 0, 0)
	Local $tSource = DllStructCreate('byte[' & BinaryLen($ExtractCSNLogo) & ']')
	DllStructSetData($tSource, 1, $ExtractCSNLogo)
	Local $tDecompress
	_WinAPI_LZNTDecompress($tSource, $tDecompress, 6760)
	If @error Then Return SetError(3, 0, 0)
	$tSource = 0
	Local Const $bString = Binary(DllStructGetData($tDecompress, 1))
	If $bSaveBinary Then
		Local Const $hFile = FileOpen($sSavePath & "\CSN_Logo_White.gif", 18)
		If @error Then Return SetError(2, 0, $bString)
		FileWrite($hFile, $bString)
		FileClose($hFile)
	EndIf
	Return $bString
EndFunc   ;==>_ExtractCSNLogo