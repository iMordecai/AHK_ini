# AHK_ini
AutoHotkey Functions to read and write ini files.

See the ahk_ini_sample.ahk file for sample code.

**ReadIniFile** will read the file and return a 2 level array of the ini content
```
[section one]
key1=value
key2=value
[section two]
key=value
```
will become an array similar to
```
{"section one": {"key1":"value", "key2":"value"}
,"section two": {"key":"value"} }
```

**WriteIniFile** will overwrite the ini data into the file, (probably) in alphabetical order. Any empty lines or comments will be deleted. It returns 0 if the file was saved or 1 if there was an error.
