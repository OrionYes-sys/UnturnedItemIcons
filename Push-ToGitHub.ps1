param(
    [string]$RepoName = "UnturnedItemIcons",
    [switch]$Public
)

$ErrorActionPreference = "Stop"
$gh = "C:\Program Files\GitHub CLI\gh.exe"
$repoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path

Set-Location $repoRoot

& $gh auth status | Out-Null
if ($LASTEXITCODE -ne 0) {
    Write-Host "GitHub login required. Run:"
    Write-Host "  & `"$gh`" auth login --hostname github.com --git-protocol https --web"
    exit 1
}

$visibility = if ($Public) { "--public" } else { "--private" }
& $gh repo create $RepoName $visibility --source . --remote origin --push --description "Unturned item icons for AdamiteInventory UI"

if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to create/push repository."
}

$user = & $gh api user --jq .login
$url = "https://raw.githubusercontent.com/$user/$RepoName/main"
Write-Host ""
Write-Host "Done. Set plugin config:"
Write-Host "<ItemIconBaseUrl>$url</ItemIconBaseUrl>"
