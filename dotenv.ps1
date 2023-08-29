[CmdletBinding()]
param([string]$File = ".env")

if (!( Test-Path $File)) {
    Write-Error "Invalid .env file"
    return
}

get-content $File | foreach {
    Write-Output $_
    $name, $value = $_.split('=')
    set-content env:\$name $value
}