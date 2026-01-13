_plugins_foreach() {
  for key val in "${(@kv)PLUGINS}"; do
    "$1" "$key" "$val" "$ZSH_PLUGIN_DIR/$key"
  done
}

_plugin_show() {
  print -- "$1"
}

_plugin_install_one() {
  local name="$1" url="$2" dir="$3"
  if [[ -d "$dir/.git" ]]; then
    print -P "%F{cyan}[plugins]%f $name%f already installed"
    return 0
  fi
  print -P "%F{cyan}[plugins]%f Installing %F{yellow}$name%f..."
  command git clone --depth 1 --quiet "$url" "$dir" || {
    print -P "%F{red}[plugins]%f $name installation failed"
    return 1
  }
}

_plugin_update_one() {
  local name="$1" url="$2" dir="$3"
  if [[ ! -d "$dir/.git" ]]; then
    print -P "%F{cyan}[plugins]%f %F{yellow}$name%f (missing) -> installing..."
    _plugin_install_one "$@"
    return
  fi
  print -P "%F{cyan}[plugins]%f Updating %F{yellow}$name%f..."
  command git -C "$dir" pull --ff-only --quiet || \
    print -P "%F{red}[plugins]%f $name updating failed"
}

plugins() {
  local cmd="$1"
  case "$cmd" in
    install)
      rm $ZSH_PLUGIN_DIR/INSTALLED
      _plugins_foreach _plugin_install_one
      touch $ZSH_PLUGIN_DIR/INSTALLED
      ;;
    sync)
      rm $ZSH_PLUGIN_DIR/INSTALLED
      _plugins_foreach _plugin_update_one
      touch $ZSH_PLUGIN_DIR/INSTALLED
      _plugins_load
      ;;
    list)
      _plugins_foreach _plugin_show
      ;;
    *)
      print "uso: plugins {install|update|load|sync|list}"
      return 1
      ;;
  esac
}
