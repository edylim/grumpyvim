#!/usr/bin/env bash
set -e

REPO="https://github.com/edylim/grumpyvim.git"
NVIM_CONFIG="$HOME/.config/nvim"

echo "Installing Grumpyvim..."

# Install dependencies
install_deps() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    if command -v brew &> /dev/null; then
      echo "Installing dependencies via Homebrew..."
      brew install neovim ripgrep fd lazygit
    else
      echo "Warning: Homebrew not found. Please install dependencies manually:"
      echo "  brew install neovim ripgrep fd lazygit"
    fi
  elif [[ -f /etc/arch-release ]]; then
    echo "Installing dependencies via pacman..."
    sudo pacman -S --needed neovim ripgrep fd lazygit
  elif [[ -f /etc/debian_version ]]; then
    echo "Installing dependencies via apt..."
    sudo apt update
    sudo apt install -y neovim ripgrep fd-find
    # lazygit not in default repos, install from GitHub
    if ! command -v lazygit &> /dev/null; then
      echo "Installing lazygit..."
      LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
      curl -Lo /tmp/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
      tar xf /tmp/lazygit.tar.gz -C /tmp lazygit
      sudo install /tmp/lazygit /usr/local/bin
      rm /tmp/lazygit.tar.gz /tmp/lazygit
    fi
  else
    echo "Warning: Unsupported OS. Please install dependencies manually:"
    echo "  neovim, ripgrep, fd, lazygit"
  fi
}

install_deps

# Backup existing config
if [ -d "$NVIM_CONFIG" ]; then
  BACKUP="$NVIM_CONFIG.bak.$(date +%Y%m%d%H%M%S)"
  echo "Backing up existing config to $BACKUP"
  mv "$NVIM_CONFIG" "$BACKUP"
fi

# Clone grumpyvim
echo "Cloning grumpyvim..."
git clone "$REPO" "$NVIM_CONFIG"

echo ""
echo "Grumpyvim installed successfully!"
echo ""
echo "Next steps:"
echo "  1. Run 'nvim' to start Neovim"
echo "  2. Plugins will auto-install on first launch"
echo "  3. Press <leader>? to see all keybindings"
echo ""
