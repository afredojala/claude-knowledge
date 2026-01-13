# Claude Code ↔ OpenAI Codex Sync Guide

This repo supports both Claude Code and OpenAI Codex CLI. This document explains format differences and how to maintain parity.

## Directory Mapping

| Claude Code | OpenAI Codex | Notes |
|-------------|--------------|-------|
| `~/.claude/` | `~/.codex/` | Config home |
| `CLAUDE.md` | `AGENTS.md` | Project instructions |
| `commands/*.md` | `codex/prompts/*.md` | Custom slash commands |
| `skills-src/` | — | No Codex equivalent |
| `agents/*.md` | — | No Codex equivalent |

## Repo Structure

```
claude-knowledge/
├── commands/           # Claude Code commands
│   └── *.md
├── codex/
│   └── prompts/        # OpenAI Codex prompts (mirrored from commands/)
│       └── *.md
├── skills-src/         # Claude-only (no Codex equivalent)
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

### Skills (Claude-only)

Skills are multi-file packages that auto-trigger based on context. Codex has no equivalent.

**Options for Codex:**
1. Convert to single prompt (loses supporting docs)
2. Reference external docs in prompt body
3. Skip (accept feature gap)

---

### Agents (Claude-only)

Custom subagents with model/tool restrictions. Codex has no equivalent.

**Not translatable.** Accept feature gap.

---

## Manual Sync Checklist

When adding/updating a command:

1. **Edit source in `commands/<name>.md`**
2. **Copy to `codex/prompts/<name>.md`**
3. **Adjust frontmatter:**
   - Remove `allowed-tools` if present
   - Add `argument-hint` if command takes arguments
4. **Test in both CLIs**

When updating project instructions:

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
| Tool restrictions | ✅ | ❌ | ❌ No |
| Positional args | ❌ | ✅ | ⚠️ Codex-only |
| Named args | ❌ | ✅ | ⚠️ Codex-only |
| Multi-file skills | ✅ | ❌ | ❌ No |
| Custom agents | ✅ | ❌ | ❌ No |
| Override files | ❌ | ✅ | ⚠️ Codex-only |
