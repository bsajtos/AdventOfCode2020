$valids = @()
$validsNew = @()

foreach ($policy in (import-csv C:\temp\day2.txt -Delimiter ' ' -Header 'MinMax','Letter','Pw') ) {

    Add-Member -InputObject $policy -MemberType NoteProperty -Name 'Min' -Value $($policy.Minmax -split '-')[0]
    Add-Member -InputObject $policy -MemberType NoteProperty -Name 'Max' -Value $($policy.Minmax -split '-')[1]
    $policy.Letter = ($policy.Letter).replace(':','')
    Add-Member -InputObject $policy -MemberType NoteProperty -Name 'Occurence' -Value $($policy.Pw.Split($policy.letter).count -1)
    
    #part1
    if (($policy.Occurence -ge $policy.Min) -and ($policy.Occurence -le $policy.Max)){
        $valids += $policy
    }

    #part2
    if (($policy.Pw.ToCharArray()[$policy.Min-1] -eq $policy.Letter) -xor ($policy.Pw.ToCharArray()[$policy.Max-1] -eq $policy.Letter)) {
        $validsNew += $policy
    }

} 

Write-Output "Part 1: $($valids.count)"
Write-Output "Part 2: $($validsNew.count)"

