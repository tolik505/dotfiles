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
    node
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
    broot
    gnu-sed
)

# Install each package using Homebrew
for package in "${packages[@]}"; do
    echo "Installing $package..."
    brew install $package
done

echo "Insalling Fisher"
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# Read each line from the file and run fisher install for each plugin
while IFS= read -r plugin; do
  echo "Installing $plugin..."
  fish -c "fisher install $plugin"
done < "fish/fish_plugins"

echo "Insalling JetBrains Nerd Font"

brew tap homebrew/cask-fonts && brew install --cask font-jetbrains-mono-nerd-font

echo "Installation complete."

echo "Creating simlinks ..."

stow --target ~/.config .

echo "Done 🎉"
