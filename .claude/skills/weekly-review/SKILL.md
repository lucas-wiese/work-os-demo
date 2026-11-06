---
name: weekly-review
description: Reviews how Claude and the user worked in this repo over a period, from TIMELINE.md and the session transcripts, and ends in at most 5 approvable changes to the setup. Use when the user says "weekly review", "what did we learn", "how could we work better", or gives a range ("review the last 7 days").
argument-hint: [last N days — default 7]
---

# Weekly review

The TIMELINE says what happened; the transcripts say how. This skill reads both and proposes changes to the system itself, not to the accounts.

## Steps

1. Read `TIMELINE.md` for the period. List the sessions and their ⟨shortid⟩.
2. For each session, distill its transcript with `bash .claude/scripts/extract_session.sh <file>` (transcripts live in the Claude Code projects folder for this repo; match by shortid).
3. Look for:
   - **Corrections:** where the user had to correct Claude, and whether it happened more than once.
   - **Lost facts:** something stated in a session that never reached a `STATE.md`.
   - **Repeated manual work:** the same steps done by hand in two or more sessions (a skill or hook candidate).
   - **Stale state:** a `STATE.md` whose `Last updated` is older than its last session.
4. Propose **at most 5 changes**, each with: the evidence (⟨shortid⟩ + quote), the change (a rule in `CLAUDE.md`, a new skill, a hook), and where it goes.

## Rules

- Evidence first: no proposal without a session that shows the problem.
- Nothing is changed until the user approves it, one by one.
- A rule that a hook could enforce should be a hook.
