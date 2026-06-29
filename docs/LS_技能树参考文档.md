# LS 技能树参考文档

> 生成时间: 2026-06-29 | 总技能数: 64 | 已安装: 17 (via Superpowers) + 3 (用户自装) + 17 (Anthropic市场) + 1 (Vercel市场)  
> 安装方式: `/plugin install superpowers@superpowers-marketplace` + `/plugin install claude-hud@claude-hud`

---

## 📁 完整技能树

```
LS 技能树 (64 skills)
│
├── 📋 01-需求与设计 ─────────────────────────────────────────────
│   ├── brainstorming              ✅ 已安装  创意功能设计，对话式探索需求
│   │   场景: 做新功能/组件/行为变更前 → 必须先调用此技能探索设计
│   │   禁用: 纯机械任务无设计决策时
│   │
│   ├── deep-interview             ✅ 已安装  模糊需求澄清，苏格拉底式追问
│   │   场景: 用户需求模糊不清 → 逐步追问目标/范围/约束/完成标准
│   │   禁用: 需求已经明确清晰时
│   │
│   ├── ultraplan                  ✅ 已安装  多阶段深度实现规划
│   │   场景: 需要完整规划的大型实现任务 → 并行Agent探索+迭代访谈+结构化输出
│   │   禁用: 单步简单任务
│   │
│   └── writing-plans              ✅ 已安装  多步任务计划，2-5分钟/步
│       场景: 有明确需求但步骤多 → 拆解为精确的文件路径+代码+预期输出
│       禁用: 单步简单改动
│
├── 💻 02-编码与实现 ─────────────────────────────────────────────
│   ├── test-driven-development    ✅ 已安装  红-绿-重构，写测试→写代码
│   │   场景: 新功能/修Bug/重构 → 先写失败测试再写代码（铁律级）
│   │   禁用: 一次性原型/配置文件的改动（需用户明确豁免）
│   │
│   ├── subagent-driven-dev        ✅ 已安装  并行子代理执行规划
│   │   场景: 有实现规划且任务基本独立 → 每任务一个子代理+两阶段审查
│   │   禁用: 任务紧密耦合/有共享状态
│   │
│   ├── executing-plans            ✅ 已安装  串行执行规划+检查点
│   │   场景: 有规划的独立会话执行，带人工审查检查点
│   │   禁用: 可用子代理时优先用 subagent-driven-dev
│   │
│   ├── dispatching-parallel-agents ✅ 已安装  独立失败并行排查
│   │   场景: 3+不相干的测试失败/子系统同时出问题
│   │   禁用: 失败可能有共同根因/共享状态
│   │
│   └── using-git-worktrees        ✅ 已安装  隔离工作区
│       场景: 大规模改动需要独立空间时
│       禁用: 当前已在隔离工作区
│
├── 🔍 03-调试与排查 ─────────────────────────────────────────────
│   ├── systematic-debugging       ✅ 已安装  四阶段结构化调试
│   │   场景: 任何Bug/测试失败/异常行为 → 先找根因再修（铁律级）
│   │   禁用: 永远不能跳过，即使是"简单的"Bug
│   │
│   └── verification-before-completion ✅ 已安装  完成前强制验证
│       场景: 声称完成/修好/通过之前 → 必须运行命令读取输出确认
│       禁用: 永远是最后一道闸
│
├── 👀 04-代码审查 ──────────────────────────────────────────────
│   ├── requesting-code-review     ✅ 已安装  提交代码审查
│   │   场景: 每次完成编码后/主要功能/合并前/卡住时
│   │   禁用: 不要因为"简单"而跳过
│   │
│   ├── receiving-code-review      ✅ 已安装  处理审查反馈
│   │   场景: 收到代码审查反馈 → 验证后再改，不许敷衍
│   │   禁用: —
│   │
│   ├── code-review                ✅ 已安装  Diff审查(bug+简化+效率)
│   │   场景: 检查当前diff的正确性/复用/简化
│   │   禁用: —
│   │
│   └── simplify                   ✅ 已安装  代码简化重构(只看质量)
│       场景: 发现冗余/可简化代码时
│       禁用: 不作bug检测
│
├── 🏗️ 05-架构与框架 ─────────────────────────────────────────────
│   ├── 🆕 framework-deep-dive      ⏳ 待创建  框架源码深度分析
│   │   场景: 需要逐层解读框架设计模式/源码架构
│   │
│   └── 🆕 architecture-review     ⏳ 待创建  架构方案评审
│       场景: 多维度评估架构方案/新模块设计
│
├── 📝 06-文档与笔记 ─────────────────────────────────────────────
│   ├── write-note                 ✅ 已安装  项目笔记/框架笔记(❌/✅对照+SVG)
│   │   场景: 用户说"记笔记/做笔记/记录/整理" → 项目学习笔记或框架笔记
│   │   禁用: 非上述两种笔记类型
│   │
│   ├── doc-coauthoring            ✅ 已安装  技术文档协作
│   │   场景: 写技术提案/技术规范/决策文档
│   │   禁用: 简单笔记/非结构化写作
│   │
│   ├── docx                       ✅ 已安装  Word文档操作
│   │   场景: 任何.docx/Word文件操作(read/write/edit)
│   │
│   ├── pdf                        ✅ 已安装  PDF操作(读/合并/拆分/OCR)
│   │   场景: 任何.pdf文件操作
│   │
│   └── pptx                       ✅ 已安装  幻灯片操作
│       场景: 任何.pptx/幻灯片/演示文稿
│
├── 📊 07-可视化与图表 ──────────────────────────────────────────
│   ├── multi-chart-draw-skills    ✅ 已安装  思维导图/流程图/数据图
│   │   场景: 画图/绘制图表/生成流程图/架构图
│   │
│   ├── frontend-design            ✅ 已安装  生产级Web界面
│   │   场景: 构建网页/组件/仪表盘/着陆页
│   │   禁用: 纯后端任务
│   │
│   ├── canvas-design              ✅ 已安装  海报/静态设计(PNG/PDF)
│   │   场景: 制作海报/艺术作品/设计
│   │
│   ├── algorithmic-art            ✅ 已安装  生成艺术(p5.js/粒子/流场)
│   │   场景: 用代码创作艺术
│   │
│   ├── web-artifacts-builder      ✅ 已安装  复杂React/Tailwind/shadcn组件
│   │   场景: 需要状态管理/路由/shadcn的复杂Artifact
│   │
│   └── slack-gif-creator          ✅ 已安装  Slack动画GIF
│       场景: 为Slack制作GIF
│
├── 📖 08-框架学习 (待建) ──────────────────────────────────────
│   └── 🆕 framework-source-reader   与 framework-deep-dive 合并
│
├── 🧪 09-Lua专项 (待建) ──────────────────────────────────────
│   └── 🆕 lua-best-practices      ⏳ 待创建  Lua编码规范+性能最佳实践
│       场景: 编码工匠写代码前自动参考 / 审查官检查规范一致性
│
├── 🔧 10-工具与配置 ────────────────────────────────────────────
│   ├── skill-creator              ✅ 已安装  (Anthropic版) 创建/优化/评测技能
│   │   场景: 创建新技能/修改技能/跑评测
│   │   注意: plugin版(同名)为备选，统一用此版本
│   │
│   ├── find-skills                ✅ 已安装  (Vercel版) 发现安装新技能
│   │   场景: "how do I X" / "有没有技能可以Y"
│   │   注意: superpowers版为备选，优先用Vercel版(有CLI)
│   │
│   ├── update-config              ✅ 已安装  管理settings.json
│   │   场景: 配置权限/环境变量/hooks
│   │
│   ├── keybindings-help           ✅ 已安装  快捷键定制
│   │   场景: 自定义键盘快捷键
│   │
│   ├── fewer-permission-prompts   ✅ 已安装  减少权限弹窗
│   │   场景: 分析常用命令→加入白名单
│   │
│   ├── loop                       ✅ 已安装  循环执行
│   │   场景: 设置周期性任务
│   │
│   └── using-superpowers          ✅ 已安装  技能使用元规则（会话级铁律）
│       场景: 每个对话开始时 → 确保有技能就调用
│
├── 🌐 11-浏览器与外部服务 ──────────────────────────────────────
│   ├── chrome-devtools-mcp        ✅ 已安装  浏览器控制(性能/网络/自动化)
│   │   场景: 需要控制真实浏览器/录制性能/网络抓包
│   │
│   ├── claude-api                 ✅ 已安装  Claude API/SDK参考
│   │   场景: 代码import了anthropic/问模型/定价/缓存/token
│   │
│   └── webapp-testing             ✅ 已安装  Playwright Web测试
│       场景: 测试本地Web应用 → 截图/调试UI/查看浏览器日志
│
└── 🎨 12-品牌与视觉 (Anthropic/Adobe) ─────────────────────────
    ├── brand-guidelines           ✅ 已安装  Anthropic品牌色/字体
    ├── theme-factory              ✅ 已安装  10套预设主题
    ├── internal-comms             ✅ 已安装  内部通讯(状态报告/Newsletter)
    ├── adobe-for-creativity       ✅ 已安装  Adobe创意工具(AI编辑图片/矢量化)
    ├── canva                      ✅ 已安装  Canva设计
    ├── build-mcp-app              ✅ 已安装  构建MCP交互UI
    ├── playground                 ✅ 已安装  交互式HTML演示
    └── project-artifact           ✅ 已安装  项目状态页发布到claude.ai
```

---

## ⚠️ 冲突 Skill 对照表

| 冲突对 | 主用版本 | 弃用版本 | 原因 |
|--------|---------|---------|------|
| `skill-creator` | Anthropic市场版 | Claude-Plugins-Official版 | Anthropic版更完整(有benchmark+评测) |
| `find-skills` | Vercel市场版 | Superpowers市场版 | Vercel版有CLI能力(`npx skills`) |
| `frontend-design` | Anthropic市场版 | Claude-Plugins-Official版 | Anthropic版更全面 |

---

## 👥 Agent → 技能映射表

| 技能 | 🧠主脑 | 🦉架构 | 🔍Bug侦探 | ✏️编码 | 👀审查 | 📝文档 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|
| `brainstorming` | | ✅ | | | | |
| `deep-interview` | | ✅ | | | | |
| `ultraplan` | ✅ | | | | | |
| `writing-plans` | | | | ✅ | | |
| `tdd` | | | | ✅ | | |
| `subagent-driven-dev` | | | | ✅ | | |
| `dispatching-parallel` | ✅ | | | | | |
| `using-git-worktrees` | | | | ✅ | | |
| `systematic-debugging` | | | ✅ | | | |
| `verification-before-completion` | | | ✅ | | ✅ | |
| `requesting-code-review` | | | | | ✅ | |
| `receiving-code-review` | | | | | ✅ | |
| `code-review` | | | ✅ | | ✅ | |
| `simplify` | | | | | ✅ | |
| `verify` | | | | | ✅ | |
| `write-note` | | | | | | ✅ |
| `doc-coauthoring` | | | | | | ✅ |
| `multi-chart-draw-skills` | | ✅ | | | | ✅ |
| `docx/pdf/pptx/xlsx` | | | | | | ✅ |
| `skill-creator` | ✅ | | | | | |
| `find-skills` | ✅ | | | | | |
| `update-config` | ✅ | | | | | |
| `using-superpowers` | ✅ | | | | | |
| 🆕 `framework-deep-dive` | | ⏳ | | | | |
| 🆕 `architecture-review` | | ⏳ | | | | |
| 🆕 `lua-best-practices` | | | | ⏳ | | |

---

## ⭐ 技能使用优先级规则

```
1. 铁律级（不可跳过）
   ├── using-superpowers      → 每次对话开始
   ├── test-driven-development → 任何改动代码前
   ├── systematic-debugging    → 任何Bug排查前
   └── verification-before-completion → 任何"完成"声明前

2. 设计级（有设计决策时必须）
   ├── brainstorming           → 创作性工作前
   └── deep-interview          → 需求模糊时

3. 工具级（按需使用）
   └── 其余所有技能
```

---

> 版本: v1.0 | 状态: 3个待建技能 (`framework-deep-dive`, `architecture-review`, `lua-best-practices`)
