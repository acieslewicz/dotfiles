# Dotfiles

This repository contains my dotfiles and machine configuration scripts managed through chezmoi. It currently is focused on supporting my Windows machine configurations

## Installation

### Windows

The `.startup.ps1` script will install chezmoi and apply the chezmoi dotfiles:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; iex "&{$(irm 'https://raw.githubusercontent.com/acieslewicz/dotfiles/main/.startup.ps1')}"
```

## Inspirations/References
- https://github.com/MovieMaker93/devpod-dotfiles-chezmoi
- https://github.com/twpayne/dotfiles
- https://github.com/renemarc/dotfiles
