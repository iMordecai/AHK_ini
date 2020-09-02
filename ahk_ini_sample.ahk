SetWorkingDir %A_ScriptDir% 
#Include ini.ahk

inifile := "settings.ini"
iniArray := ReadIniFile(inifile)

MsgBox % "The capitol city for Austria is " iniArray["capital cities"]["Austria"]

iniArray["New Section"] := {}
iniArray["New Section"]["thing 1"] := "first"
iniArray["New Section"]["thing 2"] := "second"

MsgBox % WriteIniFile(iniArray, inifile)

ExitApp
Return