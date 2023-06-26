$autoconfig = @"
pref("general.config.filename", "firefox.cfg");
pref("general.config.obscure_value", 0);
"@

$finalConfig = @"
//Settings
lockPref("security.enterprise_roots.enabled", true);
lockPref("network.proxy.type", 0);
"@

$oldPath = "C:\Program Files (x86)\Mozilla Firefox\"
$newPath = "C:\Program Files\Mozilla Firefox\"
if (Test-Path $oldPath) {
    Write-Output "Mozilla 32bit"
    Out-File  -FilePath "C:\Program Files (x86)\Mozilla Firefox\defaults\pref\autoconfig.js" -InputObject $autoconfig -Encoding ascii
    Out-File  -FilePath "C:\Program Files (x86)\Mozilla Firefox\firefox.cfg" -InputObject $finalConfig -Encoding ascii
}
elseif (Test-Path $newPath) {
    Write-Output "Mozilla 64bit"
    Out-File  -FilePath "C:\Program Files\Mozilla Firefox\defaults\pref\autoconfig.js" -InputObject $autoconfig -Encoding ascii
    Out-File  -FilePath "C:\Program Files\Mozilla Firefox\firefox.cfg" -InputObject $finalConfig -Encoding ascii
}
else {
    exit 1
}
exit 0





