# Direct approach: find each <h3 class="pick-title">X</h3> line, walk back
# to the <li> opening tag, insert the <div class="pick-art"> block after it.
$ErrorActionPreference = 'Stop'
$path = "C:\Users\brand\work\design-level-up\reference\lighthouse-books/index.html"
$content = Get-Content $path -Raw

$bookImages = @(
    @{ title = "The Lighthouse Keeper's Daughter"; image = 'shop.jpg' },
    @{ title = "The Cartographer's Notebook";      image = 'stack.jpg' },
    @{ title = 'A History of Maine Lighthouses';    image = 'open.jpg' },
    @{ title = "The Owl Who Was Afraid of the Dark"; image = 'corner.jpg' }
)

$count = 0
foreach ($b in $bookImages) {
    $title = $b.title
    $img = $b.image

    # Find the <h3> line for this title, then walk back to the most recent <li ...> tag.
    $titlePattern = '<h3 class="pick-title">' + [regex]::Escape($title) + '</h3>'
    $titleMatch = [regex]::Match($content, $titlePattern)
    if (-not $titleMatch.Success) {
        Write-Warning "  No title match for '$title'"
        continue
    }

    # Search backward from the title for the <li class="pick..."> opening.
    # Use a reversed search: find all <li class="pick..."> matches in the prefix,
    # then take the last one.
    $beforeTitle = $content.Substring(0, $titleMatch.Index)
    $liMatches = [regex]::Matches($beforeTitle, '<li class="pick[^"]*">')
    if ($liMatches.Count -eq 0) {
        Write-Warning "  No <li> opening found for '$title'"
        continue
    }
    $liMatch = $liMatches[$liMatches.Count - 1]
    if (-not $liMatch.Success) {
        Write-Warning "  No <li> opening found for '$title'"
        continue
    }

    # Check if pick-art is already there
    $between = $content.Substring($liMatch.Index + $liMatch.Length, $titleMatch.Index - ($liMatch.Index + $liMatch.Length))
    if ($between.Contains('pick-art')) {
        Write-Output ("  {0} -- already has image, skipping" -f $title)
        continue
    }

    $insertAt = $liMatch.Index + $liMatch.Length
    $insert = "`n            <div class=`"pick-art`"><img src=`"img/$img`" alt=`"$title`" loading=`"lazy`" decoding=`"async`" /></div>"
    $content = $content.Substring(0, $insertAt) + $insert + $content.Substring($insertAt)
    $count++
    Write-Output "  $title -> $img"
}

Set-Content $path -Value $content -NoNewline
Write-Output ""
Write-Output ("Added {0} image slots" -f $count)
