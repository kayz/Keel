# keel 仓库的工作方式

- `template/` 是会被复制到各项目的内容；`copier.yml` 定义问题和规则；`tests/test-template.ps1` 是自测。
- 改动 `template/` 后运行 `pwsh -NoProfile -File tests/test-template.ps1`，没跑或跑不了就直说。
- 只有其他项目也会遇到的真实问题才进入模板。新增约束时，在 `CHANGELOG.md` 写明它对应的问题。
- 优先把约束做成检查、测试或平台规则；做不到才在模板的 AGENTS.md 里加一句。
- 生成后归项目所有的文件要列入 `copier.yml` 的 `_skip_if_exists`，避免 `copier update` 覆盖项目内容。
- 模板里由 keel 管理的文件，开头注明“由 keel 管理，不要手改”。
- 模板文字使用中文；Markdown 要能通过 prettier 检查。
- 打 tag、发版、修改仓库设置，必须由我明确要求才做。
- `archive/` 只保留历史，不再修改。
