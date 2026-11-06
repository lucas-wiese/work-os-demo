#!/usr/bin/env bash
# SessionStart hook. If something landed in _inbox/ (a call recording, an export, a pasted thread),
# tell Claude to file it before anything else. Silent when the inbox is empty.
set -u
REPO="${CLAUDE_PROJECT_DIR:-$(cd "$(dirname "$0")/../.." && pwd)}"
files=$(find "$REPO/_inbox" -maxdepth 1 -type f ! -name '.*' 2>/dev/null | sort)
[ -n "$files" ] || exit 0
n=$(printf '%s\n' "$files" | wc -l | tr -d ' ')
echo "📥 _inbox/ has $n new file(s). Before anything else, file each one with the file-call skill (.claude/skills/file-call/SKILL.md) and report what changed:"
printf '%s\n' "$files" | sed 's#^#   #'
exit 0
