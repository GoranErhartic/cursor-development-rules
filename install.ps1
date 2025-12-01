#Requires -Version 5.1

<#
.SYNOPSIS
    Installs Cursor rules to a target project.

.DESCRIPTION
    Copies .cursor/rules directory to the specified project.
    Automatically backs up existing rules if found.

.PARAMETER TargetPath
    The path to the target project directory.

.EXAMPLE
    .\install.ps1 -TargetPath "C:\Projects\my-project"

.EXAMPLE
    .\install.ps1 "C:\Projects\my-project"

.EXAMPLE
    .\install.ps1 .
#>

param(
    [Parameter(Mandatory=$false, Position=0)]
    [string]$TargetPath
)

# Function to show usage
function Show-Usage {
    Write-Host ""
    Write-Host "Cursor Rules Installer" -ForegroundColor Blue
    Write-Host ""
    Write-Host "Usage: .\install.ps1 [-TargetPath] <target-project-path>"
    Write-Host ""
    Write-Host "Description:"
    Write-Host "  Copies .cursor/rules directory to the specified project."
    Write-Host "  Automatically backs up existing rules if found."
    Write-Host ""
    Write-Host "Examples:"
    Write-Host '  .\install.ps1 -TargetPath "C:\Projects\my-project"'
    Write-Host '  .\install.ps1 "C:\Projects\my-project"'
    Write-Host '  .\install.ps1 .'
    Write-Host ""
}

# Check if target path is provided
if ([string]::IsNullOrWhiteSpace($TargetPath)) {
    Write-Host "Error: Target project path is required" -ForegroundColor Red
    Show-Usage
    exit 1
}

# Get script directory
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$SourceRulesDir = Join-Path $ScriptDir ".cursor\rules"

# Validate source rules directory exists
if (-not (Test-Path -Path $SourceRulesDir -PathType Container)) {
    Write-Host "Error: Source rules directory not found at $SourceRulesDir" -ForegroundColor Red
    exit 1
}

# Validate target path exists
if (-not (Test-Path -Path $TargetPath -PathType Container)) {
    Write-Host "Error: Target path does not exist: $TargetPath" -ForegroundColor Red
    exit 1
}

# Resolve absolute path
$TargetPath = Resolve-Path $TargetPath
$TargetCursorDir = Join-Path $TargetPath ".cursor"
$TargetRulesDir = Join-Path $TargetCursorDir "rules"

Write-Host "Installing Cursor rules..." -ForegroundColor Blue
Write-Host "Source: $SourceRulesDir"
Write-Host "Target: $TargetRulesDir"
Write-Host ""

# Create .cursor directory if it doesn't exist
if (-not (Test-Path -Path $TargetCursorDir)) {
    Write-Host "Creating .cursor directory..." -ForegroundColor Yellow
    New-Item -Path $TargetCursorDir -ItemType Directory | Out-Null
}

# Backup existing rules if they exist
$BackupName = $null
if (Test-Path -Path $TargetRulesDir) {
    $BackupName = "rules_bkp"
    $BackupPath = Join-Path $TargetCursorDir $BackupName
    
    # If backup already exists, append timestamp
    if (Test-Path -Path $BackupPath) {
        $Timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
        $BackupName = "rules_bkp_$Timestamp"
        $BackupPath = Join-Path $TargetCursorDir $BackupName
    }
    
    Write-Host "Backing up existing rules to $BackupName..." -ForegroundColor Yellow
    Move-Item -Path $TargetRulesDir -Destination $BackupPath
}

# Copy rules
Write-Host "Copying rules..." -ForegroundColor Blue
Copy-Item -Path $SourceRulesDir -Destination $TargetRulesDir -Recurse

# Success message
Write-Host ""
Write-Host "✓ Installation complete!" -ForegroundColor Green
Write-Host ""
Write-Host "Rules installed to: $TargetRulesDir"
if ($BackupName) {
    Write-Host "Previous rules backed up to: $(Join-Path $TargetCursorDir $BackupName)"
}
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Blue
Write-Host "  1. Restart Cursor or reload the workspace"
Write-Host "  2. The rules will be automatically applied to your AI sessions"
Write-Host ""

