# Skill: claude-md

**Location:** `~/.claude/skills/claude-md/`

**Triggers:** "CLAUDE.md", "ground rules", "AI instructions"

---

## What It Does

Creates and improves CLAUDE.md files - the ground rules that configure AI behavior.

## Files

```
~/.claude/skills/claude-md/
├── SKILL.md          # Main skill definition
├── user-guide.md     # Guide for ~/.claude/CLAUDE.md
└── project-guide.md  # Guide for project CLAUDE.md
```

## Two Types of CLAUDE.md

| Type | Location | Size | Contains |
|------|----------|------|----------|
| User | `~/.claude/CLAUDE.md` | 20-40 lines | Personal preferences, context marker, push-back permissions |
| Project | `<project>/CLAUDE.md` | 30-60 lines | Commands, architecture, domain quirks, non-negotiables |

## Key Principles Applied

### User CLAUDE.md
- Context marker (🍀) for detecting context rot
- Succinct communication style
- Push-back permissions
- Alignment check before implementation

### Project CLAUDE.md
- One-line project description
- Real commands (not generic examples)
- Domain knowledge AI can't infer
- Gotchas and quirks

## Quality Checks

The skill verifies:
- Every line changes AI behavior
- No duplication between user/project
- Specific and actionable (not vague)
- Within size guidelines

## Example Invocations

- "Create a CLAUDE.md for this project"
- "Review my user CLAUDE.md"
- "Improve the ground rules"
- "What's wrong with this CLAUDE.md?"
