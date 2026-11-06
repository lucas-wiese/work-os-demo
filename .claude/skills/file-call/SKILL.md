---
name: file-call
description: Files a raw call recording or pasted transcript into the right customer and updates everything it touches (STATE, pipeline, insights). Use when the user says "process this call", "file this transcript", "/file-call", or drops a recording in _inbox/.
argument-hint: [path in _inbox/ — defaults to the newest file there]
---

# Process a call

Turn one raw transcript into updated account context. Nothing leaves the repo; nothing is sent to anyone.

## Steps

1. **Read the raw file** (the argument, or the newest file in `_inbox/`).
2. **Find the account.** Match attendee email domains and names against the `Email domains` and `Key contacts` of every `customers/*/STATE.md`. Exactly one match → go on. None or several → stop and ask.
3. **File the transcript** as `customers/{Account}/transcripts/YYYY-MM-DD {Account} - {Meeting}.md`: a header (date, participants with role, source file), then the conversation verbatim. Delete the raw file from `_inbox/`.
4. **Extract**, each item with a short verbatim quote:
   - decisions · commitments (ours and theirs, with dates) · risks and deadlines
   - deal signals (budget, stage, amount, competitor)
   - feature requests · objections · competitor mentions
5. **Update `STATE.md`:** `Last updated`, Snapshot if it changed, Open commitments, Context, and one dated line on top of the Log pointing to the transcript.
6. **Update `pipeline.md`** if a deal moved (stage, amount, close date, next step) and recompute the total.
7. **Update `knowledge/insights.md`:** add each request, objection or competitor under its theme (create the theme if new). **If the theme now spans two or more accounts, say so explicitly**, and if it gates open deals, add up the ACV at stake from `pipeline.md`.

## Report back (short)

- Account matched, and how (domain or name).
- What changed, file by file, in one line each.
- Commitments with dates: ours first.
- **Patterns across accounts**, with the revenue at stake if any.

## Rules

- Quotes are verbatim; never paraphrase inside quotation marks.
- No number, date or commitment that isn't in the transcript.
- If something in the call contradicts the `STATE.md`, update the state and say what changed.
