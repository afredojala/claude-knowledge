# User CLAUDE.md Guide

Location: `~/.claude/CLAUDE.md`

This file contains **personal preferences** that apply to all projects.

---

## What Belongs Here

- Context marker setup (🍀 emoji)
- Communication style preferences
- Push-back permissions
- Alignment check instructions
- Universal code principles

## What Does NOT Belong Here

- Project-specific tech stacks
- Team conventions
- Repository-specific commands
- Anything that varies between projects

---

## Template

```markdown
# User CLAUDE.md

## Context Marker
- **ALWAYS** start replies with 🍀 + space
- Stack additional emojis when requested, don't replace

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
- Flag errors with ❗️ prefix

## Code Principles
- DRY, YAGNI, composition over inheritance
- Type hints on public functions
- Prefer pathlib, f-strings, dataclasses/Pydantic
```

---

## Size Guideline

**Target: 20-40 lines**

If exceeding 50 lines, project-specific content likely belongs elsewhere.

---

## The Essentials

Minimum viable user CLAUDE.md:

```markdown
- Start every reply with 🍀 + space (stack emojis, don't replace)
- Be succinct
- Push back on bad ideas
- Ask before guessing
- Flag errors with ❗️
```

The emoji is your canary—when it disappears, context has rotted.

---

## Common Mistakes

| Mistake | Why It's Wrong | Fix |
|---------|---------------|-----|
| Including tech stack | Varies by project | Move to project CLAUDE.md |
| Too many rules | Dilutes attention | Keep only essentials |
| Vague instructions | AI interprets loosely | Be specific and actionable |
| Missing push-back permission | AI defaults to agreeing | Explicitly grant permission |
| Missing context marker | Can't detect context rot | Add 🍀 requirement |
