---
name: agents-md
description: Create or improve AGENTS.md files. Use when user asks to create, review, or improve AGENTS.md, ground rules, or AI instructions for a project or their user config.
---

# AGENTS.md Generator

This skill helps create and improve AGENTS.md files - the ground rules that configure AI behavior in Codex.

## Two Types

| Type | Location | Purpose |
|------|----------|---------|
| **User** | `~/.codex/AGENTS.md` | Personal preferences across all projects |
| **Project** | `<project>/AGENTS.md` | Project-specific context and rules |

## Workflow

1. **Determine type**: User or Project based on request
2. **Read existing file** if it exists
3. **Apply guidelines** from the relevant guide:
   - User: See [user-guide.md](user-guide.md)
   - Project: See [project-guide.md](project-guide.md)
4. **Propose changes** with rationale

## Key Principles

### User AGENTS.md (20-40 lines)
- Context marker (🍀 emoji)
- Communication style
- Push-back permissions
- Alignment checks
- Universal code principles

### Project AGENTS.md (30-60 lines)
- What the project does (1-2 lines)
- Commands (test, lint, build)
- Architecture overview
- Domain-specific quirks/gotchas
- Non-negotiables

## Quality Checks

Before finalizing, verify:
- [ ] Every line changes AI behavior
- [ ] No duplication between user/project
- [ ] Specific and actionable (not vague)
- [ ] Within size guidelines
- [ ] Includes context marker setup (user) or domain knowledge (project)

## Anti-Patterns to Flag

- Project-specific content in user file
- Vague rules ("write clean code")
- Too many rules (dilutes attention)
- Missing push-back permission
- Missing alignment check instruction
