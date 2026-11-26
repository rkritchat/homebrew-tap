cask "puml-editor" do
  version "1.3"
  sha256 "162cd2358acc8cbdcd4375b0c56b8f1a50b25e0ef46e06a1b55a9c0fec6c12e7"

  url "https://github.com/rkritchat/puml-editor-releases/releases/download/v#{version}/PumlEditor-#{version}.dmg"
  name "Puml Editor"
  desc "Native PlantUML editor with live preview and visual editing"
  homepage "https://github.com/rkritchat/puml-editor-releases"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Puml Editor.app"

  # The app is ad-hoc signed, not notarized: remove the download quarantine so it opens normally.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Puml Editor.app"]
  end

  zap trash: [
    "~/Library/Preferences/local.pumleditor.plist",
    "~/Library/Saved Application State/local.pumleditor.savedState",
  ]
end
