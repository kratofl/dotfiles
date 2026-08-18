#!/usr/bin/env bash

set -u

AI_DOTFILES_ROOT="${AI_DOTFILES_ROOT:-$HOME/.dotfiles}"
AI_LINKS=()

link_ai_file() {
  local source_path="$1"
  local target_path="$2"

  mkdir -p "$(dirname "$target_path")"

  if [ -L "$target_path" ]; then
    ln -sfn "$source_path" "$target_path"
  elif [ -f "$target_path" ] && [ ! -s "$target_path" ]; then
    rm "$target_path"
    ln -s "$source_path" "$target_path"
  elif [ -e "$target_path" ]; then
    printf 'Skipping %s: target already exists and is not a symlink.\n' "$target_path"
    return
  else
    ln -s "$source_path" "$target_path"
  fi

  AI_LINKS+=("${target_path#$HOME/}")
}

link_ai_file "$AI_DOTFILES_ROOT/ai/instructions.md" "$HOME/.codex/AGENTS.md"
link_ai_file "$AI_DOTFILES_ROOT/ai/instructions.md" "$HOME/.claude/CLAUDE.md"

for skill_dir in "$AI_DOTFILES_ROOT/ai/skills"/*; do
  [ -d "$skill_dir" ] || continue
  skill_name="$(basename "$skill_dir")"
  link_ai_file "$skill_dir" "$HOME/.agents/skills/$skill_name"
  link_ai_file "$skill_dir" "$HOME/.claude/skills/$skill_name"
done

printf 'Linked AI config: %s\n' "${AI_LINKS[*]}"
