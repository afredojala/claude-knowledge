# Project CLAUDE.md Guide

Location: `<project-root>/CLAUDE.md`

This file contains **project-specific context** that AI needs to work effectively in this codebase.

---

## What Belongs Here

- What the project does (1-2 lines)
- Key commands (test, lint, build, deploy)
- Tech stack and architecture overview
- Domain-specific quirks and gotchas
- Non-negotiable project constraints
- Pointers to reference docs (not the docs themselves)

## What Does NOT Belong Here

- Personal communication preferences (use user CLAUDE.md)
- Detailed style guides (use separate reference docs)
- Obvious things AI already knows

---

## Template

```markdown
# CLAUDE.md

## What
[1-2 sentences describing what this project does]

## Tech
- [Framework/language]
- [Key libraries]
- [Infrastructure]

## Commands
- `[test command]` - Run tests
- `[lint command]` - Lint (must pass)
- `[build command]` - Build

## Structure
```
src/
├── [dir]/   # [purpose]
├── [dir]/   # [purpose]
└── [dir]/   # [purpose]
```

## Gotchas
- [Domain-specific quirk AI can't guess]
- [API behavior that's non-obvious]
- [Performance consideration]

## Non-Negotiables
- [Critical constraint 1]
- [Critical constraint 2]
```

---

## Size Guideline

**Target: 30-60 lines**

If exceeding 100 lines:
- Move detailed docs to reference files
- Keep only what AI needs for every task

---

## What Makes a Good Project CLAUDE.md

### Domain Knowledge
Include things AI can't infer:
- API quirks ("pagination via `p` param, check `@nasta_sida` for next")
- Timing issues ("October = high volume, 2000+ motions")
- Data formats ("XML contains entity-encoded HTML, needs double parse")

### Schema/Structure
For data projects, list tables/collections with PKs:
```markdown
## Schema
1. `users` - (user_id PK)
2. `orders` - (order_id PK, user_id FK)
```

### Commands That Actually Work
Not generic examples—real commands for this project:
```markdown
## Commands
- `uv run pytest` - Run tests
- `uv run modal deploy src/app/main.py` - Deploy
```

---

## Common Mistakes

| Mistake | Why It's Wrong | Fix |
|---------|---------------|-----|
| Duplicating docs | Wastes context, gets stale | Link to docs instead |
| Too many rules | Dilutes AI attention | Keep only essentials |
| Vague constraints | AI interprets loosely | Be specific |
| Missing commands | AI guesses wrong | List actual commands |
| No domain knowledge | AI makes wrong assumptions | Add quirks/gotchas |

---

## Evolution Strategy

1. **Start minimal** - Just commands and structure
2. **Add rules reactively** - When AI makes a mistake, add a rule to prevent it
3. **Prune regularly** - Remove rules that aren't changing behavior
4. **Extract to reference docs** - When a section grows large, move to separate file

Your CLAUDE.md should grow organically based on actual problems, not anticipated ones.
