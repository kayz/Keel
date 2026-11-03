# 变更记录

## v0.1.1（未发布）

- ts-pnpm：新项目在 `package.json` 里用 `"packageManager": "pnpm@10.30.0"` 固定 pnpm 版本；
  已有项目缺少这个字段时，检查脚本会给出提示。
  - 原因：Quillarium 接入后，本地机器装的是 pnpm 12，它不再读取 `package.json` 里的
    `pnpm.overrides`，`pnpm install --frozen-lockfile` 失败，而 CI 用的 pnpm 10 没有问题。
    新版 pnpm 遇到 `packageManager` 会自动切换到指定版本，本地和 CI 就能保持一致。
- 仓库根目录补齐 `.gitattributes`（`* text=auto eol=lf`）。
  - 原因：Windows 上 `core.autocrlf=true` 时克隆 keel 会把 `template/` 下非 `.jinja` 文件检出为 CRLF，
    `copier copy` 原样复制后导致新项目首次运行 `prettier --check .` 报 13 个文件换行符错误。
- 验收与架构约束：
  - `tests/AGENTS.md` 补充两条验收原则：涉及 I/O、异步队列或长任务时须覆盖慢速/失败注入、中途取消与中断恢复；涉及昂贵 I/O 或解码时须断言底层读取/调用次数或资源上限。
  - `docs/intent.md` 在“验收入口”提示填写大文件、远端 I/O 或高频交互的硬门槛。
  - `dependency-cruiser.base.cjs` 新增 `core-no-ui-packages`，禁止 `src/domain/` 与 `src/application/` 直接依赖 `electron`、`react` 等宿主或界面框架。
  - 原因：Fovea 在 200+ 单元测试全绿的情况下，遇到 NAS 真实 187 张 CR3 时暴露出重复回源、长任务取消无响应、UI 与后台 I/O 争用；Quillarium 桌面端测试也曾因耦合 Electron 触发下载阻塞。把无头核心（Humble View）、故障/取消路径和 I/O 次数断言前置到模板与架构检查中。

## v0.1.0

首个版本：用项目骨架取代原来的 skills。

- 通用骨架：`AGENTS.md`、`docs/intent.md`、`docs/decisions/`、`contracts/`、`tests/` 的目录约定，
  统一检查入口 `scripts/check-fast.ps1` / `check.ps1` / `mutation.ps1`，项目自定义入口
  `scripts/check.local.ps1`。
  - 原因：skills 用文字约束 agent，既费 token 又拖慢进度；需要保留的约束改由结构、测试和平台规则执行。
- 受保护路径（`.keel/protected-paths.txt` 与 `.github/CODEOWNERS`）和 `protected-changes.ps1`：检查时列出
  改动过的意图、契约和验收测试。
  - 原因：agent 为了让实现通过而修改预期值，是 opaid、verify 反复防范的问题。
- ts-pnpm 技术栈包：按 `package.json` 中实际存在的脚本组装检查；dependency-cruiser 基础规则（禁止循环依赖、
  domain 依赖外层、domain 直接 IO、跨 package 深层导入）；fast-check 属性与状态机测试示例；Stryker 变异测试。
  - Stryker 使用 `inPlace` 模式：pnpm workspace 通过符号链接解析包，沙箱模式下测试读不到被变异的源码。
  - 示例项目使用 vitest 4：@stryker-mutator/vitest-runner 10.0.0 与 vitest 5 配合时，大部分变异体没有被
    正确激活。
- `adopt_existing` 选项：接入已有项目时只添加骨架约定，不生成示例代码和包配置。
- `decisions_dir` 选项：已有项目沿用原来的 ADR 目录（如 Quillarium 的 `docs/adr`），避免出现两个决策目录。
- 接入已有项目时可以用 dependency-cruiser 的基线文件记录现存违规，检查只拦新增违规；基线文件受保护。
- 用户级配置 `user/AGENTS.user.md` 与安装脚本（取代 powershell skill）。
