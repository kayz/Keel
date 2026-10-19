# 已归档的 skills

这些 skill 是在模型和 agent 宿主能力还不足时建立的。它们中补能力的部分已经失效，治理和证据的部分又过重，
拖慢了开发。v0.1.0 起由 keel 骨架取代；这里只保留历史，不再修改。

| skill      | 仍然有价值的核心                                                           | 现在的去处                                                                   |
| ---------- | -------------------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| proqaid    | 针对高风险边界叠加检查（risk overlay）                                     | keel 的风险包（计划中）                                                      |
| opaid      | 交接前本地跑验收；不准改测试凑通过                                         | 模板 `AGENTS.md`；受保护的 `tests/rules`、`tests/properties`、`tests/flows`  |
| pact       | 意图与非目标；模块化、窄接口、单一状态归属；一个事实一个地方               | `docs/intent.md`、技术栈包的模块结构、架构检查                               |
| verify     | 预期值独立于实现；走真实入口；用故意出错的输入检验测试                     | `tests/AGENTS.md`、测试先行的 PR、`scripts/mutation.ps1`                     |
| cicd       | 发布须人授权；tag 和制品不可变；只构建一次、按 digest 晋级                 | 中央 cicd 仓库的可复用工作流；GitHub tag ruleset、environments               |
| powershell | 本机环境：pwsh 7、UTF-8 无 BOM、多步脚本写成 .ps1                          | `user/AGENTS.user.md`                                                        |
