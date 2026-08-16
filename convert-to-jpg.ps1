# Convert all PNG screenshots to JPG with quality 85
# This script is for one-time conversion; safe to delete after.

Add-Type -AssemblyName System.Drawing
$ErrorActionPreference = 'Stop'

$root = "C:\Users\brand\work\design-level-up\screenshots"
$quality = [System.Drawing.Imaging.EncoderParameters]::new(1)
$quality.Param[0] = [System.Drawing.Imaging.EncoderParameter]::new(
    [System.Drawing.Imaging.Encoder]::Quality, [long]85)

$jpgCodec = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() |
    Where-Object { $_.MimeType -eq 'image/jpeg' }

function Convert-PngToJpg($pngPath, $jpgPath) {
    $img = [System.Drawing.Image]::FromFile($pngPath)
    $img.Save($jpgPath, $jpgCodec, $quality)
    $img.Dispose()
}

$dirs = @('desktop', 'mobile')
foreach ($dir in $dirs) {
    $inDir  = Join-Path $root $dir
    $outDir = Join-Path $root "$dir-jpg"
    New-Item -ItemType Directory -Path $outDir -Force | Out-Null
    Get-ChildItem $inDir -Filter "*.png" | ForEach-Object {
        $jpgName = [System.IO.Path]::ChangeExtension($_.Name, '.jpg')
        Convert-PngToJpg $_.FullName (Join-Path $outDir $jpgName)
    }
}

Write-Output "Converted to JPGs."
Get-ChildItem "$root\desktop-jpg\*.jpg" | ForEach-Object {
    $kb = $_.Length / 1KB
    Write-Output ("  desktop-jpg/{0,-30} {1:N0} KB" -f $_.Name, $kb)
}
Get-ChildItem "$root\mobile-jpg\*.jpg" | ForEach-Object {
    $kb = $_.Length / 1KB
    Write-Output ("  mobile-jpg/{0,-30} {1:N0} KB" -f $_.Name, $kb)
}
