#!/bin/zsh

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Please install Homebrew first."
    exit 1
fi

# List of packages to install
packages=(
    wezterm
    fish
    nvim
    zellij
    z
    stow
    fzf
    ripgrep
    bat
    fd
    bottom
    lsd
    lazydocker
)

# Install each package using Homebrew
for package in "${packages[@]}"; do
    echo "Installing $package..."
    brew install $package
done

echo "Installation complete."

echo "Creating simlinks ..."

stow --target ~/.config .

echo "Done 🎉"
