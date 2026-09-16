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

# T3 Code reads published themes from ~/.t3/userdata/themes/<id>.json with
# O_NOFOLLOW, so individual theme files cannot be symlinks. Link the whole
# directory instead. The app creates an empty themes dir on first launch; an
# empty directory is replaced, a non-empty one is left alone.
T3_THEMES="$HOME/.t3/userdata/themes"
if [ -L "$T3_THEMES" ]; then
  ln -sfn "$DOTFILES/t3code/themes" "$T3_THEMES"
  SYMLINKS+=("t3code/themes")
elif [ -d "$T3_THEMES" ] && [ -z "$(ls -A "$T3_THEMES")" ]; then
  rmdir "$T3_THEMES"
  ln -s "$DOTFILES/t3code/themes" "$T3_THEMES"
  SYMLINKS+=("t3code/themes")
elif [ -e "$T3_THEMES" ]; then
  printf 'Skipping %s: directory is not empty and not a symlink.\n' "$T3_THEMES"
else
  mkdir -p "$(dirname "$T3_THEMES")"
  ln -s "$DOTFILES/t3code/themes" "$T3_THEMES"
  SYMLINKS+=("t3code/themes")
fi

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
