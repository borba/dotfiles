#!/usr/bin/env zsh
set -euo pipefail

REPO="${${(%):-%N}:A:h}"
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
  local src="$1"
  local dest="$2"

  local dest_dir="${dest:h}"
  run mkdir -p "$dest_dir"

  local rel
  rel="$(realpath "$src")"

  print "linkando $dest -> $rel"
  run ln -sfn "$rel" "$dest"
}

# =========================
# Declaração dos links
# =========================

link "$REPO/zshrc"              "$HOME/.zshrc"
link "$REPO/plugin-funcs.sh"    "$HOME/.zsh/plugin-funcs.sh"

print "✔ Concluído"