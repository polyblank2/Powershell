Function Setup-Import-Path-and-Import
{
	Filter Path-Helper
	{
	$path = $_
	$helper_substring = $path.Length
	$last_char = $path.substring($helper_substring-1)
	if($last_char -ne '\')
	{
		$path = ($path+'\')
	}
	return $path
	}

	$import_path = Read-Host 'Where would you like to be your Import Path?'
	$import_path = ($import_path | Path-Helper)
	#test-path

	Add-Content ("$env:Documents"+"\WindowsPowerShell\Microsoft.PowerShell_profile.ps1") ("$"+"import_path ="+"""$import_path""")

	$import_path | dir | foreach{ Import-Module ($import_path+$_.Name) -Verbose}
}

Setup-Import-Path-and-Import