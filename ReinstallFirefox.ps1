$32bitFirefoxPath = "C:\Program Files (x86)\Mozilla Firefox\uninstall\helper.exe"
$64bitFirefoxPath = "C:\Program Files\Mozilla Firefox\uninstall\helper.exe"

# Check if Firefox is installed
if (Test-Path $32bitFirefoxPath) {
    Write-Host "Firefox 32 bit verstion is installed on this computer."
    Write-Host "Uninstalling Firefox..."
    Start-Process $32bitFirefoxPath -ArgumentList "/S" -Wait | Out-Null
} elseif (Test-Path $64bitFirefoxPath) {
    Write-Host "Firefox 64 bit verstion is installed on this computer."
    Write-Host "Exiting script..."
    exit 1
} else {
    Write-Host "Firefox is not installed on this computer."
}

# Install Firefox
Write-Host "Installing Firefox..."
Start-Process .\ff64bit.msi -ArgumentList "/qn" -Wait | Out-Null

exit 0  


