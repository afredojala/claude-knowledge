---
description: Create or improve AGENTS.md files for Codex. Use when user asks to create, review, or improve AGENTS.md or AI instructions.
argument-hint: [TYPE=user|project]
---

# AGENTS.md Generator

Help create and improve AGENTS.md files - the ground rules that configure Codex behavior.

## Two Types

| Type | Location | Purpose |
|------|----------|---------|
| **User** | `~/.codex/AGENTS.md` | Personal preferences across all projects |
| **Project** | `<project>/AGENTS.md` | Project-specific context and rules |

If `$1` or `$TYPE` is provided, use that. Otherwise determine from context.

## Workflow

1. **Determine type**: User or Project based on request
2. **Read existing file** if it exists
3. **Apply guidelines** from relevant section below
4. **Propose changes** with rationale

---

## User AGENTS.md (20-40 lines)

Location: `~/.codex/AGENTS.md`

### What Belongs Here
- Communication style preferences
- Push-back permissions
- Alignment check instructions
- Universal code principles

### What Does NOT Belong Here
- Project-specific tech stacks
- Team conventions
- Repository-specific commands

### Template

```markdown
# User AGENTS.md

## Response Style
- BE SUCCINCT. No verbose explanations unless asked.
- Skip preambles like "Great question!"
- Code speaks louder than prose
- Bullet points, not paragraphs

## Before Implementing
- Show me your plan first (succinctly)
- If requirements are ambiguous, ASK
- If multiple valid approaches exist, ask which I prefer
- Never guess at business logic

## Push Back
- If I suggest a bad approach, say so directly
- If my assumptions are wrong, correct me
- If there's a better way, tell me

## Code Principles
- DRY, YAGNI, composition over inheritance
- Type hints on public functions
- Prefer pathlib, f-strings, dataclasses/Pydantic
```

---

## Project AGENTS.md (30-60 lines)

Location: `<project-root>/AGENTS.md`

### What Belongs Here
- What the project does (1-2 lines)
- Key commands (test, lint, build, deploy)
- Tech stack and architecture overview
- Domain-specific quirks and gotchas
- Non-negotiable project constraints

### What Does NOT Belong Here
- Personal communication preferences (use user AGENTS.md)
- Detailed style guides (use separate reference docs)

### Template

```markdown
# AGENTS.md

## What
[1-2 sentences describing what this project does]

## Tech
- [Framework/language]
- [Key libraries]

## Commands
- `[test command]` - Run tests
- `[lint command]` - Lint
- `[build command]` - Build

## Structure
```
src/
├── [dir]/   # [purpose]
└── [dir]/   # [purpose]
```

## Gotchas
- [Domain-specific quirk AI can't guess]
- [API behavior that's non-obvious]

## Non-Negotiables
- [Critical constraint 1]
- [Critical constraint 2]
```

---

## Quality Checks

Before finalizing, verify:
- [ ] Every line changes AI behavior
- [ ] No duplication between user/project
- [ ] Specific and actionable (not vague)
- [ ] Within size guidelines

## Anti-Patterns to Flag

- Project-specific content in user file
- Vague rules ("write clean code")
- Too many rules (dilutes attention)
- Missing push-back permission

## Evolution Strategy

1. **Start minimal** - Just commands and structure
2. **Add rules reactively** - When AI makes a mistake, add a rule
3. **Prune regularly** - Remove rules that aren't changing behavior
