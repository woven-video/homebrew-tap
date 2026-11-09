cask "woven" do
  version "0.2.44"
  sha256 "110bf4a9f813a159d4e8a2e9bad3b1b4a73b7102e3b7780f31a689714959221b"

  url "https://release.woven.video/Woven-#{version}.dmg"
  name "Woven"
  desc "Video editor for short-form reels that AI apps can drive"
  homepage "https://woven.video/"

  livecheck do
    url "https://release.woven.video/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  # The app bundle is universal, but its bundled MediaTools (ffmpeg) is arm64 only.
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Woven.app"

  uninstall quit: "com.woven.harness"

  # Never list ~/Movies/Woven or ~/Documents/Woven (user workspaces), ~/.woven, or the QA bundle id.
  # --zap also removes Application Support/Woven: sign-in, imported fonts and MCP media.
  zap trash: [
    "~/Library/Application Support/Woven",
    "~/Library/Caches/com.woven.harness",
    "~/Library/HTTPStorages/com.woven.harness",
    "~/Library/Logs/Woven",
    "~/Library/Preferences/com.woven.harness.plist",
    "~/Library/Saved Application State/com.woven.harness.savedState",
    "~/Library/WebKit/com.woven.harness",
  ]
end
