#!/usr/bin/env bash
# ==================================================
# LS 开发部门 — 一键安装脚本
# 仓库: https://github.com/hanser-05-V/Ls_Claude_Agents
# ==================================================

set -e

CLAUDE_DIR="$HOME/.claude"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo ""
echo "╔══════════════════════════════════════════════╗"
echo "║          LS 开发部门 v3.0 安装程序            ║"
echo "╚══════════════════════════════════════════════╝"
echo ""

# ── Step 1: Check directory ──
if [ ! -d "$SCRIPT_DIR/agents" ] || [ ! -d "$SCRIPT_DIR/skills" ]; then
  echo "❌ 未找到 agents/ 或 skills/ 目录"
  echo "   请确保从仓库根目录运行此脚本"
  exit 1
fi

# ── Step 2: Create target directories ──
mkdir -p "$CLAUDE_DIR/agents"
mkdir -p "$CLAUDE_DIR/skills"
echo "✅ 目标目录已就绪: $CLAUDE_DIR/agents/"

# ── Step 3: Copy agents ──
echo ""
echo "📋 安装 Agent 配置..."
cp -v "$SCRIPT_DIR/agents/"*.md "$CLAUDE_DIR/agents/"
echo "✅ 7 个 Agent 已安装"

# ── Step 4: Copy skills ──
echo ""
echo "📋 安装 技能文件..."
for skill_dir in "$SCRIPT_DIR/skills/"*/; do
  skill_name=$(basename "$skill_dir")
  mkdir -p "$CLAUDE_DIR/skills/$skill_name"
  cp -v "$skill_dir"SKILL.md "$CLAUDE_DIR/skills/$skill_name/"
done
echo "✅ 技能已安装"

# ── Step 5: Session root path ──
echo ""
echo "╔══════════════════════════════════════════════╗"
echo "║  请配置会话记录根目录                         ║"
echo "║  (部门工作日志存放位置)                       ║"
echo "╚══════════════════════════════════════════════╝"
echo ""
read -p "会话记录根目录路径 (如 E:/LS_Claude_Agents): " SESSION_ROOT

if [ -n "$SESSION_ROOT" ]; then
  mkdir -p "$CLAUDE_DIR/agents/"
  cat > "$CLAUDE_DIR/agents/ls-config.json" <<EOF
{
  "version": "3.0",
  "LS_AGENTS_ROOT": "$SESSION_ROOT",
  "installed_at": "$(date -Iseconds 2>/dev/null || date)"
}
EOF
  echo "✅ 会话根目录已配置: $SESSION_ROOT"
else
  echo "⚠️  跳过会话根目录配置（可在 ~/.claude/agents/ls-config.json 手动设置）"
fi

# ── Step 6: Model setup notice ──
echo ""
echo "╔══════════════════════════════════════════════╗"
echo "║  ⚠️  下一步：配置模型                          ║"
echo "║                                              ║"
echo "║  每个 Agent 文件中有模型配置段，需手工编辑:     ║"
echo "║                                              ║"
echo "║  ls-chief-coordinator.md   (主脑)            ║"
echo "║  ls-assistant.md           (小爱)            ║"
echo "║  ls-architect.md           (架构导师)         ║"
echo "║  ls-bug-detective.md       (Bug侦探)         ║"
echo "║  ls-code-craftsman.md      (编码工匠)         ║"
echo "║  ls-quality-inspector.md   (品质检查官)       ║"
echo "║  ls-document-scribe.md     (文档书记)         ║"
echo "║                                              ║"
echo "║  找到每个文件中的 '当前设备模型' 字段进行修改   ║"
echo "╚══════════════════════════════════════════════╝"
echo ""

echo "🎉 LS 开发部门安装完成！"
echo ""
echo "   启动方式: 在任意工作目录输入 Ls"
echo ""
