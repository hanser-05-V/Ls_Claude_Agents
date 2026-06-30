# LS + Matt Pocock + Superpowers — Skill Trigger Quick Reference

> Date: 2026-06-29

---

## 1. LS Department — Trigger Methods

### Startup

| Method | Command |
|--------|---------|
| Start LS | `Ls` or `/Ls` (any directory) |
| Direct call | `@Architect` / `@BugHunter` / `@Craftsman` / `@Inspector` / `@Scribe` / `@Assistant` |

### 7 Members

| Member | @ Alias | Role | Mode |
|--------|:--:|------|:--:|
| 🧠 Main Brain | — | Task dispatch, task wall, auto-progression | Auto |
| 💜 Assistant | `@小爱` | Chores/monitoring/memory compliance | Role-play |
| 🦉 Architect | `@架构导师` | Framework learning, design, architecture | Role-play |
| 🔍 Bug Hunter | `@Bug侦探` | Bug root cause investigation | Role-play |
| ✏️ Craftsman | `@编码工匠` | Write code | Sub-agent |
| 👀 Inspector | `@审查官` | Code review + failure alchemy | Role-play |
| 📝 Scribe | `@文档书记` | Notes/memory maintenance | Role-play |

---

## 2. Matt Pocock Skills — Trigger Reference

### Engineering (14 skills)

| Skill | Trigger Example | Invoke |
|-------|----------------|:--:|
| `implement` | "implement this spec" | User |
| `tdd` | "use TDD" / "test-driven" | Model |
| `triage` | "triage this issue" | User |
| `to-prd` | "generate PRD" / "to-prd" | User |
| `to-issues` | "break into issues" | User |
| `prototype` | "quick prototype" | User |
| `diagnosing-bugs` | "diagnose this bug" | Model |
| `codebase-design` | "design module interface" | Model |
| `domain-modeling` | "domain modeling" | Model |
| `grill-with-docs` | "grill with docs" | User |
| `improve-codebase-architecture` | "improve architecture" | User |
| `ask-matt` | "ask-matt" | User |
| `resolving-merge-conflicts` | "resolve merge conflicts" | Both |
| `setup-matt-pocock-skills` | "setup matt pocock skills" | User |

### Productivity (5 skills)

| Skill | Trigger Example | Invoke |
|-------|----------------|:--:|
| `handoff` | "handoff" | User |
| `grill-me` / `grilling` | "grill me" | User/Model |
| `teach` | "teach me" | User |
| `writing-great-skills` | "writing great skills" | User |

### Misc (4 skills)

| Skill | Trigger Example |
|-------|----------------|
| `git-guardrails-claude-code` | "git guardrails" |
| `migrate-to-shoehorn` | "migrate to shoehorn" |
| `scaffold-exercises` | "scaffold exercises" |
| `setup-pre-commit` | "setup pre-commit" |

**Invoke Types:**
- **User-invoked**: Must type `/skill-name` or exact keyword
- **Model-invoked**: Model auto-detects when context matches

---

## 3. Superpowers Skills — Trigger Reference

| Skill | Trigger Example |
|-------|----------------|
| `writing-plans` | "write a plan" / "/writing-plans" |
| `subagent-driven-development` | "subagent driven" / "/subagent-driven-development" |
| `test-driven-development` | "TDD" / "/test-driven-development" |
| `dispatching-parallel-agents` | "parallel agents" / "/dispatching-parallel-agents" |
| `requesting-code-review` | "code review" / "/requesting-code-review" |
| `brainstorming` | "brainstorm" / "/brainstorming" |
| `systematic-debugging` | "systematic debug" / "/systematic-debugging" |
| `executing-plans` | "executing plans" |
| `verification-before-completion` | "verify before completion" |
| `finishing-a-development-branch` | "finishing branch" |

---

## 4. Mixed Usage Scenarios

### Scenario A: Bug Fix

```
1. @Bug侦探 investigate (LS role-play, zero loss)
2. "diagnosing-bugs" diagnosis loop (Matt Pocock)
3. @编码工匠 fix code (LS sub-agent self-contained)
4. /requesting-code-review 2-phase review (Superpowers)
```

### Scenario B: New Feature

```
1. @架构导师 discuss design (LS role-play)
2. /writing-plans generate plan (Superpowers)
3. /subagent-driven-development execute (SP + LS handoff files)
4. @审查官 final review (LS role-play)
```

### Scenario C: Framework Study

```
1. @架构导师 teach (LS role-play)
2. framework-deep-dive deep analysis (LS Skill)
3. @文档书记 write notes (LS role-play)
4. /write-note standardized generation (LS Skill)
```

---

## 5. Quick Reference Card

| You want to | Say this |
|-------------|---------|
| Investigate bug | `@Bug侦探` |
| Learn framework design | `@架构导师` |
| Write code | `@编码工匠` or `/implement` |
| Code review | `@审查官` or `/requesting-code-review` |
| Write notes | `@文档书记` |
| Write execution plan | `/writing-plans` |
| Auto-execute via sub-agents | `/subagent-driven-development` |
| Systematic debugging | `diagnosing-bugs` or `/systematic-debugging` |
| TDD development | `tdd` or `/test-driven-development` |
| Break into issues | `/to-issues` |
| Generate PRD | `/to-prd` |
| Handoff conversation | `handoff` |
| Parallel multi-task | `/dispatching-parallel-agents` |
| Brainstorm design | `/brainstorming` |
| Domain modeling | `domain-modeling` |
