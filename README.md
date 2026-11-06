# Work OS — a starter repo for running your work with Claude Code

A small, working example of an AI-native work setup: all your context in one folder that Claude Code reads, updates and learns from. The data is fictional (Alex, an account director at "Lumen", and three customers).

## Why a repo, and not just chat

| | Where the context lives | What happens next week |
|---|---|---|
| **Chat** | In one conversation | Gone. You paste it again |
| **Project** | Files you uploaded | Frozen. You update them by hand |
| **This repo** | Plain markdown files, indexed | Claude reads them, updates them after every call, and logs every session |

## The four ideas

1. **`CLAUDE.md` is an index, not a document.** It tells Claude where everything lives and the rules of the house. Each folder can have its own.
2. **One `STATE.md` per account.** The single place where an account's status lives. Every call and every decision updates it.
3. **Automation for the boring capture.** `/process-call` files a raw transcript into the right account, updates its state, the pipeline and the cross-customer insights.
4. **A TIMELINE that learns.** Hooks log every session you close with `/clear`. `/weekly-review` reads that log and proposes changes to the setup itself.

## Try it (no experience needed)

1. Download this folder and open it in Claude Code: the **Code** tab of the Claude desktop app, or VS Code with the Claude Code extension.
2. Type `/process-call`. Claude files `_inbox/call-recording-2026-11-09.txt` into Fresco Market and tells you what changed.
3. Ask: *"Which customers asked for promo-aware forecasting, and how much revenue depends on it?"*
4. Type `/clear`. The next session starts by writing its line in `TIMELINE.md`.

## Make it yours

Keep the shape, replace the data: your accounts (or projects, or clients) as folders, a `STATE.md` in each, and your rules in `CLAUDE.md`. Start with one folder and one rule.
