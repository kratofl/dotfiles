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

### AI coding

The repository keeps shared AI coding configuration in `ai/`:

- `ai/instructions.md` contains global instructions for both Codex and Claude Code.
- `ai/skills/<skill-name>/SKILL.md` contains portable Agent Skills.

The installation script links the global instructions to `~/.codex/AGENTS.md` and `~/.claude/CLAUDE.md`. Each skill is linked into both `~/.agents/skills/` for Codex and `~/.claude/skills/` for Claude Code. Existing non-empty files or directories are left untouched.

After adding a skill, run the focused AI installer again to create its links:

```bash
$HOME/.dotfiles/scripts/install-ai.sh
```

### Git
Update your email and name in the git config. `$HOME/.config/git/config`
```config
[user]
    email = jdoe@example.com
    name = John Doe
```
