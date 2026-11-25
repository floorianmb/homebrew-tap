cask "tidywise" do
  version "0.4.1"
  sha256 "5f37ff06dbcbd237a35c40acd39651a4f6ac5a03fa1c8f25f99733073a087793"

  url "https://github.com/floorianmb/tidywise/releases/download/v#{version}/Tidywise.zip"
  name "Tidywise"
  desc "Sort loose Mac files into topic folders locally with Ollama and MCP"
  homepage "https://github.com/floorianmb/tidywise"

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "Tidywise.app"

  zap trash: [
    "~/Library/Application Support/tidywise",
    "~/Library/Logs/tidywise",
    "~/.config/tidywise",
  ]

  caveats <<~EOS
    Tidywise needs Python 3.12+ and Ollama (both free):
      brew install python ollama

    Tidywise is not signed with a paid Apple Developer certificate yet.
    If macOS blocks the first launch, either install with:
      brew install --cask --no-quarantine floorianmb/tap/tidywise
    or allow it once under System Settings -> Privacy & Security -> Open Anyway.
  EOS
end
