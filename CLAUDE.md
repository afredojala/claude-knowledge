# CLAUDE.md

## What
Knowledge base of reference docs, skills, slash commands, and custom agents for Claude Code and OpenAI Codex CLI.

## Tech
- Just (task runner)
- Symlinks to `~/.claude/` for installation
- Markdown files for all content

## Commands
- `just status` - Show installed vs available
- `just install-all` - Install all skills + commands + agents
- `just reinstall` - Uninstall + reinstall (after updates)
- `just skill-install <name>` - Install single skill
- `just command-install <name>` - Install single command
- `just agent-install <name>` - Install single agent

## Structure
```
├── agents/          # Claude-only: custom subagent .md files
├── commands/        # Claude: slash command .md files
├── codex/prompts/   # Codex: custom prompts (mirrored from commands/)
├── skills/          # Claude-only: skill documentation
├── skills-src/      # Claude-only: skill source (SKILL.md + guides)
├── prompting.md     # Reference doc
├── SYNC.md          # Claude ↔ Codex format mapping
└── justfile         # Installation recipes
```

## Creating Agents

Agents are autonomous specialists Claude invokes automatically for specific tasks.

**File location:** `agents/<name>.md` → installs to `~/.claude/agents/`

**Frontmatter format:**
```yaml
---
name: my-agent              # required - unique identifier
description: What it does   # required - when to invoke
model: sonnet               # sonnet|opus|haiku|inherit (default: sonnet)
tools: Read, Glob, Grep     # optional allowlist (inherits all if omitted)
disallowedTools: Bash       # optional denylist
---

System prompt in markdown...
```

**Key fields:**
- `name` + `description`: Required. Description tells Claude when to use this agent
- `model`: Cost/capability tradeoff. Use `opus` for complex reasoning, `haiku` for fast/cheap
- `tools`: Allowlist restricts available tools. Omit to inherit all tools from conversation
- `disallowedTools`: Denylist blocks specific tools while allowing others

**Tips:**
- Be specific in description so Claude knows when to invoke
- Scope tools narrowly for security (e.g., `tools: Read, Glob, Grep` for read-only agents)
- Agents reload on session start; use `/agents` to reload without restart

## Gotchas
- Skills go in `skills-src/<name>/SKILL.md`, docs in `skills/<name>.md`
- Commands are single `.md` files with YAML frontmatter
- Agents are single `.md` files with YAML frontmatter (like commands)
- Install uses symlinks, not copies—edits here propagate immediately
- `~/.claude/` must exist (justfile creates subdirs automatically)

## Non-Negotiables
- Skills must have `SKILL.md` as entry point
- Command files need frontmatter with `name` field
- Agent files need frontmatter with `name` and `description` fields
