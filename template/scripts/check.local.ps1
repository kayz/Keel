# 项目自己的检查步骤。本文件归项目所有，keel 更新时不会覆盖。
# 返回 New-KeelStep 列表；Mode 为 fast 或 full。没有额外步骤时保持返回空列表即可。

function Get-KeelLocalSteps {
    param(
        [Parameter(Mandatory)][ValidateSet('fast', 'full')][string]$Mode,
        [Parameter(Mandatory)][string]$Root
    )
    $steps = [System.Collections.Generic.List[object]]::new()

    # 示例：只在完整检查里构建桌面端。
    # if ($Mode -eq 'full') {
    #     $steps.Add((New-KeelStep -Name '桌面端构建' -Command 'pnpm' -Arguments @('desktop:build')))
    # }

    return $steps.ToArray()
}
