;===============================================================================
;                   https://github.com/iMordecai/AHK_ini
;===============================================================================

;===============================================================================
; This file will load the ini data into an array.
; It will also save ini data into the file.
;
; The structure of the ini file should be as follows
; * empty lines are allowed in the file, but will be erased when written 
; * sections names are surrounded with []
; * key-value pairs are write like this key=value 
; Writing the ini data will:
; * will not write any empty lines or comments in the original file 
; * will write the sections and key-value pairs in a different order
;===============================================================================


; returns array of the data in the ini file name
ReadIniFile(filename)
{
	FileRead, inifile, % filename
	if ErrorLevel
		MsgBox file not loaded

	;Load file data into an array 
	iniArray := {}

	For, k,line in StrSplit(inifile, "`n", "`r")
		If (RegExMatch(line ,"^[ \t]*\[([\w\- ]+)\]", ss))
			iniArray[ss1] := {} , ssn := ss1
		Else If (RegExMatch(line , "^[ \t]*(.+)=([^;]+)", kv))
			iniArray[ssn][kv1] := kv2

	Return iniArray
}


; writes an array into ini file 
WriteIniFile(data, filename)
{
	For section_name, kv in data
	{
		out .= "[" section_name "]`n"
		For k,v in kv
			out .= k "=" v "`n"
	}
	FileDelete, %filename%
	FileAppend, %out%, %filename%
	Return ErrorLevel
}