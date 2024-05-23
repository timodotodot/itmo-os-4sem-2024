@echo off

cd E:\GitHub_Repositories\itmo-os-4sem-2024\lab-6\Temp

@REM 1.1
mkdir LAB6
cd LAB6
ver > OSVersion.txt
wmic OS get FreePhysicalMemory,TotalVisibleMemorySize /Value > Memory.txt
wmic logicaldisk get Caption,Description,FileSystem,FreeSpace,Size,VolumeName > Disk.txt

@REM 1.2
mkdir TEST
copy OSVersion.txt TEST
copy Memory.txt TEST
copy Disk.txt TEST
cd TEST

@REM 1.3
copy OSVersion.txt+Memory.txt+Disk.txt AllFiles.txt

@REM 1.4
del OSVersion.txt Memory.txt Disk.txt

@REM 1.5
doskey /History>History.txt
cd ..
cd ..
cd ..
