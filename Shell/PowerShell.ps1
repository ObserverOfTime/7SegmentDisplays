$invalid = ".*[gkmqvwxzio].*"
$maxlen = 0

Get-Content words.txt | ForEach-Object {
    if ($_.Length -eq $maxlen -and $_ -notmatch $invalid) {
        $longest += $_
    } elseif ($_.Length -gt $maxlen -and $_ -notmatch $invalid) {
        $longest = @($_)
        $maxlen = $_.Length
    }
}

Write-Output ($longest -join "`n")

# No tests because it takes around half a minute to run
