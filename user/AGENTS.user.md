## 本机环境（keel）

- Windows，默认 shell 为 PowerShell 7（`pwsh`）；不要使用 Windows PowerShell 5.1（`powershell`）。
- 文本文件一律 UTF-8 无 BOM；写文件时显式指定编码（如 `-Encoding utf8NoBOM`）。
- 多步骤自动化写成 `.ps1` 文件再用 `pwsh -NoProfile -File` 执行，不要拼很长的单行命令。
- 调用原生命令后检查 `$LASTEXITCODE`；不要混入 Bash 或 WSL 写法。
- 仓库在 `C:\OneDrive\git` 下，由 OneDrive 同步；不要在仓库里生成大量临时文件。
- 项目有 `scripts/check-fast.ps1` 时，用它做完成前的检查。
