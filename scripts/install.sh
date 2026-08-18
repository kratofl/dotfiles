#!/bin/bash

DOTFILES="$HOME/.dotfiles"
CONFIGS="$HOME/.config"

# create symlinks
SYMLINKS=()
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

printf 'Linked: %s\n' "${SYMLINKS[*]}"

"$DOTFILES/scripts/install-ai.sh"

printf 'installing with homebrew ...\n'
cd homebrew
brew bundle
cd $DOTFILES
printf '... done\n'

printf 'installing oh-my-zsh ...\n'
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# installing plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
printf '... done\n'

# setting zsh as default
chsh -s $(which zsh)
