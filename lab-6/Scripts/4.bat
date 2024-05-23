@echo off

cd E:\GitHub_Repositories\itmo-os-4sem-2024\lab-6\Temp
set drivers=drivers.txt
set sorted=sorted.txt

driverquery /FO table /SI > %drivers%

sort /R %drivers% /o %sorted%
cd ..