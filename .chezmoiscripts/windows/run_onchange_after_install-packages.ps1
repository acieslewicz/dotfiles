# Self-elevate the script if required
if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
  if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
    $CommandLine = "-ExecutionPolicy Bypass -File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
    Start-Process -Wait -FilePath PowerShell.exe -Verb Runas -ArgumentList $CommandLine
    Exit
  }
}

# Winget configuration specifies which packages to install
$configPath = "$env:USERPROFILE\.config\winget\configuration.yaml"
if (Test-Path $configPath) {
    winget configure -f $configPath --accept-configuration-agreements
} else {
    Write-Error "Configuration file not found at $configPath"
}

Install-PSResource -Name NerdFonts
Import-Module -Name NerdFonts
Install-NerdFont -Name "Iosevka"
