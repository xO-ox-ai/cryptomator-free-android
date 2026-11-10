# Original Cryptomator Free artwork, 2026-11-10. Licensed under GPL-3.0.
# Run from the repository root on Windows to regenerate Android vectors and the README PNG.
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Drawing
$repoRoot = Split-Path $PSScriptRoot -Parent
$shield = 'M54,24 L78,34 L75,60 C72,73 63,81 54,86 C45,81 36,73 33,60 L30,34 Z'
$letter = 'M45,39 L65,39 L65,45 L51,45 L51,52 L63,52 L63,58 L51,58 L51,71 L45,71 Z'
$vector = @"
<?xml version="1.0" encoding="utf-8"?>
<!-- Original Cryptomator Free icon; GPL-3.0. -->
<vector xmlns:android="http://schemas.android.com/apk/res/android"
    android:width="108dp" android:height="108dp"
    android:viewportWidth="108" android:viewportHeight="108">
    <path android:pathData="$shield" android:fillColor="#143D49"
        android:strokeColor="#5CE0BC" android:strokeWidth="3" android:strokeLineJoin="round" />
    <path android:pathData="$letter" android:fillColor="#F5FBFF" />
</vector>
"@
$monochrome = @"
<?xml version="1.0" encoding="utf-8"?>
<vector xmlns:android="http://schemas.android.com/apk/res/android"
    android:width="108dp" android:height="108dp"
    android:viewportWidth="108" android:viewportHeight="108">
    <path android:pathData="$shield" android:fillColor="#00000000"
        android:strokeColor="#FFFFFF" android:strokeWidth="3" android:strokeLineJoin="round" />
    <path android:pathData="$letter" android:fillColor="#FFFFFF" />
</vector>
"@
$svg = @"
<svg xmlns="http://www.w3.org/2000/svg" width="512" height="512" viewBox="0 0 108 108">
  <title>Cryptomator Free — independent, unofficial fork</title>
  <rect width="108" height="108" rx="24" fill="#0C2232"/>
  <path d="$shield" fill="#143D49" stroke="#5CE0BC" stroke-width="3" stroke-linejoin="round"/>
  <path d="$letter" fill="#F5FBFF"/>
</svg>
"@
$utf8 = [System.Text.UTF8Encoding]::new($false)
function Write-Utf8($relativePath, $content) {
    [System.IO.File]::WriteAllText((Join-Path $repoRoot $relativePath), $content + "`n", $utf8)
}
Write-Utf8 'branding/logo.svg' $svg
foreach ($relativePath in @(
    'presentation/src/main/res/drawable/ic_launcher_foreground.xml',
    'presentation/src/lite/res/drawable/ic_launcher_foreground.xml',
    'presentation/src/main/res/drawable/ic_cryptomator_bot.xml',
    'presentation/src/main/res/drawable-night/ic_cryptomator_bot.xml'
)) { Write-Utf8 $relativePath $vector }
Write-Utf8 'presentation/src/main/res/drawable/ic_launcher_foreground_monochrome.xml' $monochrome
foreach ($variant in @('main', 'lite', 'debug', 'liteDebug')) {
    Write-Utf8 "presentation/src/$variant/res/values/ic_launcher_background.xml" @'
<?xml version="1.0" encoding="utf-8"?>
<resources><color name="ic_launcher_background">#0C2232</color></resources>
'@
}
foreach ($variant in @('main', 'debug')) {
    Write-Utf8 "presentation/src/$variant/res/drawable/ic_launcher_background.xml" @'
<?xml version="1.0" encoding="utf-8"?>
<vector xmlns:android="http://schemas.android.com/apk/res/android"
    android:width="108dp" android:height="108dp" android:viewportWidth="108" android:viewportHeight="108">
    <path android:fillColor="#0C2232" android:pathData="M0,0h108v108h-108z" />
</vector>
'@
}

$bitmap = [System.Drawing.Bitmap]::new(1024, 1024)
$graphics = [System.Drawing.Graphics]::FromImage($bitmap)
$graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$graphics.ScaleTransform((1024 / 108), (1024 / 108))
$background = [System.Drawing.Drawing2D.GraphicsPath]::new()
$background.AddArc(0, 0, 48, 48, 180, 90)
$background.AddArc(60, 0, 48, 48, 270, 90)
$background.AddArc(60, 60, 48, 48, 0, 90)
$background.AddArc(0, 60, 48, 48, 90, 90)
$background.CloseFigure()
$navy = [System.Drawing.SolidBrush]::new([System.Drawing.ColorTranslator]::FromHtml('#0C2232'))
$teal = [System.Drawing.SolidBrush]::new([System.Drawing.ColorTranslator]::FromHtml('#143D49'))
$white = [System.Drawing.SolidBrush]::new([System.Drawing.ColorTranslator]::FromHtml('#F5FBFF'))
$mint = [System.Drawing.Pen]::new([System.Drawing.ColorTranslator]::FromHtml('#5CE0BC'), 3)
$mint.LineJoin = [System.Drawing.Drawing2D.LineJoin]::Round
$outline = [System.Drawing.Drawing2D.GraphicsPath]::new()
$outline.AddLine(54,24,78,34)
$outline.AddLine(78,34,75,60)
$outline.AddBezier(75,60,72,73,63,81,54,86)
$outline.AddBezier(54,86,45,81,36,73,33,60)
$outline.AddLine(33,60,30,34)
$outline.CloseFigure()
$graphics.FillPath($navy, $background)
$graphics.FillPath($teal, $outline)
$graphics.DrawPath($mint, $outline)
$points = @((45,39),(65,39),(65,45),(51,45),(51,52),(63,52),(63,58),(51,58),(51,71),(45,71)) | ForEach-Object { [System.Drawing.PointF]::new($_[0], $_[1]) }
$graphics.FillPolygon($white, [System.Drawing.PointF[]]$points)
$bitmap.Save((Join-Path $PSScriptRoot 'logo.png'), [System.Drawing.Imaging.ImageFormat]::Png)
foreach ($disposable in @($graphics, $bitmap, $background, $outline, $navy, $teal, $white, $mint)) { $disposable.Dispose() }
Write-Output 'Generated Cryptomator Free vector icons and logo.png.'
