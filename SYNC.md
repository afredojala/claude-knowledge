# Claude Code ↔ OpenAI Codex Sync Guide

This repo supports both Claude Code and OpenAI Codex CLI. This document explains format differences and how to maintain parity.

## Directory Mapping

| Claude Code | OpenAI Codex | Notes |
|-------------|--------------|-------|
| `~/.claude/` | `~/.codex/` | Config home |
| `CLAUDE.md` | `AGENTS.md` | Project instructions |
| `commands/*.md` | `codex/prompts/*.md` | Custom slash commands |
| `skills-src/<name>/` | `codex/prompts/<name>.md` | Flatten to single prompt |
| `agents/*.md` | — | No Codex equivalent |

## Repo Structure

```
claude-knowledge/
├── commands/           # Claude Code commands
│   └── *.md
├── skills-src/         # Claude Code skills (multi-file)
│   └── <name>/
│       ├── SKILL.md
│       └── *.md
├── codex/
│   └── prompts/        # OpenAI Codex prompts
│       └── *.md        # (commands + flattened skills)
├── agents/             # Claude-only (no Codex equivalent)
└── SYNC.md             # This file
```

## Format Differences

### Project Instructions

**Claude Code (`CLAUDE.md`):**
- Freeform markdown
- Loaded from project root + `~/.claude/CLAUDE.md`

**OpenAI Codex (`AGENTS.md`):**
- Freeform markdown (same structure works)
- Loaded from project root + `~/.codex/AGENTS.md`
- Supports `AGENTS.override.md` for local overrides

**Sync:** Copy `CLAUDE.md` → `AGENTS.md` (or symlink). Content is compatible.

---

### Custom Commands/Prompts

**Claude Code (`commands/*.md`):**
```yaml
---
description: What it does
allowed-tools: Read, Glob, Grep    # Optional tool restriction
---

Prompt body with $ARGUMENTS placeholder
```

**OpenAI Codex (`codex/prompts/*.md`):**
```yaml
---
description: What it does
argument-hint: [FILE=<path>]       # Optional usage hint
---

Prompt body with:
- $ARGUMENTS (all args)
- $1 through $9 (positional)
- $KEY (named, passed as KEY=value)
```

#### Frontmatter Translation

| Claude Field | Codex Field | Notes |
|--------------|-------------|-------|
| `description` | `description` | 1:1 |
| `allowed-tools` | — | Drop (Codex has no tool restrictions) |
| — | `argument-hint` | Add if command takes params |

#### Placeholder Translation

| Claude | Codex | Notes |
|--------|-------|-------|
| `$ARGUMENTS` | `$ARGUMENTS` | 1:1 |
| — | `$1`-`$9` | Positional args (Codex-only) |
| — | `$KEY` | Named args (Codex-only) |

**Sync:** Copy command, adjust frontmatter, keep `$ARGUMENTS` (works in both).

---

### Skills → Prompts

Skills are multi-file packages that auto-trigger in Claude Code. Codex has no direct equivalent, but skills can be **flattened to single prompts**.

**Conversion approach:**
1. Combine `SKILL.md` + supporting docs into one file
2. Adapt terminology (`CLAUDE.md` → `AGENTS.md`, `~/.claude/` → `~/.codex/`)
3. Add `argument-hint` if the skill accepts parameters
4. Place in `codex/prompts/<name>.md`

**Example mapping:**
| Claude Skill | Codex Prompt |
|--------------|--------------|
| `skills-src/claude-md/` | `codex/prompts/agents-md.md` |

**What's lost:**
- Auto-triggering (Codex prompts require explicit `/prompts:name` invocation)
- Separate supporting doc files (must inline or truncate)

---

### Agents (Claude-only)

Custom subagents with model/tool restrictions. Codex has no equivalent.

**Not translatable.** Accept feature gap.

---

## Manual Sync Checklist

### Commands

1. **Edit source in `commands/<name>.md`**
2. **Copy to `codex/prompts/<name>.md`**
3. **Adjust frontmatter:**
   - Remove `allowed-tools` if present
   - Add `argument-hint` if command takes arguments
4. **Test in both CLIs**

### Skills

1. **Edit source in `skills-src/<name>/`**
2. **Flatten to `codex/prompts/<name>.md`:**
   - Merge SKILL.md + supporting docs
   - Adapt terminology (CLAUDE.md → AGENTS.md)
   - Add `argument-hint` if needed
3. **Test in both CLIs**

### Project Instructions

1. **Edit `CLAUDE.md`**
2. **Copy to `AGENTS.md`** (or maintain symlink)

---

## Installation

### Claude Code
```bash
just install-all
```

### OpenAI Codex
```bash
# Link prompts directory
ln -sfn "$(pwd)/codex/prompts" ~/.codex/prompts

# Copy project instructions (or symlink)
cp CLAUDE.md AGENTS.md
```

---

## Feature Comparison

| Feature | Claude Code | Codex | Portable? |
|---------|-------------|-------|-----------|
| Project instructions | ✅ | ✅ | ✅ Yes |
| Custom commands | ✅ | ✅ | ✅ Yes (minor adjustments) |
| Skills | ✅ (multi-file) | ✅ (flattened) | ⚠️ Flatten to single prompt |
| Tool restrictions | ✅ | ❌ | ❌ No |
| Positional args | ❌ | ✅ | ⚠️ Codex-only |
| Named args | ❌ | ✅ | ⚠️ Codex-only |
| Custom agents | ✅ | ❌ | ❌ No |
| Override files | ❌ | ✅ | ⚠️ Codex-only |
