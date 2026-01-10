# Grumpyvim

A LazyVim-based Neovim configuration with opinionated keybindings and sensible defaults for full-stack development.

```
       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠒⠢⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡞⠀⠀⠀⠈⠳⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⡀⠀⠀
       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠁⢀⣤⠀⠀⠀⠘⢷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠞⠁⠀⠀⡇⠀⠀
       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⢸⣿⡇⠀⠀⠀⠀⠉⠳⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠊⠀⠀⠀⠀⢀⡇⠀⠀
       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡆⠘⠻⣷⠀⠀⠀⠀⠀⠀⠈⠛⢦⣄⠀⠀⣀⣤⣶⣶⣶⣤⣤⣤⣤⣄⣀⣀⣀⡠⠔⠊⠀⠀⠀⠀⠀⠀⣼⠀⠀⠀
       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢣⠀⠀⢿⡇⠀⠀⠀⠀⠀⠀⠀⣀⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣤⣀⣀⠀⠀⠀⠀⠀⢠⠇⠀⠀⠀
       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡄⠀⠀⠀⠀⠀⠀⠀⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠛⢿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⡞⠀⠀⠀⠀
       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢧⠀⠀⠀⠀⠀⣠⣶⣿⣿⣿⣿⣿⣿⣿⡿⠛⠛⠋⠈⠉⠁⠘⡟⠀⠈⠉⠁⠈⠿⣿⣿⣆⠀⠀⢸⠇⠀⠀⠀⠀
       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡄⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀⣷⣄⡄⠀⠀⠀⠀⠀⠉⠉⠀⠀⣾⠀⠀⠀⠀⠀
       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡇⠀⠀⠀⢸⣿⣿⣿⣿⠏⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡀⠀⠀⠀⠀
       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⢀⣶⣿⣿⡿⠋⠁⠀⠀⠀⢰⣿⣷⠀⢠⡀⠀⠀⠀⠀⣿⣿⣷⣄⠀⠀⣀⣀⢀⣶⠀⠀⠈⡇⠀⠀⠀⠀
       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣧⣴⣿⣿⣿⣿⣷⡆⠀⠀⠀⠀⠈⠻⣿⣿⠟⠁⠀⠀⠀⢀⣿⣿⣿⣿⣷⡀⠙⠻⠛⠋⠀⠀⠀⡿⠀⠀⠀⠀
       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣷⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⠻⣿⣿⠿⢷⣄⠀⠀⠀⠀⠀⠠⡇⠀⠀⠀⠀
       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⣀⣴⣿⣿⣿⣷⣮⠀⣴⣿⣿⣦⣄⠀⠀⠀⢠⡇⠀⠀⠀⠀
       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⣀⣤⣶⣿⣿⣿⣿⣿⠟⢉⣤⣤⣬⡙⢿⣿⣿⣆⠀⣠⣿⣇⠀⠀⠀⠀
       ⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⠻⢿⣷⣶⣿⣿⣿⣿⣿⣿⣿⠟⣡⣾⣿⣿⣿⣿⣿⣆⣿⣿⢿⣿⣿⣿⣿⠀⠀⠀⠀
       ⠀⠀⠀⠀⠀⠀ ⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣄⣀⣽⠿⠿⠟⢻⣿⣿⣿⣯⣾⣿⣿⣿⣿⣿⣿⣿⣿⡿⢯⢲⠈⢻⣿⡟⠀⠀⠀⠀
       ⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣦⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣀⣠⣴⣾⣿⠃⠀⠀⠀⠀
       ⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀
       ⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀
         █▀▀⣿█▀▄⣿█⣿█⣿█▄█⣿█▀█⣿█⣿█⣿⣿██╗⣿⣿⣿██╗██╗███╗⣿⣿⣿███╗
         █⢠█⣿█▀▄⣿█⣿█⣿█⣿█⣿█▀▀⣿⣿█⣿⣿⣿██║⣿⣿⣿██║██║████╗⣿████║
         ▀▀▀⣿▀⣿▀⣿▀▀▀⣿▀⣿▀⣿▀⣿⣿⣿⣿▀⣿⣿⣿██║⣿⣿⣿██║██║██╔████╔██║
         ⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿╚██╗⣿██╔╝██║██║╚██╔╝██║
        ⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿╚████╔╝ ██║██║⣿╚═╝⣿██║
       ⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿╚═══╝  ╚═╝╚═╝⣿⣿⣿⣿⣿╚═╝
      ⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀
                                        LazyVim Edition
```

## Features

- **LazyVim base** - Upgrade-safe customizations using `opts` tables
- **Claude Code integration** - AI pair programming with full editor awareness via MCP
- **Gruvbox dark theme** - Easy on the eyes
- **Kitty terminal integration** - Seamless `<C-hjkl>` navigation between Neovim and Kitty panes
- **Harpoon** - Quick file marks for fast navigation
- **Project switching** - `<leader>pp` to switch projects, `<leader>pf` to find files
- **Format on save** - Prettier, stylua, shfmt, gofumpt
- **Language support** - TypeScript, Python, Go, Svelte, Tailwind CSS

## Requirements

- Git
- [Nerd Font](https://www.nerdfonts.com/) (for icons)
- [Kitty terminal](https://sw.kovidgoyal.net/kitty/) (optional, for pane navigation)
- [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code) (optional, for AI integration)

The installer handles dependencies automatically on:
- **macOS** - via Homebrew
- **Arch Linux** - via pacman
- **Ubuntu/Debian** - via apt

## Installation

### One-liner (recommended)

Installs dependencies (neovim, ripgrep, fd, lazygit) and clones the config:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/edylim/grumpyvim/main/install.sh)
```

After cloning, you'll be prompted to set the git origin. Press Enter to use the default SSH URL, or enter your own fork's URL.

### Manual

```bash
# Install dependencies
# macOS:    brew install neovim ripgrep fd lazygit
# Arch:     sudo pacman -S neovim ripgrep fd lazygit
# Ubuntu:   sudo apt install neovim ripgrep fd-find

# Backup existing config
mv ~/.config/nvim ~/.config/nvim.bak

# Clone grumpyvim
git clone https://github.com/edylim/grumpyvim.git ~/.config/nvim

# Start Neovim (plugins will auto-install)
nvim
```

## Uninstall

```bash
~/.config/nvim/uninstall.sh
```

This removes the config and all Neovim data directories. If a backup exists from installation, you'll be prompted to restore it. Dependencies (neovim, ripgrep, fd, lazygit) are not removed automatically.

## Keybindings

Leader key: `Space`

### Quick Reference

| Key | Action |
|-----|--------|
| `jj` | Exit insert mode |
| `<leader><tab>` | Toggle previous file |
| `<leader>?` | Show all keymaps |

### Project (`<leader>p`)

| Key | Action |
|-----|--------|
| `<leader>pp` | Switch project |
| `<leader>pf` | Find file (any project) |
| `<leader>pt` | Toggle file tree |
| `<leader>/` | Grep project |
| `<leader>pw` | Grep word under cursor |
| `<leader>pb` | Buffers |

### Windows (`<leader>w`)

| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Navigate (works with Kitty) |
| `<leader>w\|` | Split right |
| `<leader>w-` | Split below |
| `<leader>we` | Equalize |
| `<leader>ws` | Save session |
| `<leader>wr` | Restore session |

### Tabs (`<leader>t`)

| Key | Action |
|-----|--------|
| `<leader>t` | List tabs |
| `<leader>tn` | New tab |
| `<leader>td` | Close tab |
| `<leader>tl/th` | Next/prev tab |

### Harpoon (`<leader>h`)

| Key | Action |
|-----|--------|
| `<leader>ha` | Add file |
| `<leader>hs` | Show menu |
| `<leader>hh/hl` | Prev/next |
| `<leader>h1-4` | Jump to mark |

### LSP (`<leader>l`)

| Key | Action |
|-----|--------|
| `<leader>ld` | Go to definition |
| `<leader>lr` | References |
| `<leader>li` | Implementations |
| `<leader>la` | Code actions |
| `<leader>lR` | Rename |
| `<leader>le` | Diagnostics |
| `<leader>lD` | Hover docs |

### Git (`<leader>g`)

| Key | Action |
|-----|--------|
| `<leader>gg` | LazyGit |
| `<leader>gG` | Fugitive status |
| `<leader>gV` | Diff split |
| `<leader>gs` | Git status picker |
| `<leader>gb` | Blame line |

### AI/Claude (`<leader>a`)

| Key | Action |
|-----|--------|
| `<leader>ac` | Toggle Claude terminal |
| `<leader>af` | Focus Claude |
| `<leader>ab` | Add current buffer |
| `<leader>as` | Send selection (visual) |
| `<leader>ar` | Resume session |
| `<leader>aC` | Continue session |
| `<leader>aa` | Accept diff |
| `<leader>ad` | Reject diff |

### Other

| Key | Action |
|-----|--------|
| `<leader>L` | Lazy plugin manager |
| `<leader>mp` | Format file |
| `<leader>uh` | Clear highlights |
| `<leader>uL` | Restart LSP |

## Customization

This config is designed to be upgrade-safe. All customizations use `opts` tables rather than overriding `config` functions.

- **Options**: `lua/config/options.lua`
- **Keymaps**: `lua/config/keymaps.lua`
- **Plugins**: `lua/plugins/*.lua`

### Adding a plugin

Create a new file in `lua/plugins/` or add to an existing one:

```lua
return {
  {
    "author/plugin-name",
    opts = {
      -- your options here
    },
  },
}
```

### Changing colorscheme

Edit `lua/plugins/colorscheme.lua`:

```lua
return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight", -- or any installed theme
    },
  },
}
```

## Based On

- [LazyVim](https://www.lazyvim.org/) - Neovim distribution
- [lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager

## License

MIT
