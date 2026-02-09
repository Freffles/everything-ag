# Everything Antigravity: Global Installer (Windows)
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
if ([string]::IsNullOrEmpty($scriptDir)) { $scriptDir = "." }

$claudeRules = Join-Path $HOME ".claude\rules"
$agBase = Join-Path $HOME ".gemini\antigravity"
$agSkills = Join-Path $agBase "skills"
$agWorkflows = Join-Path $agBase "workflows"

Write-Host "Everything Antigravity: Global Sync Initialized" -ForegroundColor Cyan
Write-Host "-----------------------------------------------"

# 1. Sync Rules
$rulesSrcPath = Join-Path $scriptDir "docs\rules"
if (Test-Path $rulesSrcPath) {
    if (!(Test-Path $claudeRules)) { New-Item -ItemType Directory -Force -Path $claudeRules | Out-Null }
    Write-Host "Syncing Rules..."
    Get-ChildItem -Path $rulesSrcPath -Directory | ForEach-Object {
        $dest = Join-Path $claudeRules $_.Name
        Copy-Item -Path $_.FullName -Destination $dest -Recurse -Force
        Write-Host "  - Rule: $($_.Name)"
    }
}

# 2. Sync Skills
$skillsSrcPath = Join-Path $scriptDir "skills"
if (Test-Path $skillsSrcPath) {
    if (!(Test-Path $agSkills)) { New-Item -ItemType Directory -Force -Path $agSkills | Out-Null }
    Write-Host "Syncing Skills..."
    Get-ChildItem -Path $skillsSrcPath -Directory | ForEach-Object {
        $dest = Join-Path $agSkills $_.Name
        Copy-Item -Path $_.FullName -Destination $dest -Recurse -Force
        Write-Host "  - Skill: $($_.Name)"
    }
}

# 3. Sync Workflows
$workflowSrcPath = Join-Path $scriptDir ".agent\workflows"
if (Test-Path $workflowSrcPath) {
    if (!(Test-Path $agWorkflows)) { New-Item -ItemType Directory -Force -Path $agWorkflows | Out-Null }
    Write-Host "Syncing Workflows..."
    Get-ChildItem -Path $workflowSrcPath -Filter "*.md" | ForEach-Object {
        $destPath = Join-Path $agWorkflows $_.Name
        Copy-Item -Path $_.FullName -Destination $destPath -Force
        Write-Host "  - Workflow: $($_.Name)"
    }
}

Write-Host "-----------------------------------------------"
Write-Host "Global installation complete!" -ForegroundColor Green
