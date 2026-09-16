#!/usr/bin/env bash
# Injects rules.md into the session as standing context.
# Plain stdout from a SessionStart hook is added to Claude's context, so no
# JSON escaping is needed. Runs on startup, /clear and after compaction so the
# rule survives a compacted context.
set -euo pipefail
cat "$(dirname "$0")/../rules.md"
