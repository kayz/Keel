# keel

keel（龙骨）是 kayz 项目的工程骨架：一个用 [copier](https://copier.readthedocs.io/) 管理的项目模板，
把多个项目试错中沉淀下来的做法变成新项目的默认起点，并且能随着后续试错持续更新到各个项目。

它取代了本仓库原来的 skills（proqaid、opaid、pact、verify、cicd、powershell）。这些 skill 已移到
[`archive/`](archive/README.md)，那里写明了每个 skill 中仍然有价值的内容去了哪里。

## 核心想法

- **约束结果和证据，不约束过程。** 怎么拆任务、是否开子 agent、模块内部怎么写，交给 agent 自己判断。
- **能机械检查的，就不写成文字。** 依赖方向交给架构检查，预期值的独立性交给受保护目录，发布授权交给
  GitHub 的保护规则。
- **四层 spec 由人掌握，实现由 agent 完成。** 意图（`docs/intent.md`）、接口（`contracts/` 和模块入口）、
  验收测试（`tests/rules|properties|flows`）、架构规则（`.dependency-cruiser.cjs` 等）。改动这四层就是
  改动 spec，需要人审核。
- **默认要轻，重的做成可选包。** 骨架一个下午就能跑起来；技术栈包和风险包按需叠加。
- **规则只因真实的失败而增加，并定期删减。**

## 快速开始

需要：PowerShell 7（`pwsh`）、git、[uv](https://docs.astral.sh/uv/)。TypeScript 项目还需要 Node.js 22.12+ 和 pnpm。

```powershell
uv tool install copier
```

新项目：

```powershell
copier copy gh:kayz/keel my-project
cd my-project
git init -b main
pwsh -NoProfile -File scripts/check-fast.ps1
```

接入已有项目（只添加骨架约定，不生成示例代码和包配置）：

```powershell
cd existing-project
git switch -c adopt-keel
copier copy gh:kayz/keel . -d adopt_existing=true
```

接入后需要手动做的事见生成的 `.keel/README.md`，并把项目已有的检查命令接到 `scripts/check.local.ps1`。

更新到 keel 的新版本：

```powershell
copier update
```

`copier update` 会用三方合并把 keel 的改动带进来。`docs/intent.md`、`scripts/check.local.ps1`、
`.dependency-cruiser.cjs`、测试内容和源码在生成后归项目所有，不会被覆盖。

## 生成的项目长什么样

```text
AGENTS.md                  工作方式和不可逆操作的边界（keel 部分 + 项目补充）
docs/intent.md             意图：目标、不做什么、关键决策、验收入口
docs/decisions/            需要时才写的简短 ADR
contracts/                 跨语言契约：OpenAPI / Protobuf / JSON Schema
tests/AGENTS.md            写验收测试的原则
tests/rules/               决策表（受保护）
tests/properties/          不变量（受保护）
tests/flows/               状态机模型（受保护）
tests/characterization/    已有代码的特征测试
tests/e2e/                 少量关键用户路径
scripts/check-fast.ps1     快速检查
scripts/check.ps1          完整检查
scripts/mutation.ps1       变异测试（按需）
scripts/check.local.ps1    项目自己的检查步骤
.keel/                     骨架内部文件，由 keel 管理
.github/CODEOWNERS         受保护路径的审核人
```

## 技术栈包

| 包      | 原型                  | 架构检查           | 属性 / 状态机测试 | 变异测试 |
| ------- | --------------------- | ------------------ | ----------------- | -------- |
| ts-pnpm | Quillarium、coga-core | dependency-cruiser | fast-check        | Stryker  |

计划中：python-hex（kairoscore）、web-react、rust-workspace（ficant）、jvm-maven、go。只在有项目真的
需要时才做。

## 修改 keel

1. 只有其他项目也会遇到的问题才进入 keel；只影响一个项目的，改那个项目自己的文件。
2. 能做成检查、测试或平台规则的，就不写成 AGENTS.md 里的文字。
3. 改完运行自测，并在 `CHANGELOG.md` 写清楚每项改动对应的真实问题：

   ```powershell
   pwsh -NoProfile -File tests/test-template.ps1
   ```

4. 打 tag 发版（`vX.Y.Z`），各项目按需 `copier update`。
5. 每个大版本审一遍：长期没有触发、或模型已经不再犯的规则，删掉。

## 用户级配置

`user/AGENTS.user.md` 是本机环境说明（PowerShell 7、UTF-8 等），适用于所有项目。写入 Claude Code 和
Codex 的用户级配置：

```powershell
pwsh -NoProfile -File user/install-user-config.ps1
```

脚本只替换标记之间的内容，可以重复运行。
