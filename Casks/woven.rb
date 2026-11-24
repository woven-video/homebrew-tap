cask "woven" do
  version "0.2.57"
  sha256 "0df17854779aa70cb105f70863136293a6915b6f5d63b8bbb49780f27919cfb1"

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
