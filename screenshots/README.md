# Screenshots

Pre-rendered screenshots of all 5 reference pages, in two widths.

## Desktop (1440px wide, full page)

- `desktop-jpg/yard-and-larder.jpg` — Nashville general store
- `desktop-jpg/driftwood-coffee.jpg` — Asheville coffee roastery
- `desktop-jpg/petal-and-stem.jpg` — Brooklyn florist
- `desktop-jpg/lighthouse-books.jpg` — Portland bookshop
- `desktop-jpg/wax-and-groove.jpg` — Detroit record store

## Mobile (375px wide, full page)

- `mobile-jpg/*.jpg` — same five, mobile width

## How to regenerate

```
powershell -File convert-to-jpg.ps1
```

Or to regenerate the PNGs from scratch:

```
$edge = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
& $edge --headless --disable-gpu --no-sandbox --hide-scrollbars `
  --window-size=1440,6500 `
  --screenshot="screenshots/desktop/<name>.png" `
  "file:///$PWD/reference/<name>/index.html"
```
