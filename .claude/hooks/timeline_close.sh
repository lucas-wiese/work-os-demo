#!/usr/bin/env bash
# SessionEnd hook. If the session was closed with /clear (the one deliberate close that gets logged),
# remember its transcript path so the next session writes its TIMELINE line.
# Closing the terminal or /exit also fires SessionEnd with another reason, and is NOT logged:
# that is how you say "this one doesn't count".
set -u
REPO="${CLAUDE_PROJECT_DIR:-$(cd "$(dirname "$0")/../.." && pwd)}"
CLOSED="$REPO/.claude/state/closed-sessions"

INPUT="$(cat 2>/dev/null || true)"
REASON="$(printf '%s' "$INPUT" | jq -r '.reason // empty' 2>/dev/null)"
TRANSCRIPT="$(printf '%s' "$INPUT" | jq -r '.transcript_path // empty' 2>/dev/null)"
[ "$REASON" = "clear" ] && [ -n "$TRANSCRIPT" ] || exit 0

mkdir -p "$(dirname "$CLOSED")"
grep -qxF "$TRANSCRIPT" "$CLOSED" 2>/dev/null || printf '%s\n' "$TRANSCRIPT" >> "$CLOSED"
exit 0
