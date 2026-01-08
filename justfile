# Claude Knowledge Base - Installation Recipes

set shell := ["bash", "-cu"]

# Default: show available recipes
default:
    @just --list

# ─────────────────────────────────────────────────────────────
# Status
# ─────────────────────────────────────────────────────────────

# Show what's installed vs available
status:
    @echo "=== Skills ==="
    @echo "Available in repo:"
    @ls -1 skills-src/ 2>/dev/null || echo "  (none)"
    @echo ""
    @echo "Installed in ~/.claude/skills/:"
    @ls -1 ~/.claude/skills/ 2>/dev/null || echo "  (none)"
    @echo ""
    @echo "=== Commands ==="
    @echo "Available in repo:"
    @ls -1 commands/*.md 2>/dev/null | xargs -I{} basename {} .md || echo "  (none)"
    @echo ""
    @echo "Installed in ~/.claude/commands/:"
    @ls -1 ~/.claude/commands/*.md 2>/dev/null | xargs -I{} basename {} .md || echo "  (none)"

# ─────────────────────────────────────────────────────────────
# Skills
# ─────────────────────────────────────────────────────────────

# List available skills
skills-list:
    @ls -1 skills-src/

# Install a specific skill (symlink)
skill-install name:
    @mkdir -p ~/.claude/skills
    @if [ -d "skills-src/{{name}}" ]; then \
        ln -sfn "$(pwd)/skills-src/{{name}}" ~/.claude/skills/{{name}}; \
        echo "✓ Installed skill: {{name}}"; \
    else \
        echo "✗ Skill not found: {{name}}"; \
        exit 1; \
    fi

# Install all skills
skills-install-all:
    @mkdir -p ~/.claude/skills
    @for skill in skills-src/*/; do \
        name=$$(basename "$$skill"); \
        ln -sfn "$(pwd)/skills-src/$$name" ~/.claude/skills/$$name; \
        echo "✓ Installed skill: $$name"; \
    done

# Uninstall a specific skill
skill-uninstall name:
    @rm -f ~/.claude/skills/{{name}}
    @echo "✓ Uninstalled skill: {{name}}"

# Uninstall all skills from this repo
skills-uninstall-all:
    @for skill in skills-src/*/; do \
        name=$$(basename "$$skill"); \
        rm -f ~/.claude/skills/$$name; \
        echo "✓ Uninstalled skill: $$name"; \
    done

# ─────────────────────────────────────────────────────────────
# Commands (Slash Commands)
# ─────────────────────────────────────────────────────────────

# List available commands
commands-list:
    @ls -1 commands/*.md 2>/dev/null | xargs -I{} basename {} .md

# Install a specific command (symlink)
command-install name:
    @mkdir -p ~/.claude/commands
    @if [ -f "commands/{{name}}.md" ]; then \
        ln -sfn "$(pwd)/commands/{{name}}.md" ~/.claude/commands/{{name}}.md; \
        echo "✓ Installed command: /{{name}}"; \
    else \
        echo "✗ Command not found: {{name}}"; \
        exit 1; \
    fi

# Install all commands
commands-install-all:
    @mkdir -p ~/.claude/commands
    @for cmd in commands/*.md; do \
        name=$$(basename "$$cmd" .md); \
        ln -sfn "$(pwd)/$$cmd" ~/.claude/commands/$$name.md; \
        echo "✓ Installed command: /$$name"; \
    done

# Uninstall a specific command
command-uninstall name:
    @rm -f ~/.claude/commands/{{name}}.md
    @echo "✓ Uninstalled command: /{{name}}"

# Uninstall all commands from this repo
commands-uninstall-all:
    @for cmd in commands/*.md; do \
        name=$$(basename "$$cmd" .md); \
        rm -f ~/.claude/commands/$$name.md; \
        echo "✓ Uninstalled command: /$$name"; \
    done

# ─────────────────────────────────────────────────────────────
# All
# ─────────────────────────────────────────────────────────────

# Install everything (skills + commands)
install-all: skills-install-all commands-install-all
    @echo ""
    @echo "✓ All skills and commands installed"

# Uninstall everything
uninstall-all: skills-uninstall-all commands-uninstall-all
    @echo ""
    @echo "✓ All skills and commands uninstalled"

# Reinstall everything (useful after updates)
reinstall: uninstall-all install-all
