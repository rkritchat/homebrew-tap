cask "puml-editor" do
  version "1.1"
  sha256 "aeb9517fb3dcdb57aaf35ced4db193fce93861b7a0dabca6038b3fe4e83a6a05"

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
