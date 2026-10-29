# dms-niri

Dotfiles do meu desktop Arch Linux com o compositor Wayland [niri](https://github.com/YaLTeR/niri) e o [DankMaterialShell (DMS)](https://github.com/AvengeMedia/DankMaterialShell) como barra, launcher, notificações e central de controle.

Cada pasta da raiz é um pacote do [GNU Stow](https://www.gnu.org/software/stow/): o conteúdo dela espelha a `$HOME`. Por exemplo, `niri/.config/niri/config.kdl` vira `~/.config/niri/config.kdl`.

## Conteúdo

| Pacote | Destino | O que é |
|---|---|---|
| `niri` | `~/.config/niri` | Configuração do niri (atalhos, regras de janela, animações) |
| `dms` | `~/.config/dms` | Configurações e temas do DankMaterialShell (Catppuccin, Tokyo Night) |
| `zsh` | `~/.zshenv`, `~/.config/zsh` | Zsh com plugins, prompt Starship, aliases, integração com fzf |
| `nvim` | `~/.config/nvim` | Neovim com `vim.pack` nativo, Telescope, Lualine, LSP (lua_ls, pyright) |
| `vim` | `~/.config/vim` | Configuração mínima do Vim |
| `alacritty` | `~/.config/alacritty` | Terminal, com tema gerado pelo DMS |
| `rofi` | `~/.config/rofi`, `~/.local/share/rofi` | Rofi com tema Tokyo Night (usado pelos scripts) |
| `scripts` | `~/.local/bin` | Scripts utilitários (ver abaixo) |
| `bookmarks` | `~/.local/share/bookmarks` | Lista de favoritos usada pelo `bookmarks.sh` |
| `backgrounds` | `~/.config/backgrounds` | Papéis de parede |
| `mpv` | `~/.config/mpv` | Player de vídeo |
| `git` | `~/.gitconfig` | Usuário, aliases (`st`, `lg`, …), `pull.rebase = true` |
| `chromium` | `~/.config/chromium-flags.conf` | Flags Wayland e de aceleração de vídeo |
| `fontconfig` | `~/.config/fontconfig` | Fontes padrão |
| `gamemode` | `~/.config/gamemode.ini` | Feral GameMode |
| `boot` | `/boot/loader/entries` | Entrada do systemd-boot para o Windows 11 (instalar com `-t /`) |
| `nixos-flake` | — | Flake NixOS separado (`nixos-btw`); **não** é um pacote do Stow |

## Instalação

### 1. Pré-requisitos

Arch Linux (ou derivado) com `sudo`, e os seguintes itens instalados:

- `niri`
- DankMaterialShell (siga a documentação oficial do projeto)
- `stow`, `git`, `zsh`, `neovim` (0.12 ou mais recente, por causa do `vim.pack`), `alacritty`, `rofi`, `starship`

### 2. Clonar o repositório

Clone na `$HOME`. Os links criados pelo Stow são relativos e apontam para `~/dms-niri`.

```sh
git clone git@github.com:gaugusto/dms-niri.git ~/dms-niri
cd ~/dms-niri
```

### 3. Scripts de bootstrap

Rode na ordem:

```sh
./01_install_yay.sh               # compila e instala o yay (AUR helper)
./02_install_packages.sh          # instala os pacotes listados no array PACKAGES
./03_ssh_github.sh seu@email.com  # gera chave SSH ed25519 e mostra a pública para colar no GitHub
```

Para adicionar ou remover pacotes do bootstrap, edite o array `PACKAGES` em `02_install_packages.sh`.

### 4. Criar os links com o Stow

```sh
cd ~/dms-niri
stow niri dms zsh nvim alacritty rofi scripts bookmarks backgrounds mpv git chromium fontconfig gamemode
```

Se já existirem arquivos no destino, o Stow vai abortar. Faça backup e remova os arquivos antes, ou use `stow --adopt <pacote>` (isso move os arquivos existentes para dentro do repositório; confira com `git diff` depois).

Entrada de boot do Windows (opcional, precisa de root):

```sh
sudo stow -t / boot
```

Para desfazer um pacote: `stow -D <pacote>`.

### 5. Shell padrão

```sh
chsh -s /usr/bin/zsh
```

O `~/.zshenv` define `ZDOTDIR=~/.config/zsh`. Na primeira execução, os plugins do zsh (autosuggestions, history-substring-search, zsh-vi-mode, fast-syntax-highlighting) são clonados automaticamente em `~/.config/zsh/plugins/`. Para atualizá-los depois, rode `zplugin-update`.

### 6. Neovim

Abra o `nvim` uma vez. O `vim.pack` baixa os plugins sozinho.

## Configuração

### niri e DMS

- **Edite só o `niri/.config/niri/config.kdl`.** No final dele há `include`s que carregam os arquivos de `niri/.config/niri/dms/`.
- Os arquivos em `niri/.config/niri/dms/*.kdl` são **gerados pelo DMS**: as alterações feitas pela interface do DMS (atalhos, monitores, cores, cursor, layout) são gravadas ali e qualquer edição manual será sobrescrita.
- `dms/.config/dms/settings.json` também é escrito pelo próprio DMS, então é normal aparecerem diffs depois de mexer nas configurações pela interface.
- O niri recarrega a configuração automaticamente ao salvar. Para validar antes: `niri validate`.
- O DMS pode ser controlado via linha de comando, por exemplo `dms ipc call bar toggle index 0`.

Como os links do Stow apontam para o repositório, qualquer alteração em `~/.config/...` já altera os arquivos versionados. Basta fazer commit.

### Atalhos personalizados (em `config.kdl`)

| Atalho | Ação |
|---|---|
| `Mod+B` | Menu de favoritos (`bookmarks.sh`) |
| `Mod+E` | Nautilus |
| `Mod+Shift+C` | Claude Code no Alacritty |
| `Mod+Alt+H` | Mostrar/ocultar barra do DMS |
| `Mod+Alt+O` | Overview do DMS (calendário) |
| `Mod+Alt+D` | Menu com todos os scripts `.sh` (`dmenus`) |
| `Mod+Alt+P` | Senhas do `pass` (`pass.sh`) |
| `Mod+Alt+C` | Limpar histórico da área de transferência |
| `Mod+Ctrl+Shift+C` | Central de controle do DMS |
| `Mod+Ctrl+P` | Seletor de cores |
| `Alt+Tab` / `Alt+Shift+Tab` | Alternar janelas recentes |

Os demais atalhos (workspaces, foco, colunas etc.) ficam em `niri/.config/niri/dms/binds.kdl` e são gerenciados pelo DMS. `Mod+Shift+/` mostra todos.

Atalhos com dados sensíveis (senhas, IPs internos) ficam em `niri/.config/niri/binds-private.kdl`, que é incluído pelo `config.kdl` mas está no `.gitignore`. Crie esse arquivo manualmente em cada máquina com um bloco `binds { ... }`. Ele é opcional: se não existir, o niri ignora.

Alguns atalhos apontam para programas locais fora deste repositório (`the-music-app`, `my_clipboard_playlist`). Ajuste ou remova conforme a sua máquina.

### Scripts (`~/.local/bin`, já no `PATH`)

| Script | Função |
|---|---|
| `bookmarks.sh` | Escolhe um favorito no rofi e abre no navegador (`brave-origin`) |
| `pass.sh` | Escolhe uma senha do `pass` no `walker` e copia para a área de transferência (`pass -c`) |
| `configs.sh` | Escolhe uma pasta de configuração no rofi e abre no nvim |
| `pacman.sh` | Menu rofi com tarefas do pacman/yay (atualizar, limpar cache, órfãos) |
| `watch.sh` | Abre no mpv links de YouTube/Twitch/Kick do histórico da área de transferência |
| `dmenus` | Lista todos os `*.sh` de `~/.local/bin` no rofi e executa o escolhido |
| `pdf-unite.sh` | Junta PDFs do diretório atual escolhidos via fzf |
| `virtio-venus.sh <vm>` | Inicia uma VM QEMU/KVM com virtio |
| `nitch` | Fetch de informações do sistema (binário) |

### Favoritos

O arquivo `bookmarks/.local/share/bookmarks` tem um favorito por linha: o **primeiro campo** é o nome exibido no rofi e o **último campo** é a URL.

### Aliases úteis do zsh

Definidos em `zsh/.config/zsh/aliases.zsh`, por exemplo `pacinstall`, `yayinstall`, `pacuninstall` e `pacinfo` (busca interativa de pacotes com fzf), `ls`/`ll`/`la`/`tree` com `eza`, `cat` com `bat`, `grep` com `rg` e `gadog` (log gráfico do git).

## NixOS (opcional)

`nixos-flake/` contém uma configuração NixOS independente que usa o `dank-greeter`:

```sh
sudo nixos-rebuild switch --flake ./nixos-flake#nixos-btw
```

## Ignorados pelo git

Lockfiles do Neovim, plugins do zsh e `scripts/.local/share` (ver `.gitignore`).
