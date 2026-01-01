$src = "$env:USERPROFILE\.config\windows_terminal\settings.json"
$dest = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"

if (-not (Test-Path (Split-Path $dest))) { exit 0 }

if ((Get-Item $dest -ErrorAction SilentlyContinue).LinkType -eq 'SymbolicLink') { exit 0 }

if ((Test-Path $src) -and (Test-Path $dest)) {
    Import-Module $PSHOME\Modules\Microsoft.PowerShell.Utility -Function Get-FileHash
    if ((Get-FileHash $src).Hash -eq (Get-FileHash $dest).Hash) { exit 0 }
}

Copy-Item $src $dest -Force
