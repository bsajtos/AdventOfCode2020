[int[]]$numbers = Get-Clipboard -Format Text 

foreach ($1stnumber in $numbers) {
    foreach ($2ndnumber in $numbers) {
        if (($1stnumber + $2ndnumber) -eq 2020) {"1st: $1stnumber`n2nd: $2ndnumber`nsum: $($1stnumber + $2ndnumber)`nproduct: $($1stnumber*$2ndnumber)";return}
    }
}

