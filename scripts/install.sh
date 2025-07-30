#!/bin/bash

DOTFILES="$HOME/.dotfiles"
CONFIGS="$HOME/.config"

# create symlinks
SYMLINKs=()
# shell
ln -sf "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
SYMLINKS+=(".zshrc")
ln -sf "$DOTFILES/zsh" "$CONFIGS/zsh"
SYMLINKS+=("zsh")
ln -sf "$DOTFILES/nvim" "$CONFIGS/nvim"
SYMLINKS+=("nvim")
ln -sf "$DOTFILES/fastfetch" "$CONFIGS/fastfetch"
SYMLINKS+=("fastfetch")
ln -sf "$DOTFILES/ghostty" "$CONFIGS/ghostty"
SYMLINKS+=("ghostty")

# window management
ln -sf "$DOTFILES/aerospace" "$CONFIGS/aerospace"
SYMLINKS+=("aerospace")
ln -sf "$DOTFILES/sketchybar" "$CONFIGS/sketchybar"
SYMLINKS+=("sketchybar")

print ${SYMLINKS[@]}

print "installing with homebrew ..."
cd homebrew
brew bundle
cd $DOTFILES
print "... done"

print "installing oh-my-zsh ..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# installing plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
print "... done"

# setting zsh as default
chsh -s $(which zsh)