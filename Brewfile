# Ferramentas comuns às máquinas: brew bundle --file=Brewfile
# O que é de uma máquina só fica em ~/.Brewfile.local (fora do git).
# Não use `brew bundle cleanup`: ele pode tratar como sobra o que não estiver na lista.

brew "bat"
brew "clojure"
brew "difftastic"
brew "eza"
brew "fd"
brew "fzf"
brew "gh"
brew "glow"
brew "jq"
brew "just"
brew "leiningen"
brew "mole"
brew "neovim"
brew "node" # o pnpm do brew não traz o node
brew "pnpm"
brew "ripgrep"
brew "rtk"
brew "starship"
brew "tlrc"
brew "uv"
brew "zoxide"

cask "caffeine"
cask "font-jetbrains-mono-nerd-font"
cask "wezterm"

# JDKs variam por máquina: em ~/.Brewfile.local, use por exemplo cask "temurin@21"

local_brewfile = File.expand_path("~/.Brewfile.local")
instance_eval(File.read(local_brewfile)) if File.exist?(local_brewfile)
