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