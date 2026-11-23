cask "puml-editor" do
  version "1.2"
  sha256 "4ec37ab7dc4c92239a8a6efcc43152c3554253cbba9b261c309c8a7ccc2216d4"

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
