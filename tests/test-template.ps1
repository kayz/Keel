# keel 模板自测：语法检查所有 PowerShell 脚本，生成新项目并跑通检查，再验证接入已有项目的模式。
# 用法：pwsh -NoProfile -File tests/test-template.ps1 [-SkipMutation] [-KeepWork]
[CmdletBinding()]
param(
    [switch]$SkipMutation,
    [switch]$KeepWork
)
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$repo = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..')).Path
$work = Join-Path ([System.IO.Path]::GetTempPath()) ('keel-test-' + [guid]::NewGuid().ToString('N').Substring(0, 8))
New-Item -ItemType Directory -Path $work | Out-Null

function Assert-LastExit {
    param([Parameter(Mandatory)][string]$What)
    if ($LASTEXITCODE -ne 0) { throw "$What 失败（退出码 $LASTEXITCODE）" }
}

function Assert-Path {
    param([Parameter(Mandatory)][string]$Root, [Parameter(Mandatory)][string[]]$Paths, [switch]$Absent)
    foreach ($relative in $Paths) {
        $exists = Test-Path -LiteralPath (Join-Path $Root $relative)
        if ($Absent -and $exists) { throw "不应生成：$relative" }
        if (-not $Absent -and -not $exists) { throw "缺少文件：$relative" }
    }
}

function Initialize-GitRepo {
    param([Parameter(Mandatory)][string]$Path)
    & git -C $Path init -q -b main; Assert-LastExit 'git init'
    & git -C $Path add -A; Assert-LastExit 'git add'
    & git -C $Path -c user.email=keel@example.invalid -c user.name=keel commit -q -m init; Assert-LastExit 'git commit'
}

try {
    Write-Host '== 1. PowerShell 语法检查'
    # 包括隐藏目录（.keel）和带 copier 条件的文件名（如 “{% if use_ts %}ts-pnpm.ps1{% endif %}”）。
    $scripts = @(
        Get-ChildItem -LiteralPath $repo -Recurse -File -Force |
            Where-Object { $_.Name -match '\.ps1($|\{%)' -and $_.FullName -notmatch '[\\/](node_modules|\.git)[\\/]' }
    )
    foreach ($script in $scripts) {
        $tokens = $null
        $errors = $null
        [System.Management.Automation.Language.Parser]::ParseFile($script.FullName, [ref]$tokens, [ref]$errors) | Out-Null
        if ($errors.Count -gt 0) {
            $errors | ForEach-Object { Write-Host "$($script.FullName): $($_.Message)" -ForegroundColor Red }
            throw "PowerShell 语法错误：$($script.FullName)"
        }
    }
    Write-Host "   $($scripts.Count) 个脚本语法正确。"

    Write-Host '== 2. 新项目（ts-pnpm）'
    $new = Join-Path $work 'new-ts'
    & copier copy --quiet --defaults -d 'project_name=Keel Demo' -d 'project_description=keel 自测项目' $repo $new
    Assert-LastExit 'copier copy（新项目）'
    Assert-Path -Root $new -Paths @(
        'AGENTS.md', 'docs/intent.md', '.keel/settings.json', '.keel/stacks/ts-pnpm.ps1',
        '.github/CODEOWNERS', 'scripts/check-fast.ps1', 'packages/core/src/domain/pricing.ts',
        'tests/rules/pricing.csv', 'tests/properties/pricing.properties.test.ts',
        'tests/flows/order-lifecycle.flow.test.ts', '.copier-answers.yml'
    )
    Initialize-GitRepo -Path $new
    & pwsh -NoProfile -NonInteractive -File (Join-Path $new 'scripts/check-fast.ps1')
    Assert-LastExit 'check-fast（新项目）'
    & pwsh -NoProfile -NonInteractive -File (Join-Path $new 'scripts/check.ps1')
    Assert-LastExit 'check（新项目）'
    if (-not $SkipMutation) {
        & pwsh -NoProfile -NonInteractive -File (Join-Path $new 'scripts/mutation.ps1')
        Assert-LastExit 'mutation（新项目）'
    }

    Write-Host '== 3. 接入已有项目'
    $existing = Join-Path $work 'existing'
    New-Item -ItemType Directory -Path $existing | Out-Null
    $originalPackage = '{ "name": "existing", "private": true, "scripts": { "test": "node -e \"process.exit(0)\"" } }'
    Set-Content -LiteralPath (Join-Path $existing 'package.json') -Value $originalPackage -Encoding utf8NoBOM
    Initialize-GitRepo -Path $existing
    & copier copy --quiet --defaults -d 'project_name=Existing' -d 'adopt_existing=true' $repo $existing
    Assert-LastExit 'copier copy（接入已有项目）'
    Assert-Path -Root $existing -Paths @('AGENTS.md', 'docs/intent.md', '.keel/settings.json', 'scripts/check-fast.ps1', '.dependency-cruiser.cjs')
    Assert-Path -Root $existing -Absent -Paths @('packages', 'tests/rules/pricing.csv', 'vitest.config.ts', 'pnpm-workspace.yaml', 'tsconfig.json')
    $packageNow = Get-Content -LiteralPath (Join-Path $existing 'package.json') -Raw -Encoding utf8
    if ($packageNow.Trim() -ne $originalPackage.Trim()) { throw '接入模式不应修改已有的 package.json' }
    & pwsh -NoProfile -NonInteractive -File (Join-Path $existing 'scripts/check-fast.ps1') -ListOnly
    Assert-LastExit 'check-fast -ListOnly（接入已有项目）'

    Write-Host '== 4. 受保护文件检测'
    Add-Content -LiteralPath (Join-Path $new 'tests/rules/pricing.csv') -Value 'standard,1,0,1,自测' -Encoding utf8NoBOM
    & pwsh -NoProfile -NonInteractive -File (Join-Path $new '.keel/protected-changes.ps1') -Strict
    if ($LASTEXITCODE -eq 0) { throw '改动 tests/rules/ 后，protected-changes -Strict 应该失败' }
    & git -C $new checkout -q -- tests/rules/pricing.csv
    Assert-LastExit 'git checkout'

    Write-Host 'keel 自测全部通过。' -ForegroundColor Green
}
finally {
    if ($KeepWork) {
        Write-Host "保留测试目录：$work"
    }
    else {
        Remove-Item -LiteralPath $work -Recurse -Force -ErrorAction SilentlyContinue
    }
}
