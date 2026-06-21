$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$zipPath = Join-Path $repoRoot "backup\skill_backup_20260621.zip"
$tempDir = Join-Path $env:TEMP "codex-skill-restore-20260621"
$targetDir = Join-Path $env:USERPROFILE ".codex\skills"

if (-not (Test-Path $zipPath)) {
    throw "Backup zip not found: $zipPath"
}

if (Test-Path $tempDir) {
    Remove-Item -LiteralPath $tempDir -Recurse -Force
}

New-Item -ItemType Directory -Force -Path $tempDir | Out-Null
New-Item -ItemType Directory -Force -Path $targetDir | Out-Null

Expand-Archive -LiteralPath $zipPath -DestinationPath $tempDir -Force

$sourceSkills = Join-Path $tempDir "skill_backup_20260621\skills"
if (-not (Test-Path $sourceSkills)) {
    throw "Expected extracted skills folder not found: $sourceSkills"
}

Copy-Item -LiteralPath (Join-Path $sourceSkills "*") -Destination $targetDir -Recurse -Force

Write-Host "Restore completed."
Write-Host "Skills copied to: $targetDir"
Write-Host "Restart Codex to load the restored skills."
