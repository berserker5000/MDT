'Option Explicit

If WScript.Arguments.Count = 0 Then
	Set objShell = CreateObject("Shell.Application")
	objShell.ShellExecute "wscript.exe", Chr(34) & WScript.ScriptFullName & Chr(34) & " Run", , "runas", 1
Else

On Error Resume Next

Dim OEM , objWMIService , colItems , objItem , verItems, ver , name
Set objWMIService = GetObject("winmgmts:\\.\root\CIMV2") 
Set verItems = objWMIService.ExecQuery( _
    "SELECT * FROM Win32_OperatingSystem",,48) 
For Each objItem in verItems 
	ver = objItem.Version
	name = Replace (objItem.Caption,"Microsoft ","")
Next

Set colItems = objWMIService.ExecQuery( _
    "SELECT * FROM SoftwareLicensingService",,48) 
For Each objItem in colItems 
    OEM = objItem.OA3xOriginalProductKey
Next
If OEM <> "" Then 
	CreateObject("WScript.Shell").run "slmgr.vbs /ipk " & Trim(OEM), 0, True
	WScript.Sleep 4000
	CreateObject("WScript.Shell").run "slmgr.vbs /ato ", 0, True
End If
End If
