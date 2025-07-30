export GOPATH="$HOME/go"
export PATH="$HOME/.local/bin:$HOME/.npm-global/bin:$GOPATH/bin:$PATH"

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=kphoen
plugins=(git zsh-autosuggestions zsh-syntax-highlighting fzf)

source $ZSH/oh-my-zsh.sh

export EDITOR=/opt/homebrew/bin/nvim

# loading modules
for FILE in ~/.config/zsh/*.sh; do
    source $FILE
done

eval "$(zoxide init zsh)"
