cask "puml-editor" do
  version "1.0"
  sha256 "a66c6a98bfefc73bb8db4fb21d4110a727fe3844ba3614ccce8eef7888d621f3"

  url "https://github.com/rkritchat/puml-editor-releases/releases/download/v#{version}/PumlEditor-#{version}.dmg"
  name "Puml Editor"
  desc "Native PlantUML editor with live preview and visual editing"
  homepage "https://github.com/rkritchat/puml-editor-releases"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "Puml Editor.app"

  # The app is ad-hoc signed, not notarized: remove the download quarantine so it opens normally.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Puml Editor.app"]
  end

  zap trash: [
    "~/Library/Preferences/local.pumleditor.plist",
    "~/Library/Saved Application State/local.pumleditor.savedState",
  ]
end
