# Claude Knowledge Base

Project-agnostic reference docs, skills, and commands for AI-assisted development.

## Quick Start

```bash
cd ~/repos/claude-knowledge

# Install everything
just install-all

# Or install selectively
just skill-install claude-md
just command-install review-claude-md
```

## Structure

```
claude-knowledge/
├── README.md
├── justfile              # Installation recipes
├── prompting.md          # Reference: prompting best practices
├── skills/               # Documentation about skills
│   └── claude-md.md
├── skills-src/           # Actual skill source files
│   └── claude-md/
│       ├── SKILL.md
│       ├── user-guide.md
│       └── project-guide.md
└── commands/             # Slash command source files
    ├── prompting-tips.md
    └── review-claude-md.md
```

## Justfile Commands

| Command | Description |
|---------|-------------|
| `just status` | Show installed vs available |
| `just install-all` | Install all skills + commands |
| `just uninstall-all` | Remove all installed items |
| `just reinstall` | Uninstall then reinstall (after updates) |

### Skills
| Command | Description |
|---------|-------------|
| `just skills-list` | List available skills |
| `just skill-install <name>` | Install one skill |
| `just skills-install-all` | Install all skills |
| `just skill-uninstall <name>` | Uninstall one skill |

### Commands
| Command | Description |
|---------|-------------|
| `just commands-list` | List available commands |
| `just command-install <name>` | Install one command |
| `just commands-install-all` | Install all commands |
| `just command-uninstall <name>` | Uninstall one command |

## Reference Docs

Load on-demand when needed:

```
Read ~/repos/claude-knowledge/prompting.md
```

| Doc | When to Load |
|-----|--------------|
| [prompting.md](prompting.md) | Before complex tasks, when stuck |

## Skills

Auto-triggered by Claude based on context.

| Skill | Triggers | Purpose |
|-------|----------|---------|
| [claude-md](skills/claude-md.md) | "CLAUDE.md", "ground rules" | Create/improve CLAUDE.md files |

## Slash Commands

Manually invoked with `/command`.

| Command | Purpose |
|---------|---------|
| `/prompting-tips` | Apply prompting principles to current task |
| `/review-claude-md` | Review and improve a CLAUDE.md file |

## Adding New Content

### New Skill
1. Create `skills-src/<name>/SKILL.md`
2. Add documentation to `skills/<name>.md`
3. Run `just skill-install <name>`

### New Command
1. Create `commands/<name>.md` with frontmatter
2. Run `just command-install <name>`

### New Reference Doc
1. Create `<name>.md` in root
2. Add to table in this README
