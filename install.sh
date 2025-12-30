#!/bin/bash
# Grumpyvim Installation Script
# Installs dependencies and sets up the Neovim configuration

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

print_status() {
    echo -e "${GREEN}[+]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

print_error() {
    echo -e "${RED}[x]${NC} $1"
}

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠒⠢⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡞⠀⠀⠀⠈⠳⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⡀⠀⠀"
echo " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠁⢀⣤⠀⠀⠀⠘⢷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠞⠁⠀⠀⡇⠀⠀"
echo " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⢸⣿⡇⠀⠀⠀⠀⠉⠳⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠊⠀⠀⠀⠀⢀⡇⠀⠀"
echo " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡆⠘⠻⣷⠀⠀⠀⠀⠀⠀⠈⠛⢦⣄⠀⠀⣀⣤⣶⣶⣶⣤⣤⣤⣤⣄⣀⣀⣀⡠⠔⠊⠀⠀⠀⠀⠀⠀⣼⠀⠀⠀"
echo " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢣⠀⠀⢿⡇⠀⠀⠀⠀⠀⠀⠀⣀⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣤⣀⣀⠀⠀⠀⠀⠀⢠⠇⠀⠀⠀"
echo " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡄⠀⠀⠀⠀⠀⠀⠀⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠛⢿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⡞⠀⠀⠀⠀"
echo " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢧⠀⠀⠀⠀⠀⣠⣶⣿⣿⣿⣿⣿⣿⣿⡿⠛⠛⠋⠈⠉⠁⠘⡟⠀⠈⠉⠁⠈⠿⣿⣿⣆⠀⠀⢸⠇⠀⠀⠀⠀"
echo " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡄⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀⣷⣄⡄⠀⠀⠀⠀⠀⠉⠉⠀⠀⣾⠀⠀⠀⠀⠀"
echo " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡇⠀⠀⠀⢸⣿⣿⣿⣿⠏⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡀⠀⠀⠀⠀"
echo " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⢀⣶⣿⣿⡿⠋⠁⠀⠀⠀⢰⣿⣷⠀⢠⡀⠀⠀⠀⠀⣿⣿⣷⣄⠀⠀⣀⣀⢀⣶⠀⠀⠈⡇⠀⠀⠀⠀"
echo " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣧⣴⣿⣿⣿⣿⣷⡆⠀⠀⠀⠀⠈⠻⣿⣿⠟⠁⠀⠀⠀⢀⣿⣿⣿⣿⣷⡀⠙⠻⠛⠋⠀⠀⠀⡿⠀⠀⠀⠀"
echo " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣷⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⠻⣿⣿⠿⢷⣄⠀⠀⠀⠀⠀⠠⡇⠀⠀⠀⠀"
echo " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⣀⣴⣿⣿⣿⣷⣮⠀⣴⣿⣿⣦⣄⠀⠀⠀⢠⡇⠀⠀⠀⠀"
echo " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⣀⣤⣶⣿⣿⣿⣿⣿⠟⢉⣤⣤⣬⡙⢿⣿⣿⣆⠀⣠⣿⣇⠀⠀⠀⠀"
echo " ⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⠻⢿⣷⣶⣿⣿⣿⣿⣿⣿⣿⠟⣡⣾⣿⣿⣿⣿⣿⣆⣿⣿⢿⣿⣿⣿⣿⠀⠀⠀⠀"
echo " ⠀⠀⠀⠀⠀⠀ ⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣄⣀⣽⠿⠿⠟⢻⣿⣿⣿⣯⣾⣿⣿⣿⣿⣿⣿⣿⣿⡿⢯⢲⠈⢻⣿⡟⠀⠀⠀⠀"
echo " ⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣦⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣀⣠⣴⣾⣿⠃⠀⠀⠀⠀"
echo " ⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀"
echo " ⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀"
echo "   █▀▀⣿█▀▄⣿█⣿█⣿█▄█⣿█▀█⣿█⣿█⣿⣿██╗⣿⣿⣿██╗██╗███╗⣿⣿⣿███╗  "
echo "   █⢠█⣿█▀▄⣿█⣿█⣿█⣿█⣿█▀▀⣿⣿█⣿⣿⣿██║⣿⣿⣿██║██║████╗⣿████║  "
echo "   ▀▀▀⣿▀⣿▀⣿▀▀▀⣿▀⣿▀⣿▀⣿⣿⣿⣿▀⣿⣿⣿██║⣿⣿⣿██║██║██╔████╔██║  "
echo "   ⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿╚██╗⣿██╔╝██║██║╚██╔╝██║  "
echo "  ⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿╚████╔╝ ██║██║⣿╚═╝⣿██║  "
echo " ⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿╚═══╝  ╚═╝╚═╝⣿⣿⣿⣿⣿╚═╝  "
echo "⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀  "
echo ""
echo "       LazyVim Edition - Installation Script"
echo ""

# Check for Homebrew
if ! command -v brew &> /dev/null; then
    print_warning "Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    print_status "Homebrew found"
fi

# Install dependencies from Brewfile
print_status "Installing dependencies from Brewfile..."
cd "$SCRIPT_DIR"
brew bundle --file=Brewfile

# Backup existing Neovim config if it exists
NVIM_CONFIG="$HOME/.config/nvim"
if [ -d "$NVIM_CONFIG" ] && [ ! -L "$NVIM_CONFIG" ]; then
    BACKUP_DIR="$HOME/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)"
    print_warning "Existing Neovim config found. Backing up to $BACKUP_DIR"
    mv "$NVIM_CONFIG" "$BACKUP_DIR"
fi

# Create symlink to grumpyvim
print_status "Setting up Neovim configuration..."

# Remove existing symlink if present
if [ -L "$NVIM_CONFIG" ]; then
    rm "$NVIM_CONFIG"
fi

# Create symlink
ln -s "$SCRIPT_DIR" "$NVIM_CONFIG"
print_status "Created symlink: $NVIM_CONFIG -> $SCRIPT_DIR"

# Clear Neovim cache and state (optional but recommended for clean install)
print_status "Clearing Neovim cache for fresh start..."
rm -rf "$HOME/.local/share/nvim"
rm -rf "$HOME/.local/state/nvim"
rm -rf "$HOME/.cache/nvim"

print_status "Installation complete!"
echo ""
echo "Next steps:"
echo "  1. Run 'nvim' to start Neovim"
echo "  2. Wait for lazy.nvim to install plugins (automatic)"
echo "  3. Run ':Mason' to verify LSP servers are installed"
echo ""
print_warning "First launch may take a minute while plugins install."
echo ""
