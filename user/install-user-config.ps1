# 把 AGENTS.user.md 写入用户级 agent 配置（Claude Code 与 Codex）。
# 只替换两行标记之间的内容，文件里的其他内容保持不变；可重复运行。
# 用法：pwsh -NoProfile -File user/install-user-config.ps1 [-WhatIf]
[CmdletBinding(SupportsShouldProcess)]
param(
    [string[]]$Targets = @(
        (Join-Path $HOME '.claude/CLAUDE.md'),
        (Join-Path $HOME '.codex/AGENTS.md')
    )
)
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# 通过 pwsh -File 传入的逗号分隔列表会被当成一个字符串，这里统一拆开。
$Targets = @($Targets | ForEach-Object { $_ -split ',' } | ForEach-Object { $_.Trim() } | Where-Object { $_ })

$begin = '<!-- keel:user-config:begin -->'
$end = '<!-- keel:user-config:end -->'
$snippet = (Get-Content -LiteralPath (Join-Path $PSScriptRoot 'AGENTS.user.md') -Raw -Encoding utf8).TrimEnd()
$block = "$begin`n$snippet`n$end"

foreach ($target in $Targets) {
    $existing = if (Test-Path -LiteralPath $target) { Get-Content -LiteralPath $target -Raw -Encoding utf8 } else { '' }
    if ($null -eq $existing) { $existing = '' }

    $startIndex = $existing.IndexOf($begin)
    $endIndex = $existing.IndexOf($end)
    if ($startIndex -ge 0 -and $endIndex -gt $startIndex) {
        $updated = $existing.Substring(0, $startIndex) + $block + $existing.Substring($endIndex + $end.Length)
    }
    elseif ($existing.Trim().Length -eq 0) {
        $updated = "$block`n"
    }
    else {
        $updated = $existing.TrimEnd() + "`n`n$block`n"
    }

    if ($updated -eq $existing) {
        Write-Host "无需更新：$target"
        continue
    }
    if ($PSCmdlet.ShouldProcess($target, '写入 keel 用户级配置')) {
        $directory = Split-Path -Parent $target
        if (-not (Test-Path -LiteralPath $directory)) {
            New-Item -ItemType Directory -Path $directory | Out-Null
        }
        Set-Content -LiteralPath $target -Value $updated -Encoding utf8NoBOM -NoNewline
        Write-Host "已更新：$target"
    }
}
