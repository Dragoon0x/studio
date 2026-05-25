# STUDIO installer (basic, session 1) - Windows PowerShell
# usage: .\install.ps1 -Target claude -Rules "common,design,brand"

param(
    [string]$Target = "claude",
    [string]$Rules = "common,design,product,brand,copy"
)

if ($Target -ne "claude") {
    Write-Host "session 1 supports only -Target claude. cursor, codex, opencode adapters ship in session 2."
    exit 1
}

$ClaudeDir = "$HOME\.claude"
New-Item -ItemType Directory -Force -Path "$ClaudeDir\agents" | Out-Null
New-Item -ItemType Directory -Force -Path "$ClaudeDir\skills\studio" | Out-Null
New-Item -ItemType Directory -Force -Path "$ClaudeDir\commands" | Out-Null
New-Item -ItemType Directory -Force -Path "$ClaudeDir\rules\studio" | Out-Null

Write-Host "installing STUDIO into $ClaudeDir..."

Copy-Item "agents\*.md" "$ClaudeDir\agents\"
Write-Host "  agents copied"

Copy-Item -Recurse "skills\*" "$ClaudeDir\skills\studio\"
Write-Host "  skills copied"

Copy-Item "commands\*.md" "$ClaudeDir\commands\"
Write-Host "  commands copied"

$RuleDirs = $Rules -split ","
foreach ($dir in $RuleDirs) {
    $dir = $dir.Trim()
    if (Test-Path "rules\$dir") {
        Copy-Item -Recurse "rules\$dir" "$ClaudeDir\rules\studio\"
        Write-Host "  rules\$dir copied"
    } else {
        Write-Host "  warning: rules\$dir not found, skipping"
    }
}

Write-Host ""
Write-Host "STUDIO installed."
