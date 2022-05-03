powershell Set-ExecutionPolicy unrestricted

powershell curl.exe -LJ https://raw.githubusercontent.com/nexusofdoom/Windows-10-Feature-Update/main/Windows_10_X64_Update_Script.ps1 -o C:\Windows\Temp\Windows_10_X64_Update_Script.ps1

cd C:\Windows\Temp

powershell .\Windows_10_X64_Update_Script.ps1

powershell Set-ExecutionPolicy  restricted

del C:\Windows\Temp\Update.bat
