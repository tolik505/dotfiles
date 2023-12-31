# Dotfiles and cool packages to improve development performance

### Installation

1. Clone the repo

```bash
git clone https://github.com/tolik505/dotfiles.git
```

2. Run

```bash
cd dotfiles && ./setup.sh
```

This step will install necessary packages (for MacOS) and create simlinks to configs in your home directory.

3. Switch your default shell to [fish](https://github.com/fish-shell/fish-shell#switching-to-fish) (optional)

4. Open the fish shell and run 
```bash
tide configure
```

5. Add /opt/homebrew/bin to PATH:
```bash
fish_add_path /opt/homebrew/bin
```
