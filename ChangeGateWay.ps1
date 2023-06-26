param(
[string]$OldGate,
[string]$NewGate
)

$index = Get-NetRoute -DestinationPrefix 0.0.0.0/0 -NextHop $OldGate | Select-Object -ExpandProperty ifIndex

Remove-NetRoute -DestinationPrefix 0.0.0.0/0 -NextHop $OldGate -ErrorAction SilentlyContinue -Confirm:$false

New-NetRoute -DestinationPrefix 0.0.0.0/0 -NextHop $NewGate -InterfaceIndex $index -ErrorAction SilentlyContinue -Confirm:$false

Get-NetRoute -DestinationPrefix 0.0.0.0/0 | Select-Object -ExpandProperty NextHop