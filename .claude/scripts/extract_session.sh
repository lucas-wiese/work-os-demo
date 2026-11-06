#!/usr/bin/env bash
# extract_session.sh <transcript.jsonl>
# Distills a Claude Code session transcript to what matters for its TIMELINE line: what the user asked
# and what Claude did or concluded. Drops tool results and command noise.
set -u
F="${1:?usage: extract_session.sh <transcript.jsonl>}"
[ -f "$F" ] || { echo "not found: $F" >&2; exit 1; }

DATE=$(date -r "$F" +%F)
echo "### SESSION $DATE (close date)"
echo "SHORTID: $(basename "$F" .jsonl | cut -c1-8)"
echo ""
echo "--- USER (what was asked) ---"
{ jq -r 'select(.type=="user") | (.message.content | if type=="string" then . elif type=="array" then ([.[] | select(.type=="text") | .text] | join(" ")) else "" end)' "$F" 2>/dev/null \
  | grep -avE '^<|^[[:space:]]*$|command-name|command-message|command-args|system-reminder|local-command' \
  | head -40 | cut -c1-500; } || true
echo ""
echo "--- CLAUDE (what was done / concluded) ---"
{ jq -r 'select(.type=="assistant") | (.message.content[]? | select(.type=="text") | .text)' "$F" 2>/dev/null \
  | grep -avE '^[[:space:]]*$' \
  | head -60 | cut -c1-400; } || true
