"""Wraps index.html (written for claude.ai Artifacts) into a normal web page.
Writes docs/index.html (served by GitHub Pages) and Quiet Engine.html (a single file you can double-click or send to someone)."""
import os

HERE = os.path.dirname(os.path.abspath(__file__))
HEAD = ('<!doctype html>\n<html lang="en">\n<head>\n<meta charset="utf-8">\n'
        '<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n'
        '<style>:root{padding-top:env(safe-area-inset-top);padding-bottom:env(safe-area-inset-bottom)}'
        'body{margin:0;font:14px system-ui}img{max-width:100%}</style>\n</head>\n<body>\n')

with open(os.path.join(HERE, "index.html"), encoding="utf-8") as f:
    page = f.read()
os.makedirs(os.path.join(HERE, "docs"), exist_ok=True)
for out in ("docs/index.html", "Quiet Engine.html"):
    with open(os.path.join(HERE, out), "w", encoding="utf-8") as f:
        f.write(HEAD + page + "\n</body>\n</html>\n")
    print("Wrote", out)
