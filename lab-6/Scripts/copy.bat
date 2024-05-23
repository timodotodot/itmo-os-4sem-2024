@echo off
forfiles /P "C:\Windows" /C "cmd /c if @fsize GTR 2097152 copy @path E:\%computername%\temp /Z"
Pause