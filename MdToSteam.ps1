
[CmdletBinding()]
param (
    
    [Parameter()]
    [switch]
    $Clip = $false
)

if($null -eq (Get-Command MarkdownToSteam.exe -ErrorAction SilentlyContinue)) {
    Write-Error "MarkdownToSteam.exe not found in PATH. Please install it or add it to your PATH."
    exit 1
}

if($null -eq (Get-Command gh -ErrorAction SilentlyContinue)) {
    Write-Error "GitHub Cli (gh) not found in PATH. Please install it or add it to your PATH."
    exit 1
}

# Get the base path for the relative images.  Convert the result to the raw.githubusercontent.com URL
$repoRoot = gh repo view --json url | ConvertFrom-Json | Select-Object -ExpandProperty url

# Note - using the main branch so no changes are required when merged.
$repoRoot -replace 'https://github.com', 'https://raw.githubusercontent.com' -replace '\.git$', '' | ForEach-Object {
    $basePath = "$_/main"
}

& MarkdownToSteam.exe -i ReadMe.md -o SteamReadMe.txt -b $basePath

if($Clip) {
    Get-Content SteamReadMe.txt | Set-Clipboard
}
