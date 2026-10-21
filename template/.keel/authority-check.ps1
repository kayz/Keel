# 校验外部 authority 仓库的本地克隆。由 keel 管理，不要手改。
# 找不到克隆时只提示、不失败（CI 通常拿不到私有 authority）；找到时，manifest 里登记的文档哈希必须全部吻合。
[CmdletBinding()]
param()
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$root = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..')).Path
. (Join-Path $PSScriptRoot 'lib.ps1')
$settings = Get-KeelSettings -Root $root
if (-not ($settings.PSObject.Properties.Name -contains 'authority')) {
    Write-Host '未配置外部 authority，跳过。'
    exit 0
}

$authorityRoot = if ($env:KEEL_AUTHORITY_ROOT) { $env:KEEL_AUTHORITY_ROOT } else { Join-Path $root $settings.authority.default_path }
if (-not (Test-Path -LiteralPath $authorityRoot -PathType Container)) {
    Write-Host ("找不到 authority 仓库 {0} 的本地克隆（{1}），跳过校验。可设置 KEEL_AUTHORITY_ROOT 指向它。" -f $settings.authority.repo, $authorityRoot) -ForegroundColor Yellow
    exit 0
}
$authorityRoot = (Resolve-Path -LiteralPath $authorityRoot).Path

$head = & git -C $authorityRoot rev-parse --short HEAD 2>$null
if ($LASTEXITCODE -ne 0) { throw "不是 git 仓库：$authorityRoot" }
$dirty = @(& git -C $authorityRoot status --porcelain --untracked-files=all)
Write-Host ("authority：{0} @ {1}{2}" -f $settings.authority.repo, $head, $(if ($dirty.Count) { '（有未提交改动）' } else { '' }))

$manifestPath = Join-Path $authorityRoot 'authority-manifest.json'
if (-not (Test-Path -LiteralPath $manifestPath)) {
    Write-Host '没有 authority-manifest.json，只确认仓库存在。'
    exit 0
}
$manifest = Get-Content -LiteralPath $manifestPath -Raw -Encoding utf8 | ConvertFrom-Json
$failures = 0
foreach ($document in @($manifest.documents)) {
    $path = Join-Path $authorityRoot $document.path
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
        Write-Host "缺少文档：$($document.path)" -ForegroundColor Red
        $failures++
        continue
    }
    $actual = (Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash
    if ($actual -cne [string]$document.sha256) {
        Write-Host "哈希不符：$($document.path)" -ForegroundColor Red
        $failures++
    }
}
if ($manifest.PSObject.Properties.Name -contains 'public_code_commit') {
    Write-Host "manifest 绑定的公共提交：$($manifest.public_code_commit)"
}
if ($failures -gt 0) {
    Write-Host "authority 校验失败：$failures 处不符。" -ForegroundColor Red
    exit 1
}
Write-Host ("authority 校验通过：{0} 份文档哈希吻合。" -f @($manifest.documents).Count)
