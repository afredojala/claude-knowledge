# Claude Knowledge Base

Project-agnostic reference docs, skills, and commands for AI-assisted development.

**Supports:** Claude Code + OpenAI Codex CLI (see [SYNC.md](SYNC.md) for format mapping)

## Requirements

| Tool | Minimum Version | Install | Purpose |
|------|-----------------|---------|---------|
| [Claude Code](https://docs.anthropic.com/en/docs/claude-code) | ≥ 1.0.0 | `npm install -g @anthropic-ai/claude-code` | Skills, commands, agents |
| [Codex CLI](https://github.com/openai/codex) | ≥ 0.80.0 | `npm install -g @openai/codex` | Native skills support |
| [just](https://github.com/casey/just) | ≥ 1.0.0 | `cargo install just` or [binaries](https://github.com/casey/just/releases) | Task runner |

## Quick Start

### Claude Code
```bash
cd ~/repos/claude-knowledge
just install-all
```

### OpenAI Codex
```bash
cd ~/repos/claude-knowledge
just codex-install-all

# Optional: use CLAUDE.md as single source of truth
just codex-use-claude-md
```

## Structure

```
claude-knowledge/
├── README.md
├── SYNC.md               # Claude ↔ Codex format mapping
├── justfile              # Installation recipes
├── prompting.md          # Reference: prompting best practices
├── commands/             # Claude: slash commands
│   └── *.md
├── codex/
│   ├── prompts/          # Codex: custom prompts
│   │   └── *.md
│   └── skills/           # Codex: native skills
│       └── <name>/
├── skills/               # Claude: skill docs
│   └── *.md
├── skills-src/           # Claude: skill source
│   └── <name>/
└── agents/               # Claude-only: custom subagents
    └── *.md
```

## Feature Support

| Feature | Claude Code | Codex | Portable? |
|---------|:-----------:|:-----:|:---------:|
| Project instructions | ✅ | ✅ | ✅ |
| Custom commands/prompts | ✅ | ✅ | ✅ |
| Skills (multi-file) | ✅ | ✅ | ✅ |
| Custom agents | ✅ | ❌ | ❌ |
| Tool restrictions | ✅ | ❌ | ❌ |

See [SYNC.md](SYNC.md) for detailed format mapping.

## Justfile Commands

### Claude Code

| Command | Description |
|---------|-------------|
| `just status` | Show installed vs available |
| `just install-all` | Install all skills + commands + agents |
| `just uninstall-all` | Remove all installed items |
| `just reinstall` | Uninstall then reinstall (after updates) |

#### Skills
| Command | Description |
|---------|-------------|
| `just skills-list` | List available skills |
| `just skill-install <name>` | Install one skill |
| `just skills-install-all` | Install all skills |

#### Commands
| Command | Description |
|---------|-------------|
| `just commands-list` | List available commands |
| `just command-install <name>` | Install one command |
| `just commands-install-all` | Install all commands |

#### Agents
| Command | Description |
|---------|-------------|
| `just agents-list` | List available agents |
| `just agent-install <name>` | Install one agent |
| `just agents-install-all` | Install all agents |

### OpenAI Codex

| Command | Description |
|---------|-------------|
| `just codex-install-all` | Install all skills + prompts |
| `just codex-uninstall-all` | Remove all installed items |
| `just codex-reinstall` | Uninstall then reinstall |
| `just codex-use-claude-md` | Configure Codex to use CLAUDE.md as fallback |

#### Skills
| Command | Description |
|---------|-------------|
| `just codex-skills-list` | List available skills |
| `just codex-skill-install <name>` | Install one skill |
| `just codex-skills-install-all` | Install all skills |

#### Prompts
| Command | Description |
|---------|-------------|
| `just codex-prompts-list` | List available prompts |
| `just codex-prompts-install-all` | Install all prompts |

## Reference Docs

Load on-demand when needed:

```
Read ~/repos/claude-knowledge/prompting.md
```

| Doc | When to Load |
|-----|--------------|
| [prompting.md](prompting.md) | Before complex tasks, when stuck |

## Skills

Auto-triggered based on context.

| Skill | Tool | Triggers | Purpose |
|-------|------|----------|---------|
| claude-md | Claude | "CLAUDE.md", "ground rules" | Create/improve CLAUDE.md files |
| agents-md | Codex | "AGENTS.md", "ground rules" | Create/improve AGENTS.md files |

## Slash Commands

Manually invoked with `/command` (Claude) or `/prompts:<name>` (Codex).

| Command | Purpose |
|---------|---------|
| `prompting-tips` | Apply prompting principles to current task |
| `review-claude-md` | Review and improve a CLAUDE.md file |

## Adding New Content

### New Skill (Claude)
1. Create `skills-src/<name>/SKILL.md`
2. Add documentation to `skills/<name>.md`
3. Run `just skill-install <name>`

### New Skill (Codex)
1. Create `codex/skills/<name>/SKILL.md`
2. Run `just codex-skill-install <name>`

### New Command
1. Create `commands/<name>.md` with frontmatter
2. Run `just command-install <name>`
3. Optionally copy to `codex/prompts/<name>.md` for Codex

### New Reference Doc
1. Create `<name>.md` in root
2. Add to table in this README
