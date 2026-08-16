# Replace SVG placeholders with real <img> tags in all 4 demo HTMLs.
# For each demo, find the <div class="placeholder-photo"> for each item
# and replace it with an <img> tag pointing to the local image file.
$ErrorActionPreference = 'Stop'

$root = "C:\Users\brand\work\design-level-up\reference"

# Mapping: demo -> (aria-label-substring, image filename)
$replacements = @{
    'driftwood-coffee' = @(
        @{ match = 'Guatemala, Huehuetenango'; image = 'roastery.jpg' },
        @{ match = 'Ethiopia, Yirgacheffe';     image = 'bag.jpg' },
        @{ match = 'Colombia, Huila';           image = 'pour-over.jpg' },
        @{ match = 'Kenya, Nyeri';              image = 'beans.jpg' },
        @{ match = 'Sumatra, Mandheling';       image = 'morning.jpg' },
        @{ match = 'The House Blend';           image = 'cafe.jpg' }
    )
    'petal-and-stem' = @(
        @{ match = 'The Wednesday';     image = 'arrangement.jpg' },
        @{ match = 'The Low Bowl';      image = 'bouquet.jpg' },
        @{ match = 'The Brunch Jar';    image = 'shop.jpg' }
    )
    'lighthouse-books' = @(
        @{ match = "Lighthouse Keeper's Daughter";  image = 'shop.jpg' },
        @{ match = 'Cartographer';                    image = 'stack.jpg' },
        @{ match = 'Late September';                  image = 'reading.jpg' },
        @{ match = 'The Field Notes';                 image = 'shelf.jpg' },
        @{ match = 'History of Maine Lighthouses';    image = 'open.jpg' },
        @{ match = 'Owl Who Was Afraid';              image = 'corner.jpg' }
    )
    'wax-and-groove' = @(
        @{ match = 'Model 500, Starlight';            image = 'store.jpg' },
        @{ match = 'Donuts, J Dilla';                 image = 'turntable.jpg' },
        @{ match = 'A Love Supreme, Coltrane';        image = 'bin.jpg' },
        @{ match = 'The Miseducation, Lauryn Hill';   image = 'cover.jpg' },
        @{ match = 'Voodoo, D''Angelo';               image = 'crate.jpg' },
        @{ match = 'Selected Ambient Works, Aphex Twin'; image = 'stacks.jpg' }
    )
}

foreach ($demo in $replacements.Keys) {
    $htmlPath = Join-Path $root "$demo/index.html"
    if (-not (Test-Path $htmlPath)) { continue }
    $content = Get-Content $htmlPath -Raw
    $count = 0

    foreach ($r in $replacements[$demo]) {
        $match = $r.match
        $img = $r.image

        # The old block spans multiple lines with specific format.
        # Use regex with single-line mode to match across newlines.
        $pattern = '(?s)<div class="placeholder-photo"[^>]*aria-label="Photo placeholder: ' + [regex]::Escape($match) + '[^"]*"[^>]*>\s*<span>[^<]*</span>\s*</div>'
        $replacement = "<img src=`"img/$img`" alt=`"$match`" loading=`"lazy`" decoding=`"async`" />"

        $newContent = [regex]::Replace($content, $pattern, $replacement)
        if ($newContent -ne $content) {
            $count++
            $content = $newContent
        } else {
            Write-Warning "  No match for '$match' in $demo"
        }
    }

    Set-Content $htmlPath -Value $content -NoNewline
    Write-Output ("{0}: replaced {1} placeholders" -f $demo, $count)
}
