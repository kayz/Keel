---
name: powershell
description: Use when composing, reviewing, or debugging Windows PowerShell commands or .ps1 scripts where paths, quoting or regex, process arguments, environment variables, native exit codes, or Bash/Linux shell habits could cause failures.
---

# PowerShell

## Purpose

Produce native, directly executable PowerShell. Use PowerShell 7 by default;
target Windows PowerShell 5.1 only when the task explicitly requires it. Separate
cross-platform implementations instead of mixing Bash, WSL, or macOS syntax into
a `.ps1` file.

## Native Syntax

- Use `$env:NAME` for environment variables.
- Use quoted Windows paths or `Join-Path`:

```powershell
$project = "C:\Users\User\My Project"
$child = Join-Path $project "src"
```

- Use `Get-ChildItem`, `Copy-Item`, `Move-Item`, `Remove-Item`, and `New-Item`
  instead of Unix aliases or commands in scripts.
- Use `-LiteralPath` for filesystem mutations when the cmdlet supports it.
  `New-Item` uses `-Path`; verify the intended target and that command's path
  handling instead of supplying an unsupported parameter. Before a recursive
  delete or move, resolve and verify the target remains inside the intended root.
- Do not emit `export`, `VAR=value command`, `source`, `chmod`, `rm -rf`, Bash
  heredocs, `/tmp`, `/home`, or WSL path assumptions.
- Do not use Bash command substitution. PowerShell subexpressions use `$()` but
  have PowerShell semantics.

## Quoting and Regular Expressions

Backslash does not escape PowerShell quotes. Prefer single-quoted literals; write
`''` for an embedded single quote. In a double-quoted string, escape `"` with the
PowerShell backtick, not `\`. Keep regex literals single-quoted when possible so
regex backslashes remain visible:

```powershell
$message = 'The state is "ready"'
$owner = 'it''s ready'
$startProcessPattern = '(?im)^\s*Start-Process\b[^\r\n]*\bwsl(?:\.exe)?\b'
```

Use `.Contains()` for exact syntax tokens, especially call operator forms. Reserve
regex for patterns that actually need regex behavior:

```powershell
$hasWslCall = (
    $text.Contains('& wsl') -or
    $text.Contains('&''wsl') -or
    $text.Contains('&"wsl')
)
```

Use `[regex]::Escape($value)` before inserting a dynamic literal into a regex. Do
not combine multiple quoting dialects in one generated command string.

## Sequencing and Errors

Do not treat `;` as a success-conditional replacement for Bash `&&`; it always
continues. Prefer explicit control flow.

For cmdlets, make terminating behavior explicit:

```powershell
$ErrorActionPreference = 'Stop'
try {
    Copy-Item -LiteralPath $source -Destination $destination
} catch {
    Write-Error $_
    exit 1
}
```

For native programs, inspect `$LASTEXITCODE`:

```powershell
& git status --short
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}
```

Avoid long inline command chains. Put repeated or multi-step automation in a
reviewable `.ps1` entry point. When PowerShell 7 is required, invoke it explicitly:

```powershell
pwsh -NoProfile -NonInteractive -File "C:\path\to\script.ps1"
```

## Native Process Arguments

Use the call operator with an argument array for ordinary native execution:

```powershell
$arguments = @('--sandbox', 'read-only', '--model', 'gpt-5.3-codex-spark')
& $executable @arguments
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}
```

When output redirection, lifecycle control, or exact argv construction is needed,
use `System.Diagnostics.ProcessStartInfo.ArgumentList`. Avoid
`Start-Process -ArgumentList` when arguments contain spaces or quotes because it
reconstructs a command line and reintroduces quoting ambiguity. Do not put
multi-statement logic in `pwsh -Command`; pass a reviewed `.ps1` to `-File`.

## Runtimes and Activation

Use Windows runtime layouts. For a Python virtual environment:

```powershell
& ".\venv\Scripts\Activate.ps1"
```

Do not translate it to `source venv/bin/activate`. If an action needs administrator
rights or a policy change, state the requirement and safe boundary; do not silently
elevate or weaken execution policy.

## Parse Before Execution

Parse every generated or modified non-trivial script before its first execution.
Make this a deterministic runner or contract gate rather than a prose request:

```powershell
$tokens = $null
$errors = $null
[System.Management.Automation.Language.Parser]::ParseFile(
    $scriptPath,
    [ref]$tokens,
    [ref]$errors
) | Out-Null

if ($errors.Count -gt 0) {
    $errors | ForEach-Object { Write-Error $_.Message }
    exit 1
}
```

For script text not yet stored in a file, use `Parser::ParseInput` with the same
token and error checks. A parse failure is a mechanical correction; do not execute
the script until parsing returns zero errors. Parsing proves syntax only, so still
run the requested behavior and regression commands afterward.

## Final Check

Confirm that the output uses one PowerShell dialect, quoted Windows-compatible
paths, `$env:` variables, correct cmdlet/native error handling, no Bash/WSL
assumptions, and safe literal filesystem targets. Run the parser and the requested
verification command; return parser errors, actual exit codes, and evidence.
