cask "jot" do
  version "2.3.1"
  sha256 "d977f7b9b3b0a736382af5d0fa4d9766253b93a0b98b651ec6282e644dfd3a4a"

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
