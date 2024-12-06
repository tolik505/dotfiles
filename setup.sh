#!/bin/zsh

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Please install Homebrew first."
    exit 1
fi

# List of packages to install
packages=(
    wezterm
    starship
    nu
    carapace
    tmux
    nvim
    node
    zellij
    zoxide
    stow
    fzf
    ripgrep
    bat
    fd
    bottom
    lsd
    lazydocker
    broot
    gnu-sed
)

# Install each package using Homebrew
for package in "${packages[@]}"; do
    echo "Installing $package..."
    brew install $package
done

echo "Insalling JetBrains Nerd Font"

brew install --cask font-jetbrains-mono-nerd-font

echo "Installation complete."

echo "Creating simlinks ..."

stow --target ~/.config .

echo "Done 🎉"
