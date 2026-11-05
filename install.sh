#!/usr/bin/env zsh
# Liga os arquivos do repo ao $HOME. Pode repetir à vontade.
# O que já existir vai para ~/.dotfiles-backup/<data>. Use --dry-run para só ver.
set -euo pipefail

REPO="${${(%):-%N}:A:h}"
BACKUP="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"
DRY_RUN=false

if [[ "${1:-}" == "--dry-run" ]]; then
  DRY_RUN=true
fi

run() {
  if $DRY_RUN; then
    print "[dry-run] $*"
  else
    "$@"
  fi
}

link() {
  local src="$REPO/$1" dest="$2"

  if [[ -L "$dest" && "${dest:A}" == "${src:A}" ]]; then
    print "ok        $dest"
    return
  fi

  if [[ -e "$dest" || -L "$dest" ]]; then
    run mkdir -p -m 700 "$BACKUP"
    run mv "$dest" "$BACKUP/${dest:t}"
    print "backup    $dest -> $BACKUP/${dest:t}"
  fi

  run mkdir -p "${dest:h}"
  run ln -s "$src" "$dest"
  print "linkado   $dest -> $src"
}

link zsh/zshrc             "$HOME/.zshrc"
link zsh/zprofile          "$HOME/.zprofile"
link zsh/plugin-funcs.sh   "$HOME/.zsh/plugin-funcs.sh"
link starship/starship.toml "$HOME/.config/starship.toml"
link nvim                  "$HOME/.config/nvim"
link wezterm/wezterm.lua   "$HOME/.wezterm.lua"

if [[ ! -e "$HOME/.zshrc-local" ]]; then
  run touch "$HOME/.zshrc-local"
fi
run chmod 600 "$HOME/.zshrc-local"

print "\nPronto. Para instalar as ferramentas: brew bundle --file=$REPO/Brewfile"
if [[ -d "$BACKUP" ]]; then
  print "Confira o que estava em $BACKUP e leve o que for desta máquina para ~/.zshrc-local"
fi
