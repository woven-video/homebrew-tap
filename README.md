# Woven Homebrew tap

This is the content of the `woven-video/homebrew-tap` repository: one cask, `Casks/woven.rb`.

```bash
brew install --cask woven-video/tap/woven
```

Woven updates itself (Sparkle), so the cask only matters for fresh installs. `/release-woven` bumps the cask's `version` and `sha256` with `scripts/update-homebrew-cask.sh` on every release.

This directory mirrors `woven-harness/packaging/homebrew`; edit it there, then copy it to the tap.
