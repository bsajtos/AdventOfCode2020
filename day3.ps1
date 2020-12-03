
<#
Challange: https://adventofcode.com/2020/day/3
Input: https://adventofcode.com/2020/day/3/input
#>

#copy the input to clipboard, and import it as a multidimensional matrix
$forest = Get-Clipboard | % {(,($_.ToCharArray()))}

$Patterns = @(
    (@(1,1)), #Right 1, down 1.
    (@(3,1)), #Right 3, down 1. (This is the slope you already checked.)
    (@(5,1)), #Right 5, down 1.
    (@(7,1)), #Right 7, down 1.
    (@(1,2))  #Right 1, down 2.
)

$forestWidth = $forest[0].Length #31
$product = 1
 
foreach ($pattern in $Patterns) {
    $Y = -$pattern[0]
    $tree = 0
   
    for ($X = 0; $X -lt $forest.count; $X += $pattern[1] ) {

        if ($Y + $pattern[0] -gt $forestWidth - 1) {$Y = $Y - $forestWidth + $pattern[0]}
        else {$Y += $pattern[0]}

        if ($forest[$X][$Y] -eq '#') {$tree++}  
    }
    
    Write-Host "Right $($pattern[0]), down $($pattern[1]) - Trees: $tree"
    $product *= $tree
}

Write-Host "Product: $product"


