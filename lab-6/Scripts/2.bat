@echo off

mkdir E:\%computername%\temp
net share temp=E:\%computername%\temp

schtasks /create /f /sc minute /tn copy /tr E:\GitHub_Repositories\itmo-os-4sem-2024\lab-6\Scripts\copy.bat

taskkill /IM copy.bat /T /F
E:\GitHub_Repositories\itmo-os-4sem-2024\lab-6\Scripts\copy.bat
schtasks /delete /f /tn copy