# Claude Knowledge Base - Installation Recipes

# Default: show available recipes
default:
    @just --list

# ─────────────────────────────────────────────────────────────
# Status
# ─────────────────────────────────────────────────────────────

# Show what's installed vs available
status:
    #!/usr/bin/env bash
    echo "=== Skills ==="
    echo "Available in repo:"
    ls -1 skills-src/ 2>/dev/null || echo "  (none)"
    echo ""
    echo "Installed in ~/.claude/skills/:"
    ls -1 ~/.claude/skills/ 2>/dev/null || echo "  (none)"
    echo ""
    echo "=== Commands ==="
    echo "Available in repo:"
    for f in commands/*.md; do [ -e "$f" ] && basename "$f" .md; done 2>/dev/null || echo "  (none)"
    echo ""
    echo "Installed in ~/.claude/commands/:"
    for f in ~/.claude/commands/*.md; do [ -e "$f" ] && basename "$f" .md; done 2>/dev/null || echo "  (none)"
    echo ""
    echo "=== Agents ==="
    echo "Available in repo:"
    for f in agents/*.md; do [ -e "$f" ] && basename "$f" .md; done 2>/dev/null || echo "  (none)"
    echo ""
    echo "Installed in ~/.claude/agents/:"
    for f in ~/.claude/agents/*.md; do [ -e "$f" ] && basename "$f" .md; done 2>/dev/null || echo "  (none)"

# ─────────────────────────────────────────────────────────────
# Skills
# ─────────────────────────────────────────────────────────────

# List available skills
skills-list:
    @ls -1 skills-src/

# Install a specific skill (symlink)
skill-install name:
    #!/usr/bin/env bash
    mkdir -p ~/.claude/skills
    if [ -d "skills-src/{{name}}" ]; then
        ln -sfn "$(pwd)/skills-src/{{name}}" ~/.claude/skills/{{name}}
        echo "✓ Installed skill: {{name}}"
    else
        echo "✗ Skill not found: {{name}}"
        exit 1
    fi

# Install all skills
skills-install-all:
    #!/usr/bin/env bash
    mkdir -p ~/.claude/skills
    for skill in skills-src/*/; do
        name=$(basename "$skill")
        ln -sfn "$(pwd)/skills-src/$name" ~/.claude/skills/$name
        echo "✓ Installed skill: $name"
    done

# Uninstall a specific skill
skill-uninstall name:
    @rm -f ~/.claude/skills/{{name}}
    @echo "✓ Uninstalled skill: {{name}}"

# Uninstall all skills from this repo
skills-uninstall-all:
    #!/usr/bin/env bash
    for skill in skills-src/*/; do
        name=$(basename "$skill")
        rm -f ~/.claude/skills/$name
        echo "✓ Uninstalled skill: $name"
    done

# ─────────────────────────────────────────────────────────────
# Commands (Slash Commands)
# ─────────────────────────────────────────────────────────────

# List available commands
commands-list:
    #!/usr/bin/env bash
    for f in commands/*.md; do basename "$f" .md; done

# Install a specific command (symlink)
command-install name:
    #!/usr/bin/env bash
    mkdir -p ~/.claude/commands
    if [ -f "commands/{{name}}.md" ]; then
        ln -sfn "$(pwd)/commands/{{name}}.md" ~/.claude/commands/{{name}}.md
        echo "✓ Installed command: /{{name}}"
    else
        echo "✗ Command not found: {{name}}"
        exit 1
    fi

# Install all commands
commands-install-all:
    #!/usr/bin/env bash
    mkdir -p ~/.claude/commands
    for cmd in commands/*.md; do
        name=$(basename "$cmd" .md)
        ln -sfn "$(pwd)/$cmd" ~/.claude/commands/$name.md
        echo "✓ Installed command: /$name"
    done

# Uninstall a specific command
command-uninstall name:
    @rm -f ~/.claude/commands/{{name}}.md
    @echo "✓ Uninstalled command: /{{name}}"

# Uninstall all commands from this repo
commands-uninstall-all:
    #!/usr/bin/env bash
    for cmd in commands/*.md; do
        name=$(basename "$cmd" .md)
        rm -f ~/.claude/commands/$name.md
        echo "✓ Uninstalled command: /$name"
    done

# ─────────────────────────────────────────────────────────────
# Agents (Custom Subagents)
# ─────────────────────────────────────────────────────────────

# List available agents
agents-list:
    #!/usr/bin/env bash
    for f in agents/*.md; do [ -e "$f" ] && basename "$f" .md; done 2>/dev/null || echo "  (none)"

# Install a specific agent (symlink)
agent-install name:
    #!/usr/bin/env bash
    mkdir -p ~/.claude/agents
    if [ -f "agents/{{name}}.md" ]; then
        ln -sfn "$(pwd)/agents/{{name}}.md" ~/.claude/agents/{{name}}.md
        echo "✓ Installed agent: {{name}}"
    else
        echo "✗ Agent not found: {{name}}"
        exit 1
    fi

# Install all agents
agents-install-all:
    #!/usr/bin/env bash
    mkdir -p ~/.claude/agents
    for agent in agents/*.md; do
        [ -e "$agent" ] || continue
        name=$(basename "$agent" .md)
        ln -sfn "$(pwd)/$agent" ~/.claude/agents/$name.md
        echo "✓ Installed agent: $name"
    done

# Uninstall a specific agent
agent-uninstall name:
    @rm -f ~/.claude/agents/{{name}}.md
    @echo "✓ Uninstalled agent: {{name}}"

# Uninstall all agents from this repo
agents-uninstall-all:
    #!/usr/bin/env bash
    for agent in agents/*.md; do
        [ -e "$agent" ] || continue
        name=$(basename "$agent" .md)
        rm -f ~/.claude/agents/$name.md
        echo "✓ Uninstalled agent: $name"
    done

# ─────────────────────────────────────────────────────────────
# All
# ─────────────────────────────────────────────────────────────

# Install everything (skills + commands + agents)
install-all: skills-install-all commands-install-all agents-install-all
    @echo ""
    @echo "✓ All skills, commands, and agents installed"

# Uninstall everything
uninstall-all: skills-uninstall-all commands-uninstall-all agents-uninstall-all
    @echo ""
    @echo "✓ All skills, commands, and agents uninstalled"

# Reinstall everything (useful after updates)
reinstall: uninstall-all install-all
