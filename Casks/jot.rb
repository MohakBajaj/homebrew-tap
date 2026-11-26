cask "jot" do
  version "2.3.3"
  sha256 "ddcbb28f3972d710564217f1140985726646a676549c51919044b7c0e011a12e"

  url "https://dl.sayjot.xyz/v#{version}/Jot-#{version}.dmg"
  name "Jot"
  desc "Capture inbox that saves text, voice and screenshots as Markdown files"
  homepage "https://sayjot.xyz/"

  livecheck do
    url "https://dl.sayjot.xyz/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on macos: :monterey

  app "Jot.app"

  # Notes live in ~/Documents/Jot (or the folder picked in Settings). They are never removed.
  zap trash: [
    "~/Library/Application Support/Jot",
    "~/Library/Caches/dev.mohak.jot",
    "~/Library/HTTPStorages/dev.mohak.jot",
    "~/Library/Preferences/dev.mohak.jot.plist",
    "~/Library/Saved Application State/dev.mohak.jot.savedState",
  ]
end
