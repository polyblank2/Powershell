Function Setup-Import-Path
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
	$import_path = $import_path | Path-Helper
	#test-path

	Add-Content ("$env:Documents"+"\WindowsPowerShell\Microsoft.PowerShell_profile.ps1") ("$"+"import_path ="+"""$import_path""")
}

Function Setup-Login
{

$login_path
$login_contents
$password_path
$password_contents
$combined_credential


$login_path = Read-Host 'Where would you like to to store your username?'
$login_path = $login_path | Path-Helper

$password_path = Read-Host 'Where would you like to store your password?'
$password_path = $password_path | Path-Helper

$login_contents	= Read-Host 'What is your username?'

$password_contents = ((Read-Host -assecurestring 'What is your password?') | ConvertFrom-SecureString)

$login_contents	| out-file $login_path
$password_contents	| out-file $password_path

		#load from file?
		#$login = cat ($dirstart + "login.txt")
		#$secpasswd = cat ($dirstart + "chnsecurestring.txt") | ConvertTo-SecureString


$combined_credential = New-Object System.Management.Automation.PSCredential ($login_contents, ($password_contents | ConvertTo-SecureString))

Add-Content ("$env:Documents"+"\WindowsPowerShell\Microsoft.PowerShell_profile.ps1") ("$"+"login_path ="+"""$login_path""")

Add-Content ("$env:Documents"+"\WindowsPowerShell\Microsoft.PowerShell_profile.ps1") ("$"+"password_path ="+"""$password_path""")


}


