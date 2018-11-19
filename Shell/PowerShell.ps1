$invalid = ".*[gkmqvwxzio].*"
$maxlen = 0

Get-Content words.txt | ForEach-Object {
    if($_.Length -eq $maxlen) {
        if($_ -notmatch $invalid) {
            $longest += $_
        }
    } elseif($_.Length -gt $maxlen) {
        if($_ -notmatch $invalid) {
            $longest = @($_)
            $maxlen = $_.Length
        }
    }
}

Write-Output ($longest -join "`n")

