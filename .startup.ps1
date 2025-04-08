winget install twpayne.chezmoi --source winget

# Load updated paths to avoid restarting shell
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

chezmoi init https://github.com/acieslewicz/dotfiles
