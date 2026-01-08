# Prompting Best Practices

Reference guide for effective AI-assisted development.

---

## The Essential Four

1. **Check alignment** before AI implements
2. **Grant push-back permission** explicitly
3. **Break complex work** into small verified steps
4. **Delete and restart** when iteration fails (attempt 3-4)

---

## Before You Prompt

### Present Problems, Not Solutions
```
Bad:  "Which restaurant should I book?"
Good: "Give me suggestions for team celebration"
```

### Don't Force Fake Structure
```
Bad:  "Give me 5 options for 2+2"
Good: "What approaches exist for X?"
```

### Cast Wide First
- "What alternatives haven't we considered?"
- "Can we simplify this? ...even simpler?"
- "What should I be thinking about?"

---

## Prompting Techniques

### Check Alignment
```
"Tell me what you're going to do before you do it"
"Show me your plan in 3-4 bullets"
"What questions do you have?"
```

### Grant Push-Back
```
- Push back if something seems wrong
- Ask questions if unclear—don't guess
- Tell me if my instructions don't make sense
```

### Reverse Direction
| Instead of... | Try... |
|---------------|--------|
| You explaining | "What questions do you have?" |
| You deciding alone | "Show me a few approaches" |

---

## Managing Context

### Three Tiers
| Tier | Location | When Loaded |
|------|----------|-------------|
| Ground Rules | `CLAUDE.md` | Always |
| Knowledge Docs | `*.md` files | On reset |
| Reference Docs | Task-specific | On demand |

### Context Markers
```
🍀 = ground rules loaded
🔴 = TDD red phase
✅ = committer role
❗️ = flagging error
```

When emoji disappears → context has rotted → reset.

### Combat Context Rot
1. **TODOs** - Explicit checkboxes
2. **Instruction Sandwich** - Repeat critical steps
3. **Strategic Resets** - Fresh context

---

## Iteration Strategies

### Refinement Loop
1. Define goal (simplify, distill, improve)
2. One pass
3. Next pass builds on previous
4. Repeat until nothing to improve

### Feedback Loop
1. Identify success signal (tests, output)
2. Give AI access to signal
3. "Keep iterating until tests pass"

### Feedback Flip
1. AI implements
2. Different AI reviews: "Find problems"
3. Feed critique back to fix

### Happy to Delete
At iteration 3-4 with no improvement:
1. `git reset --hard`
2. Refine prompt with lessons
3. Try fresh

---

## Anti-Patterns

| Pattern | Problem | Fix |
|---------|---------|-----|
| **Silent Misalignment** | AI accepts nonsense | Check alignment + push-back permission |
| **Sunk Cost** | Forcing broken attempts | Delete and restart |
| **Answer Injection** | Limiting AI to your solution | Present problem, not solution |
| **Flying Blind** | No review of AI output | Feedback loops |

---

## Agent Strategy

### Focused > Distracted
One agent for everything = worse at everything.
Dedicated agents for specific tasks win.

### Extract Knowledge
Before resetting:
1. "Save insights to `[file].md`"
2. Review and edit
3. Load into next conversation

---

## Quick Checklist

**Before prompting:**
- [ ] Presenting problem, not solution?
- [ ] Not forcing fake structure?
- [ ] Asked "what aren't we considering?"

**During session:**
- [ ] Checked alignment before implementation?
- [ ] Using TODOs for multi-step work?
- [ ] Recognizing when to reset?

**Quality gates:**
- [ ] Past iteration 3-4 with no improvement?
- [ ] Extracted knowledge before reset?
