#!/usr/bin/env bash
set -e

NVIM_CONFIG="$HOME/.config/nvim"
NVIM_DATA="$HOME/.local/share/nvim"
NVIM_STATE="$HOME/.local/state/nvim"
NVIM_CACHE="$HOME/.cache/nvim"

echo "Uninstalling Grumpyvim..."
echo ""

# Find existing backups
backups=$(find "$HOME/.config" -maxdepth 1 -name "nvim.bak.*" 2>/dev/null | sort -r)

# Remove nvim config
if [ -d "$NVIM_CONFIG" ]; then
  echo "Removing $NVIM_CONFIG"
  rm -rf "$NVIM_CONFIG"
else
  echo "Config directory not found: $NVIM_CONFIG"
fi

# Remove nvim data directories
for dir in "$NVIM_DATA" "$NVIM_STATE" "$NVIM_CACHE"; do
  if [ -d "$dir" ]; then
    echo "Removing $dir"
    rm -rf "$dir"
  fi
done

echo ""

# Offer to restore backup
if [ -n "$backups" ]; then
  echo "Found backup(s):"
  echo "$backups" | head -5
  echo ""
  read -p "Restore most recent backup? [y/N] " -n 1 -r
  echo ""
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    latest=$(echo "$backups" | head -1)
    echo "Restoring $latest to $NVIM_CONFIG"
    mv "$latest" "$NVIM_CONFIG"
  fi
fi

echo ""
echo "Grumpyvim uninstalled."
echo ""
echo "Note: Dependencies (neovim, ripgrep, fd, lazygit) were not removed."
echo "To remove them manually:"
if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "  brew uninstall neovim ripgrep fd lazygit"
elif [[ -f /etc/arch-release ]]; then
  echo "  sudo pacman -Rs neovim ripgrep fd lazygit"
elif [[ -f /etc/debian_version ]]; then
  echo "  sudo apt remove neovim ripgrep fd-find"
fi
