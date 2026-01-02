# Variables
$env:EDITOR = "nvim"

# Set config directory location
$env:XDG_CONFIG_HOME = "$HOME/.config"

Invoke-Expression (& 'C:\Program Files\starship\bin\starship.exe' init powershell)
