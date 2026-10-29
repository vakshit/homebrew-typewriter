cask "typewriter" do
  version "0.1.0"
  sha256 :no_check

  url "https://github.com/vakshit/homebrew-typewriter/releases/download/v#{version}/Typewriter_#{version}_aarch64.dmg"
  name "Typewriter"
  desc "Minimalist, private-by-default Markdown writing app for journalists"
  homepage "https://typewriter.app"

  depends_on macos: :ventura
  depends_on arch: :arm64

  app "Typewriter.app"

  postflight do
  system_command "/usr/bin/xattr",
                 args: ["-cr", "#{appdir}/Typewriter.app"]
  end

  zap trash: [
    "~/Library/Application Support/app.typewriter.desktop",
    "~/Library/Caches/app.typewriter.desktop",
    "~/Library/Preferences/app.typewriter.desktop.plist",
    "~/Library/Saved Application State/app.typewriter.desktop.savedState",
  ]
end
