#Import Imports
Function Import-All
{
	$import_path | dir | foreach{ Import-Module ($import_path+$_.Name) -Verbose}
}

