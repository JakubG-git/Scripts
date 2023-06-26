param(
[string]$UsersDir
)

function FunctionName {
    param (
        [parameter(Mandatory = $true)]
        [string]$path
    )
    $regex = '(?<=EnableGroupByDate=)[^"]*'
    $kluczWartosc = "EnableGroupByDate=0"
    $fileLocation = $path + "\NOTES\notes.ini"
    $file = Get-Content $fileLocation
    $containsWord = $file | % { $_ -match "EnableGroupByDate" }
    if (Test-Path $fileLocation) {
        Write-Output ("Plik: " + $fileLocation + " istnieje")
        if ($containsWord -contains $true) {
            Write-Host "W pliku $fileLocation jest klucz EnableGroupByDate"
            (Get-Content $fileLocation) -replace $regex, '0' | Set-Content $fileLocation
            Write-Host "Wartosc klucza zostala zmieniona na 0"
        }
        else {
            Write-Host "W pliku $fileLocation nie ma klucza EnableGroupByDate"
            $kluczWartosc | Add-Content -Path $fileLocation
            Write-Host "Dodano klucz z zwartoscia 0"
        }
    }
    else {
        Write-Error "Plik .ini nie istnieje " + "dla " + $path
    }   
}
FunctionName $UsersDir

