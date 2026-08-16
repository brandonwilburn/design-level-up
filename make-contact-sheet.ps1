# Build contact-sheet image: 5 desktop demos, side by side.
# Uses the simpler "create resized bitmap, then composite" approach.
Add-Type -AssemblyName System.Drawing
$ErrorActionPreference = 'Stop'

$root = "C:\Users\brand\work\design-level-up\screenshots"
$demos = @(
    @{ name = "yard-and-larder"; label = "Yard & Larder - Nashville - Refined" },
    @{ name = "driftwood-coffee"; label = "Driftwood Coffee - Asheville - Morning" },
    @{ name = "petal-and-stem"; label = "Petal & Stem - Brooklyn - Alive" },
    @{ name = "lighthouse-books"; label = "Lighthouse Books - Portland - Considered" },
    @{ name = "wax-and-groove"; label = "Wax & Groove - Detroit - Dark" }
)

$colW = 480
$heroH = 1500

# Step 1: for each source, create a scaled bitmap (480 x 500)
$resizedImgs = @()
foreach ($d in $demos) {
    $p = Join-Path $root "desktop-jpg\$($d.name).jpg"
    $src = [System.Drawing.Image]::FromFile($p)
    # Destination: 480 x (480 / 1440 * 1500) = 480 x 500
    $destH = [int]($colW / $src.Width * $heroH)
    $resized = New-Object System.Drawing.Bitmap $colW, $destH
    $rg = [System.Drawing.Graphics]::FromImage($resized)
    $rg.InterpolationMode = 'HighQualityBicubic'
    $rg.DrawImage($src, 0, 0, $colW, $destH)
    $rg.Dispose()
    $src.Dispose()
    $resizedImgs += [pscustomobject]@{ demo = $d; img = $resized; h = $destH }
}

# Step 2: build the contact sheet
$gapH = 60
$topPad = 80
$bottomPad = 40
$totalH = $topPad + $resizedImgs[0].h + ($resizedImgs.Count - 1) * $gapH + $bottomPad
$totalW = $resizedImgs.Count * $colW + ($resizedImgs.Count + 1) * 40

Write-Output "Contact sheet: ${totalW}x${totalH}"

$bmp = New-Object System.Drawing.Bitmap $totalW, $totalH
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::FromArgb(245, 240, 230))

# Title
$titleFont = New-Object System.Drawing.Font("Georgia", 22, [System.Drawing.FontStyle]::Italic)
$titleBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(40, 30, 25))
$g.DrawString("Design Level Up - 5 Reference Sites", $titleFont, $titleBrush, 24, 24)
$subFont = New-Object System.Drawing.Font("Georgia", 12, [System.Drawing.FontStyle]::Italic)
$subBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(120, 100, 80))
$g.DrawString("Desktop screenshots, side by side. Same depth principles, different vibes.", $subFont, $subBrush, 24, 56)

# Draw each
$x = 40
$y = $topPad
$labelFont = New-Object System.Drawing.Font("Georgia", 12, [System.Drawing.FontStyle]::Regular)
$labelBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(60, 50, 40))
foreach ($r in $resizedImgs) {
    $g.DrawImage($r.img, $x, $y)
    $g.DrawString($r.demo.label, $labelFont, $labelBrush, $x, $y + $r.h + 12)
    $x += $colW + 40
}

# Save JPG
$quality = [System.Drawing.Imaging.EncoderParameters]::new(1)
$quality.Param[0] = [System.Drawing.Imaging.EncoderParameter]::new(
    [System.Drawing.Imaging.Encoder]::Quality, [long]85)
$jpgCodec = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() |
    Where-Object { $_.MimeType -eq 'image/jpeg' }

$outPath = Join-Path $root "contact-sheet.jpg"
$bmp.Save($outPath, $jpgCodec, $quality)
$bmp.Dispose()
foreach ($r in $resizedImgs) { $r.img.Dispose() }

$kb = (Get-Item $outPath).Length / 1KB
Write-Output "Saved: $outPath ($([math]::Round($kb)) KB)"
