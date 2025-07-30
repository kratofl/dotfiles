# dotfiles

## Installation
### Homebrew and git
You need first to install `homebrew` and `git`.

`homebrew`
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

`git`
```bash
brew install git
```

### Cloning
After `homebrew` and `git` are successfully installed you can now clone the repository and run the installation script.
The default location is `$HOME/.dotfiles`.
```bash
git clone https://github.com/kratofl/dotfiles.git "$HOME/.dotfiles"
$HOME/.dotfiles/scripts/install.sh
```

## Configuration
### Git
Update your email and name in the git config. `$HOME/.config/git/config`
```config
[user]
    email = jdoe@example.com
    name = John Doe
```