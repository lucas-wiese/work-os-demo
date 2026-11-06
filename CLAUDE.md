# Work OS — Alex Rivera, Account Director at Lumen

Work operating system for Alex Rivera, who manages Lumen's key accounts in Southern Europe. Lumen sells a demand-forecasting API to retailers.

This file is the **index**: scan it to find where everything lives, plus the operating rules. Keep it lean: pointers, not content.

## Architecture

| Folder | What's in it | Sub-index |
|---|---|---|
| **`customers/{Account}/`** | One folder per account, all with the same shape: `STATE.md` + `transcripts/` | `customers/CLAUDE.md` |
| **`knowledge/`** | What's true across accounts: `insights.md` (requests, objections, competitors, by theme) | — |

**Root files:** `CLAUDE.md` (this index) · `pipeline.md` (every open deal, cross-account) · `TIMELINE.md` (one line per session, written by hook) · `_inbox/` (raw drops: call recordings, exports, pasted threads; `/process-call` files them).

## Where to find X

| Need | Location |
|---|---|
| A customer's state, contacts, commitments | `customers/{Account}/STATE.md` (read it first) |
| What was said in a call | `customers/{Account}/transcripts/` |
| Open deals and next steps | `pipeline.md` |
| What several customers are asking for | `knowledge/insights.md` |
| What got done, session by session | `TIMELINE.md` |

## Operating rules

**Capture, so nothing is lost:**
- At the start of customer work, read its `STATE.md`. At the end, update it (what changed + one dated line in its Log).
- **A fact stated mid-session** (a decision, a date, a number, a name) goes into its `STATE.md` in the same turn, and into `pipeline.md` if it moves a deal.
- **Call transcripts land in the customer's `transcripts/`**, never left in `_inbox/`. Use `/process-call`.
- **Index ≠ state.** `CLAUDE.md` files are maps and never hold status. Status lives in `STATE.md`, history in `TIMELINE.md`. One fact, one place: the layer above keeps a pointer, never a copy.
- **Close substantive sessions with `/clear`.** That is what logs them to `TIMELINE.md` (closing the terminal is not logged, on purpose).

**Accuracy:**
- Label claims Alex will act on: **[V: source]** (checked, and the label names the file or link), **[Likely]** (inferred), **[Uncertain]** (needs a source).
- Never invent a number, a date or a commitment. If it is not in a file, say so.
- Anything that leaves for a customer (email, deck) gets a separate review pass before Alex sends it.

## Naming

TitleCase account folders · ALL-CAPS anchors (`CLAUDE.md`, `STATE.md`) · transcripts `YYYY-MM-DD {Account} - {Meeting}.md`
