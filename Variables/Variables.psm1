$dirstart = "C:\Categories\Credentials\"

$login = cat ($dirstart + "login.txt")
$secpasswd = cat ($dirstart + "chnsecurestring.txt") | ConvertTo-SecureString

#IfNoPathCreate $login
#IfNoPathCreate $secpasswd

$LiveCred = New-Object System.Management.Automation.PSCredential ($login, $secpasswd)