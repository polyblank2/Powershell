Function Login-Credential
{
	$login_contents	= cat $login_path
	$password_contents = cat $password_path | ConvertTo-SecureString
	$combined_credential = New-Object System.Management.Automation.PSCredential ($login_contents, $password_contents)

	#general login process
	if($Session.State -eq "Broken")
	{
		$Session = $NULL
	}
	if([string]::IsNullOrEmpty($Session))
	{
		$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $combined_credential  -Authentication Basic -AllowRedirection
	}
	Import-PSSession $Session -AllowClobber
	get-pssession
	return $Session
}

Function Logout
{
	gsn|rsn;gsn
}