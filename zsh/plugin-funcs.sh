# Gerenciador mínimo de plugins.
#   plugin dono/repo [dono/repo ...]   clona o que faltar e carrega, na ordem dada
#   plugins list | update | remove <nome>

ZSH_PLUGIN_DIR=$HOME/.zsh/plugins

plugin() {
  local repo name dir
  local -a init
  for repo in "$@"; do
    name=${repo:t}
    dir=$ZSH_PLUGIN_DIR/$name
    if [[ ! -d $dir ]]; then
      print -P "%F{cyan}[plugins]%f instalando %F{yellow}$repo%f"
      GIT_TERMINAL_PROMPT=0 command git clone --quiet --depth 1 "https://github.com/$repo.git" "$dir" 2>/dev/null || {
        print -P "%F{red}[plugins]%f falhou: $repo"
        continue
      }
    fi
    init=($dir/$name.plugin.zsh(N) $dir/*.plugin.zsh(N) $dir/$name.zsh(N) $dir/*.zsh(N))
    if (( $#init )); then
      source $init[1]
    else
      print -P "%F{red}[plugins]%f sem arquivo de carga: $repo"
    fi
  done
}

plugins() {
  local dir
  case $1 in
    list)
      for dir in $ZSH_PLUGIN_DIR/*(N/); do
        print -- "${dir:t}  $(command git -C $dir log -1 --format=%cs)"
      done
      ;;
    update)
      for dir in $ZSH_PLUGIN_DIR/*(N/); do
        ( command git -C $dir pull --ff-only --quiet && print "ok    ${dir:t}" || print "ERRO  ${dir:t}" ) &
      done
      wait
      ;;
    remove)
      if [[ -n $2 && -d $ZSH_PLUGIN_DIR/${2:t} ]]; then
        rm -rf -- "$ZSH_PLUGIN_DIR/${2:t}"
      else
        print "plugin não encontrado: $2"
        return 1
      fi
      ;;
    *)
      print "uso: plugins {list|update|remove <nome>}"
      return 1
      ;;
  esac
}
