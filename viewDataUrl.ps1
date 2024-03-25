$b64 = Get-Clipboard -Raw

if ($b64.length -eq 0) {
	Write-Host "No base64 text in clipboard!" -ForegroundColor Red
	exit
}

if ($b64.IndexOf(';base64,') -gt -1) {
	$b64 = $b64.SubString($b64.IndexOf(';base64,') + 8)
}

$b64 = $b64.Replace("'", '')

# If you'd like a different default path, set that here
# $path = 'C:\Users\Inkarnate\Temp\' 
$path = "$(Get-Location)\\"

$filename = ('' + [DateTimeOffset]::UtcNow.ToUnixTimeMilliseconds() + '.png')

New-Item -Path $path -Name $filename -ItemType "file"

try {
	$bytes = [Convert]::FromBase64String($b64)
	[IO.File]::WriteAllBytes(($path + $filename), $bytes)

	Write-Host ("Exported to: " + ($path + $filename))
	Invoke-Item -Path ($path + $filename)
}
catch {
	Write-Host $_ -ForegroundColor Red
	Remove-Item -Path ($path + $filename)
}

