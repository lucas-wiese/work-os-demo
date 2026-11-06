#!/usr/bin/env bash
# SessionStart hook. Light, no LLM. Looks for sessions closed with /clear that have no line in
# TIMELINE.md yet, and tells Claude to write them before anything else. Silent when nothing is pending.
set -u
REPO="${CLAUDE_PROJECT_DIR:-$(cd "$(dirname "$0")/../.." && pwd)}"
CLOSED="$REPO/.claude/state/closed-sessions"
TIMELINE="$REPO/TIMELINE.md"
[ -f "$CLOSED" ] || exit 0

# Substantive = at least 2 text replies from Claude (skips sessions that were opened and closed).
has_substance() {
  local n
  n=$(jq -Rn '[inputs | fromjson? | select(.type=="assistant") | .message.content[]? | select(.type=="text") | select(.text | test("\\S"))] | length' "$1" 2>/dev/null)
  [ "${n:-0}" -ge 2 ]
}

pending=()
keep=()
while IFS= read -r f; do
  [ -n "$f" ] && [ -f "$f" ] || continue
  id="$(basename "$f" .jsonl | cut -c1-8)"
  grep -qF "⟨${id}⟩" "$TIMELINE" 2>/dev/null && continue   # already logged: drop it from the list
  has_substance "$f" || continue
  pending+=("$f"); keep+=("$f")
done < "$CLOSED"
if [ ${#keep[@]} -gt 0 ]; then printf '%s\n' "${keep[@]}" > "$CLOSED"; else : > "$CLOSED"; fi

[ ${#pending[@]} -gt 0 ] || exit 0
echo "📋 TIMELINE: ${#pending[@]} session(s) closed with /clear and not logged yet. Before anything else, for each one:"
echo "   1. Distill it: bash \"$REPO/.claude/scripts/extract_session.sh\" <file>"
echo "   2. Write ONE line in TIMELINE.md under its date heading (newest on top), in the format shown at the top of the file:"
echo "      - \`tag\` #Account · What was done and how it ended. ⟨shortid⟩ → pointers"
echo "   Rules: one line, no sub-bullets, ~200 characters before ⟨shortid⟩. What was learned goes to its STATE.md; TIMELINE only points."
printf '   Pending: %s\n' "${pending[@]}"
exit 0
