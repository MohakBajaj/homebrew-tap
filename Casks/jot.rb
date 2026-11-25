cask "jot" do
  version "2.3.2"
  sha256 "ccffb61c12dbb077deea05d52698e730126f6946fe6b7376c87d4486c3839b36"

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
