# Homebrew tap for Jot

[Jot](https://sayjot.xyz) is a capture inbox for macOS. Select text anywhere, press Shift twice, and it becomes a Markdown file in a folder you own.

```sh
brew install --cask mohakbajaj/tap/jot
```

If Homebrew says the tap is untrusted, run `brew trust mohakbajaj/tap` and install again.

Jot updates itself, so `brew upgrade` leaves it alone unless you pass `--greedy`. The cask follows each release within the hour.

Uninstalling keeps your notes. They are plain files in `~/Documents/Jot`, or in the folder you picked in Settings.
