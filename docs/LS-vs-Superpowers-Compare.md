# LS v2.0 vs Superpowers — Comparison

> Analysis date: 2026-06-29
> Updated: 2026-06-29 17:45

---

## 1. Shared Principles

| Dimension | Both Systems |
|-----------|-------------|
| Sub-agent context isolation | ✅ Construct self-contained prompts only |
| Fresh Agent Per Task | ✅ One agent, one task |
| Reviewer independence | ✅ Never trust implementer's report |
| No direct agent-to-agent comms | ✅ All through controller |
| Escalation protocol | ✅ 4-status system (LS learned from Superpowers) |

---

## 2. Key Differences

| Dimension | Superpowers | LS v2.0 | Better |
|-----------|------------|---------|:--:|
| **Main window discussion** | ❌ None. Controller reads plan → constructs prompt → dispatches | ✅ Role-play in main window. Boss talks directly, zero loss | **LS** |
| **Clarification** | Plan file is pre-written spec. Questions = interrupts | Boss discusses directly in window first, then dispatches | **LS** |
| **Review cycle** | Strict 2-phase: ①Spec agent ②Code quality agent. Both independent sub-agents | 2-phase review is a rule, but **prioritizes main-window role-play** (zero loss) | **Trade-off** |
| **Model tiering** | Clear: mechanical→cheap, integration→standard, architecture→strongest | Same rules written, but constrained by env (all run deepseek-v4-pro) | **Superpowers** |
| **Worktree isolation** | ✅ `using-git-worktrees` for physical isolation | ❌ Not used | **Superpowers** |
| **Continuous execution** | Controller never pauses, executes all tasks one-shot | Controller waits for Boss's instruction at each step | **Philosophy difference** |
| **Plan-driven** | **Must** have `writing-plans` output before execution | Not required, Boss can describe verbally | **Superpowers** |

---

## 3. Fundamental Philosophy

```
Superpowers:
  Human → Write plan → Controller reads plan → Dispatch agents
  Human is outside the loop. For "I know what I want" scenarios.

LS v2.0:
  Boss ↔ Main Brain (same window, same model)
  Boss = Decision maker + Requester
  Brain = Controller + Role-player
  Human is inside the loop. For "figuring it out as we go" scenarios.
```

**LS's main-window role-play is something Superpowers doesn't have at all.**

---

## 4. Full Capability Matrix

| Capability | Superpowers | LS v2.0 | Note |
|-----------|:--:|:--:|------|
| Self-contained Prompt | ✅ | ✅ | Same |
| Fresh Agent Per Task | ✅ | ✅ | Same |
| 2-phase Review | ✅ forced sub-agent | ✅ role-play priority | LS more flexible |
| Escalation Protocol | ✅ | ✅ | LS learned from SP |
| Zero-loss discussion | ❌ | ✅ | **LS unique** |
| Plan-driven | ✅ forced | ❌ optional | SP more rigorous |
| Worktree isolation | ✅ | ❌ | SP unique |
| Model tiering (real) | ✅ | ❌ paper rule | Environment constraint |
| Multi-agent parallel | ✅ | ❌ untested | Theory supported |
| Auto continuous exec | ✅ | ❌ | Philosophy diff |

---

## 5. Recommended Usage Strategy

| Scenario | Use | Why |
|----------|-----|-----|
| Learning framework / Architecture discussion | **LS** role-play | Zero loss, real-time discussion |
| Bug root cause investigation | **LS** role-play | Needs deep understanding |
| New feature (requirements clear) | **Superpowers** writing-plans → subagent-driven | Automated execution |
| New feature (requirements unclear) | **LS** first discuss → SP execute | Divide & conquer |
| Code (simple task) | **LS** sub-agent self-contained | Good enough |
| Code (complex task) | **Superpowers** TDD + 2-phase review | Quality guarantee |
| Multi-task parallel | **Superpowers** dispatching-parallel-agents | Parallel speed |
| Code review | **LS** role-play more precise | Zero loss intent understanding |
