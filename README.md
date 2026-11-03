# Quiet Engine

Generative focus music that runs in your browser. Nothing is recorded or streamed: every chord, beat and melody is made live with the Web Audio API, so it never repeats.

**▶ Play it: https://mattseesass.github.io/quiet-engine/**

## What it does

- **Focus modes:** Deep Focus, Light Work, Wind Down and Sleep.
- **Chill genres:** Outsider House, Dreamcore, Lo-fi Hip Hop, Bossa Lounge, Dub Techno and Amapiano.
- **Club genres:** Synthwave, Drum & Bass, Hardstyle 2010, Trance, Balkan House, Old School, Deep House, UK Garage, Nu-Disco, Acid Techno, Phonk and Chiptune.
- **Pulse:** a beat-locked volume ripple in the 200 Hz–1 kHz band, the focus trick brain.fm describes (Woods et al., 2024). You can turn it off.
- **Extras:** background noise (brown, pink, rain), a brainwave tone (binaural or pulsed), A=432/440 tuning, a session timer, a skip button (N), and a Fine-tune panel for each mode.
- **My tracks:** add your own audio files and the pulse runs over them. The files stay on your device.

Your settings are saved in your browser.

## Make your own version

1. Click **Fork** at the top of this page.
2. In your fork, go to **Settings → Pages** and pick **Deploy from a branch**, branch `main`, folder `/docs`.
3. After a minute your copy is live at `https://<your-name>.github.io/quiet-engine/`.

## Editing

The whole app is one file with no dependencies and no build tools.

- `index.html` is the source. It is written as a page fragment (no `<html>`/`<head>`), so it can also run as a claude.ai Artifact.
- `docs/index.html` is the full web page that GitHub Pages serves. After you edit `index.html`, rebuild it:

  ```bash
  python build-standalone.py
  ```

  This also writes `Quiet Engine.html`, a single file you can double-click or send to a friend. Git ignores that file.

To add a mode, copy an entry in `MODES` inside `index.html` and change its tempo, keys, groove patterns and instruments. Drum patterns are one bar of 16th notes: `X` accent, `x` hit, `o` ghost, `.` rest. Give it a `group` (`Chill` or `Club`) to place it in the list, and add a `VARY` entry so Next track can remix it.

## License

MIT. See [LICENSE](LICENSE).
