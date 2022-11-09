# Must be ran outside of script to set scirpt permission due to security
# powershell Set-ExecutionPolicy unrestricted

# Get OS number 10 or 11
$winVer = (Get-CimInstance -ClassName Cim_OperatingSystem).Name.Split('|')[0].split(' ')[2]

# Location where to download file and install from
$parent_dir='C:\_Windows_FU'
$dir = $parent_dir + '\packages'

if(test-path -PathType container $parent_dir)
{
	# Remove the folder/Files if exist
	Remove-Item "$dir" -Recurse -Force -Confirm:$false
}

# Make the folder
mkdir "$dir"

if ($winVer -eq 10) 
{
	# If the computer Windows 10 the set url for windows 10 upgrade assistant 
	$url = 'http://go.microsoft.com/fwlink/?LinkID=799445'
}
ElseIf ($winVer -eq 11)
{
	# If the computer Windows 10 the set url for windows 11 upgrade assistant 
	$url = 'https://go.microsoft.com/fwlink/?linkid=2171764'
}
else 
{
	echo "This is Not Windows 10 or 11. Abort! Abort!"
	sleep 10
	exit 1
}

# The location and name of Windows 10 or 11 upgrade assistant 
$webClient = New-Object System.Net.WebClient
$file = "$($dir)\WinUpgrade.exe"

# Download the file
$webClient.DownloadFile($url,$file)

# Run the file 
Start-Process -FilePath $file -ArgumentList '/quietinstall /skipeula /auto upgrade /priority normal /SkipCompatCheck /copylogs $dir'

sleep 10

# Remove the download location sub-folder 
Remove-Item "$parent_dir" -Recurse -Force -Confirm:$false

exit 0

#Restore permission - Must be done outside script
#powershell Set-ExecutionPolicy  restricted