---
name: lua-best-practices
description: |-
  Lua 编码规范检查与最佳实践指南。针对 Lua 项目的代码风格检查、常见陷阱识别和规范一致性验证。
  **必须触发场景**：编码工匠写 Lua 代码前（作为风格参考）、品质检查官审查 Lua 代码时（作为规范基准）、用户说"检查这段 Lua 代码的规范性"、"这段代码有没有 Lua 常见坑"、"帮我看看代码风格是否一致"、"这段代码符合最佳实践吗"。
  只要涉及 Lua 代码的质量、风格、陷阱检查就应触发，即使没明确说"规范"或"最佳实践"。
  与 code-review（通用代码审查）区分——lua-best-practices 专注于 Lua 语言特有的规范和陷阱。
---

# Lua 编码规范与最佳实践

在编写或审查 Lua 代码时，自动检查以下维度，确保代码质量。

## 规范优先级

```
1. 同脚本内已有代码风格（最高优先级 — 局部一致性优先）
2. 同类型脚本的编码规范（同目录/模块的通用风格）
3. 项目整体编码惯例（项目级别的约定）
4. 本文档中的通用最佳实践（兜底规则）
```

**核心原则：不引入「第三种写法」** — 如果同一个文件里已经有某种风格，跟着走就行，不要创造新风格。

---

## 检查维度

### 1. 命名规范

**通用规则（如果项目无明确约定）：**
- 变量名：`snake_case`（小写+下划线）
- 函数名：动词开头 `snake_case`，如 `get_player_name()`、`set_config()`
- 私有函数/变量：前缀 `_`，如 `_internal_helper()`
- 模块/类名：`PascalCase`，如 `PlayerManager`、`DataService`
- 常量：`UPPER_SNAKE_CASE`，如 `MAX_PLAYER_COUNT`
- 布尔变量：`is_` / `has_` / `can_` / `should_` 前缀

**检查方法：**
- 读取当前文件中已有命名，确认其风格
- 如果文件使用 `camelCase`，则所有新代码也使用 `camelCase`
- 同一文件中不允许混用命名风格

### 2. 注释规范

**检查点：**
- 与项目已有注释密度保持大致一致
- 如果相邻函数有注释描述参数和返回值 → 新函数也应如此
- 关键逻辑和"反直觉"的写法必须有注释解释原因
- 禁止注释废代码（用 git 管理历史，不要注释掉旧代码留着）

### 3. 错误处理

**必须检查的项：**

| 场景 | 规范 |
|------|------|
| 外部调用的返回值 | 必须检查 `nil` 或 `false` 返回值 |
| 文件/IO 操作 | 必须用 `pcall` 包裹或检查返回值 |
| 数据访问 | `table[key]` 可能返回 `nil`，必须判空 |
| assert 使用 | 仅在"不可能发生"的编程错误时用 assert，不要用于业务校验 |
| 错误信息 | 错误日志应包含足够的上下文（哪个函数、什么参数、什么错误） |

**示例：**
```lua
-- ✅ 好的错误处理
local data = DataService:get_player(id)
if not data then
    log_error("PlayerData not found, id=" .. tostring(id))
    return nil
end

-- ❌ 缺少错误处理
local data = DataService:get_player(id)
local level = data.level  -- data 可能是 nil，这行会报错
```

### 4. Table 操作

**常见陷阱检查：**

```lua
-- ❌ 错误：不要把数组和字典混在同一个 table 里
local t = {[1] = "a", name = "test", [2] = "b"}
-- #t 的行为不可预测，ipairs 和 pairs 结果不一致

-- ✅ 正确：只把 table 当作数组或字典之一
local arr = {"a", "b", "c"}           -- 纯数组，用 ipairs / #
local dict = {name = "test", age = 5} -- 纯字典，用 pairs

-- ❌ 错误：删除数组元素时的 # 陷阱
arr[3] = nil    -- 不推荐，可能产生空洞
-- 后续 #arr 可能返回错误值

-- ✅ 正确：从数组中删除元素
table.remove(arr, 3)  -- 会正确调整索引和长度

-- ❌ 错误：nil 值在 table 中的问题
local t = {a = 1, b = nil, c = 3}
-- "b" 键等同于不存在，pairs 可能不会遍历到

-- ✅ 正确：用 false 代替 nil 表示"无值"
local t = {a = 1, b = false, c = 3}
```

### 5. 性能陷阱

| 陷阱 | 说明 | 解决方案 |
|------|------|---------|
| 全局变量泄漏 | 未声明 `local` 的变量成为全局变量，污染命名空间且访问更慢 | 所有变量必须声明 `local` |
| 字符串拼接循环 | `str = str .. new` 在循环中每次都创建新字符串 | 用 `table.concat()` 收集后拼接 |
| 闭包循环引用 | 循环中创建闭包时变量捕获问题 | 使用 `for i=1,n do local idx=i; ... end` |
| 重复计算 | 循环中反复调用同一个结果相同的函数 | 提取到循环外 |
| table 预分配 | 大量插入时 table 频繁 rehash | 大 table 用预设容量：`local t = {}` → `for i=1,n do t[#t+1]=x end` |

### 6. 模块化

**检查点：**
- 是否在文件顶部集中声明 `require` 依赖？
- 是否污染了全局命名空间（通过 `_G` 或未声明的全局变量）？
- 模块是否返回明确的公共接口 table？
- 依赖关系是否形成循环 `require`？

**标准模块格式参考：**
```lua
-- 文件: player_manager.lua

-- 依赖声明（集中在顶部）
local EventSystem = require("event_system")
local DataService = require("data_service")

-- 模块定义
local PlayerManager = {}

-- 私有变量（模块级）
local _cache = {}

-- 私有函数
local function _validate_id(id)
    return type(id) == "number" and id > 0
end

-- 公共接口
function PlayerManager.get_player(id)
    if not _validate_id(id) then return nil end
    -- ...
end

-- 返回公共接口
return PlayerManager
```

### 7. 其他常见陷阱

```
⚠️ 数组索引从 1 开始（不是 0）
⚠️ 浮点数比较用差值判断而不是 ==（如 math.abs(a-b) < 0.0001）
⚠️ ipairs 遇到 nil 值会停止（即使后面还有元素）
⚠️ table 作为字典 key 时是按引用比较的
⚠️ metatable 的 __index 可能产生隐蔽的 nil 返回
⚠️ coroutine 中的错误可能不会传播到调用方
```

---

## 输出格式

当作为审查工具时，输出格式：

```markdown
# Lua 规范检查报告

## 风格匹配
- 参考文件：`path/to/existing.lua`
- 检测到的项目风格：[snake_case / camelCase / PascalCase]
- 新代码匹配度：XX%

## 问题清单

### [命名] 
1. xxx.lua 第 XX 行：变量 `playerName` 应改为 `player_name`（与同文件第 15 行风格不一致）

### [错误处理]
2. xxx.lua 第 YY 行：`get_data()` 返回值未判空，如果返回 nil 会导致第 YY+1 行报错

### [Table]
3. xxx.lua 第 ZZ 行：table 混用数组和字典，建议拆分

### [性能]
4. xxx.lua 第 WW 行：循环内字符串拼接，建议改用 `table.concat()`

## 建议
- 优先修复 [错误处理] 类问题（可能导致运行时崩溃）
- [命名] 类问题影响可维护性，建议在编码阶段就保持一致
```

---

## 注意事项

- 规范检查**不是吹毛求疵**——只标记真正影响正确性、一致性、可维护性的问题
- 如果项目本身有代码规范文档（如 `.lua-format`、`STYLE.md`），以项目文档为准
- `local` 缺失是**严重问题**（污染全局），注释不足是**一般问题**
- 检查时始终参考"规范优先级"——项目风格 > 通用规则
