"""Regenerate the geometric development icon (requires Pillow)."""
from pathlib import Path
import json
from PIL import Image, ImageDraw

root = Path(__file__).resolve().parents[1]
assets = root / "LanScope/Assets.xcassets"
icons = assets / "AppIcon.appiconset"
icons.mkdir(parents=True, exist_ok=True)
info = {"info": {"author": "xcode", "version": 1}}
(assets / "Contents.json").write_text(json.dumps(info, indent=2) + "\n")
canvas = Image.new("RGB", (1024, 1024), (13, 27, 46))
draw = ImageDraw.Draw(canvas)
for radius in (140, 250, 360):
    draw.ellipse((512-radius, 512-radius, 512+radius, 512+radius),
                 outline=(40, 79, 108), width=12)
draw.line((512, 512, 754, 270), fill=(61, 224, 194), width=24)
for x, y, r in ((512, 512, 35), (754, 270, 30), (279, 420, 26), (609, 741, 26)):
    draw.ellipse((x-r, y-r, x+r, y+r), fill=(88, 241, 208))
canvas.save(icons / "AppIcon.png")
info["images"] = [{"filename": "AppIcon.png", "idiom": "universal",
                   "platform": "ios", "size": "1024x1024"}]
(icons / "Contents.json").write_text(json.dumps(info, indent=2) + "\n")

