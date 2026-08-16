# Organize downloaded images per demo.
# 1. Move non-jpg files to _unused/
# 2. Rename the first 7 .jpg files per demo to meaningful names
Add-Type -AssemblyName System.Drawing
$ErrorActionPreference = 'Stop'

$root = "C:\Users\brand\work\design-level-up\reference"

$demos = @{
    'driftwood-coffee'  = @{ base = 'coffee'; names = @('roastery.jpg', 'bag.jpg', 'pour-over.jpg', 'beans.jpg', 'morning.jpg', 'cafe.jpg', 'probat.jpg') }
    'petal-and-stem'    = @{ base = 'flower'; names = @('arrangement.jpg', 'bouquet.jpg', 'shop.jpg', 'wedding.jpg', 'closeup.jpg', 'season.jpg', 'workshop.jpg') }
    'lighthouse-books'  = @{ base = 'book';   names = @('shop.jpg', 'stack.jpg', 'reading.jpg', 'shelf.jpg', 'open.jpg', 'corner.jpg', 'bookseller.jpg') }
    'wax-and-groove'    = @{ base = 'record'; names = @('store.jpg', 'turntable.jpg', 'bin.jpg', 'cover.jpg', 'crate.jpg', 'stacks.jpg', 'room.jpg') }
}

foreach ($demo in $demos.Keys) {
    $imgDir = Join-Path $root "$demo/img"
    if (-not (Test-Path $imgDir)) { continue }

    # Move non-jpg to _unused
    $unused = Join-Path $imgDir "_unused"
    New-Item -ItemType Directory -Path $unused -Force | Out-Null
    Get-ChildItem $imgDir -File | Where-Object {
        $_.Extension -notin '.jpg','.jpeg'
    } | ForEach-Object {
        Move-Item $_.FullName -Destination $unused -Force
    }

    # Get the jpg files, sort by name (0.jpg first), pick first 7
    $jpgs = Get-ChildItem $imgDir -Filter "*.jpg" | Sort-Object Name | Select-Object -First 7
    $names = $demos[$demo].names

    Write-Output "=== $demo ==="
    for ($i = 0; $i -lt [Math]::Min($jpgs.Count, $names.Count); $i++) {
        $newName = Join-Path $imgDir $names[$i]
        Move-Item $jpgs[$i].FullName -Destination $newName -Force
        $size = (Get-Item $newName).Length / 1KB
        Write-Output ("  {0,-28} {1:N0} KB" -f $names[$i], $size)
    }
    Write-Output ""
}
