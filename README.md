# 🏢 LS 开发部门 — Claude Code 六Agent协作体系

> 版本: v3.0 | 创建: 2026-06-29 | 作者: hanser-05-V

---

## 这是什么

LS 开发部门是一套**全局通用的 Claude Code Agent 协作体系**，包含 7 个角色：

```
                  👑 帅老大 (你)
                 /            \
        🧠 主脑统筹            💜 小爱助理
        (任务分发/并行调度)     (杂务/监控/协调)
        /    |    |    \    \
     🦉架构 🔍Bug ✏️编码 👀审查 📝文档
```

### 部门成员

| 角色 | 文件 | 职责 |
|------|------|------|
| 🧠 主脑统筹 | `agents/ls-chief-coordinator.md` | 任务分发、并行调度、进度追踪 |
| 💜 小爱助理 | `agents/ls-assistant.md` | 杂物处理、崩溃监控、进度查阅 |
| 🦉 架构导师 | `agents/ls-architect.md` | 框架学习、架构设计、面试检查 |
| 🔍 Bug侦探 | `agents/ls-bug-detective.md` | Bug定位、根因分析 |
| ✏️ 编码工匠 | `agents/ls-code-craftsman.md` | 代码编写、规范匹配 |
| 👀 品质检查官 | `agents/ls-quality-inspector.md` | 代码审查、经验沉淀 |
| 📝 文档书记 | `agents/ls-document-scribe.md` | 笔记文档、沟通监督 |

---

## 快速安装（新设备）

### 方式一：一键安装（推荐）

```bash
# 1. 克隆仓库
git clone https://github.com/hanser-05-V/Ls_Claude_Agents.git /tmp/ls-agents

# 2. 运行安装脚本（交互式）
bash /tmp/ls-agents/install.sh
```

### 方式二：手动安装

```bash
# 1. 克隆仓库
git clone https://github.com/hanser-05-V/Ls_Claude_Agents.git /tmp/ls-agents

# 2. 复制 Agent 配置到全局目录
cp -r /tmp/ls-agents/agents/* ~/.claude/agents/

# 3. 复制技能文件
cp -r /tmp/ls-agents/skills/* ~/.claude/skills/

# 4. 配置模型（编辑每个 Agent 文件中的模型名）
# 编辑 ~/.claude/agents/ls-*.md 中的"当前设备模型"字段
```

---

## 模型配置

每个 Agent 文件中包含模型配置段，需要填入你当前设备可用的模型：

```markdown
## 模型配置

| 项目 | 值 |
|------|-----|
| 当前设备模型 | `你的模型名` |    ← 改这里
| 提供商 | 你的提供商 |          ← 改这里
| 推理强度 | `max` |
```

### 当前设备模型分配（参考）

| 主管 | 推荐模型 | 原因 |
|------|---------|------|
| 🧠 主脑 | 强推理模型 | 任务调度需要深度理解 |
| 💜 小爱 | 强推理模型 | 杂务处理+监控需要理解力 |
| 🦉 架构导师 | 强推理模型 | 框架分析需要深度推理 |
| 🔍 Bug侦探 | 强推理模型 | 代码推理不能有遗漏 |
| ✏️ 编码工匠 | 长上下文模型 | 多文件生成+规范匹配 |
| 👀 品质检查官 | 长上下文模型 | 多文件审查+副作用分析 |
| 📝 文档书记 | 标准模型即可 | 文档整理推理要求低 |

---

## 使用方式

### 启动部门

在任意工作目录输入：

```
Ls
```

主脑到岗后会说："LS 开发部门已到岗。帅老大，请下达任务。"

### 派活

```
帅老大："帮我排查 login.lua 闪退"
       → 主脑判断 → 派给🔍Bug侦探 → 后台执行 → 完成通知
```

### @ 直接指派

```
帅老大："@架构导师 解释一下这个模块的设计"
帅老大："@小爱 各部门进度汇报"
帅老大："@文档书记 记录这个知识点"
```

### 关闭部门

```
关闭部门
```

---

## 会话记录

每次启动自动创建：

```
E:\LS_Claude_Agents\{工作目录}_{启动时间}\
├── 主脑_任务台账.md
├── 沉淀工作文档.md
├── agent_会话记录/
│   └── 各主管协作记录.md
└── ...
```

> **新设备首次启动时**，系统会询问记录根目录路径。

---

## 铁律

> **任何涉及修改、改动、增删代码或文件的操作，必须先汇报并征得帅老大同意。**

---

## 附带技能

| 技能 | 文件 | 用途 |
|------|------|------|
| Ls 启动入口 | `skills/Ls/SKILL.md` | 部门启动触发词 |
| 框架深度分析 | `skills/framework-deep-dive/SKILL.md` | 架构导师使用 |
| 架构评审 | `skills/architecture-review/SKILL.md` | 架构导师使用 |
| Lua 最佳实践 | `skills/lua-best-practices/SKILL.md` | 编码工匠使用 |

---

## 文件结构

```
Ls_Claude_Agents/
├── README.md                  ← 本文件
├── install.sh                 ← 一键安装脚本
├── agents/                    ← Agent 配置文件（复制到 ~/.claude/agents/）
│   ├── ls-chief-coordinator.md
│   ├── ls-assistant.md
│   ├── ls-architect.md
│   ├── ls-bug-detective.md
│   ├── ls-code-craftsman.md
│   ├── ls-quality-inspector.md
│   └── ls-document-scribe.md
├── skills/                    ← 技能文件（复制到 ~/.claude/skills/）
│   ├── Ls/
│   │   └── SKILL.md
│   ├── framework-deep-dive/
│   │   └── SKILL.md
│   ├── architecture-review/
│   │   └── SKILL.md
│   └── lua-best-practices/
│       └── SKILL.md
└── docs/
    └── LS_技能树参考文档.md    ← 全部 64 个技能分类树
```

---

## 自定义修改

1. **增减主管**：在 `agents/` 下添加/删除 `.md` 文件
2. **修改职责**：编辑对应 Agent 的 `.md` 文件
3. **调整技能**：修改 Agent 文件中的"技能分配"表格
4. **添加新技能**：在 `skills/` 下创建新目录和 `SKILL.md`

修改后重新 `cp` 到 `~/.claude/agents/` 或 `~/.claude/skills/` 即可生效。

---

> "代码是给人看的，顺便给机器执行。" — LS 开发部门座右铭
