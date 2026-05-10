# Repo git hooks

This directory holds repo-tracked git hooks. They are **not** active by default
on a fresh clone — git looks at `.git/hooks/` first, which is local and untracked.

## One-time activation per clone

Run from the repo root:

```bash
git config core.hooksPath .githooks
```

That's it. From now on, hooks in this directory will fire on the appropriate
events.

## What's here

- **`pre-commit`** — i18n parity gate. Blocks any commit that adds/modifies a
  `content/it/*.md` or `content/en/*.md` page without a matching sibling in the
  other language tree carrying the same `translationKey:` frontmatter value.
  Mirrors the server-side `.github/workflows/i18n-parity.yml` check.

## Bypassing

In a real emergency: `git commit --no-verify`. The server-side workflow is the
non-bypassable gate, so the only thing `--no-verify` buys you is faster local
iteration before push.
