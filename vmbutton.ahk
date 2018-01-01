;Wait for the VoiceMeeter window to appear before anything
WinWait, ahk_exe voicemeeterpro.exe
{
; variables
path = C:\Program Files (x86)\VB\Voicemeeter\ ; path to VoiceMeeter install folder
img = button.png
app = vmr_matrix.exe	
;new gui
Gui, 1: Color, white, Default 
Gui, 1: +LastFound +AlwaysOnTop 
WinSet, TransColor, white 255 
Gui 1: -Caption +ToolWindow ;removes the title and border from the gui
Gui, 1: add, Picture,gButtonMatrix,%path%%img%
Set_Parent_by_title("VoiceMeeter", 1) ; makes the gui button a child of VoiceMeeter
Gui, 1: Show, x960 y255 ;positions the button releative to the Voicemeeter window
Return
;parent/child function
Set_Parent_by_title(Window_Title_Text, Gui_Number)
{ 
  WinGetTitle, Window_Title_Text_Complete, %Window_Title_Text% 
  Parent_Handle := DllCall( "FindWindowEx", "uint",0, "uint",0, "uint",0, "str", Window_Title_Text_Complete) 
  Gui, %Gui_Number%: +LastFound 
  Return DllCall( "SetParent", "uint", WinExist(), "uint", Parent_Handle ) ; success = handle to previous parent, failure =null
}
;runs or shows vmr_matrix window
ButtonMatrix: 
IfWinNotExist, ahk_exe %app%
{
	Run, %path%%app%
	WinWait, ahk_exe %app%
	WinActivate, ahk_exe %app%
	Return
}
IfWinNotActive, ahk_exe %app%
{
	WinActivate, ahk_exe %app%
	Return
}
Return
}
 
