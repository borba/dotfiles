# dotfiles

Configuração compartilhada entre as minhas máquinas (macOS, Apple Silicon).

## Instalar

```bash
./install.sh --dry-run
./install.sh
brew bundle --file=Brewfile
```

O `install.sh` cria os symlinks e guarda o que já existia em `~/.dotfiles-backup/<data>`.

## O que fica fora do git

- `~/.zshrc-local`: segredos e tudo o que for de uma máquina só.
- `~/.Brewfile.local`: pacotes de uma máquina só.

## Plugins do zsh

São declarados no `zsh/zshrc` com `plugin dono/repo` e clonados sozinhos no próximo shell.

```bash
plugins list
plugins update
plugins remove nome
```

Ao trocar a origem de um plugin de mesmo nome, rode `plugins remove nome` antes.

## Neovim

Editor leve para o terminal: tudo em `nvim/init.lua`, com `tokyonight` e `mini.nvim` via `vim.pack`. Sem LSP.

Com `<Space>` como leader: `f` arquivos, `g` grep, `b` buffers, `e` explorador.

`:lua vim.pack.update()` atualiza os plugins. As versões ficam em `nvim/nvim-pack-lock.json`.

## Java

`jdk` lista as versões instaladas e `jdk 11` troca a versão no shell atual.
