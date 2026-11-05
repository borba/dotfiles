# dotfiles

Configuração compartilhada entre as minhas máquinas (macOS, Apple Silicon).

## Instalar em uma máquina nova

1. Instale o [Homebrew](https://brew.sh), que também traz o git:

   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   eval "$(/opt/homebrew/bin/brew shellenv)"
   ```

2. Clone o repositório. Por HTTPS não precisa de chave SSH, mas para dar push nessa máquina troque depois o remote:

   ```bash
   git clone https://github.com/borba/dotfiles.git ~/mine/dotfiles
   cd ~/mine/dotfiles
   ```

3. Se a máquina precisar de pacotes próprios, como um JDK, crie o `~/.Brewfile.local`. Depois instale as ferramentas:

   ```bash
   brew bundle --file=Brewfile
   ```

4. Confira o que vai mudar e crie os symlinks. O que já existir vai para `~/.dotfiles-backup/<data>`:

   ```bash
   ./install.sh --dry-run
   ./install.sh
   ```

5. Leve do backup para o `~/.zshrc-local` o que for desta máquina, e coloque ali os segredos dela.

6. Defina nome e e-mail do git para esta máquina:

   ```bash
   git config --file ~/.gitconfig-local user.name "Seu Nome"
   git config --file ~/.gitconfig-local user.email "voce@exemplo.com"
   ```

7. Abra o WezTerm e rode `nvim` uma vez. Os plugins do zsh e do Neovim se instalam sozinhos.

## Atualizar uma máquina

```bash
git pull
./install.sh
brew bundle --file=Brewfile
```

## O que fica fora do git

- `~/.zshrc-local`: segredos e tudo o que for de uma máquina só.
- `~/.Brewfile.local`: pacotes de uma máquina só.
- `~/.gitconfig-local`: nome, e-mail e outros ajustes do git de uma máquina só.

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
