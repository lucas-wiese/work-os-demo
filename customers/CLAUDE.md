# customers/ — one folder per account

Every account has the same shape, so Claude (and you) always know where to look:

```
customers/{Account}/
  STATE.md        ← read first: snapshot, contacts, commitments, context, log
  transcripts/    ← every call, as markdown: YYYY-MM-DD {Account} - {Meeting}.md
```

## Rules

- `STATE.md` is the only place an account's status lives. A call, an email or a decision that changes it gets written there in the same session.
- **Email domains** in each `STATE.md` are how `/file-call` matches a raw transcript to its account. One domain belongs to one account only.
- A new account = a new folder with a `STATE.md` copied from an existing one. No edit to this file is needed: `ls` is the roster.
