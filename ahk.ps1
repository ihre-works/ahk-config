<#
.SYNOPSIS
    ahk-config\app.ahk で起動するアプリを変更する
.PARAMETER codeList
    KEY=PROGRAM
    KEY:
      e, d, f, x, v
    PROGRAM:
      e ... Excel
      i ... IntelliJ IDEA(WSL)
      I ... IntelliJ IDEA
      o ... OneNote
      p ... PowerPoint
      s ... SumatraPDF
      v ... VS Code
      w ... Word
#>
param(
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$codeList
)
$KAPP = Join-Path $env:APPDATA "AutoHotkey"
$KSRC = Join-Path $HOME "OneDrive" "ahk-config" "app"

if (-not (Test-Path $KAPP)) {
    mkdir -p $KAPP
}

if ($codeList.Length -eq 0) {
    foreach ($i in @('e', 'r', 't', 'd', 'f', 'z', 'x', 'c', 'v')) {
        $conf = Join-Path $KAPP "do-$i"
        if (Test-Path $conf) {
            $v = (Get-Content $conf)[0]
            Write-Host "$i -> $v"
        } else {
            Write-Host "$i -> ----"
        }
    }
    return
}

if ($codeList[0] -eq "-h") {
    Write-Host ""
    Write-Host "Program:"
    Write-Host "  e ... Excel"
    Write-Host "  i ... IntelliJ IDEA(WSL)"
    Write-Host "  I ... IntelliJ IDEA"
    Write-Host "  o ... OneNote"
    Write-Host "  O ... Outlook"
    Write-Host "  p ... PowerPoint"
    Write-Host "  s ... SumatraPDF"
    Write-Host "  v ... VS Code"
    Write-Host "  w ... Word"
    Write-Host "  x ... Excel"
    Write-Host ""
    return
}

function getApp($code) {
    switch ($code) {
        "e" {
            return "excel"
        }
        "i" {
            return "idea-wsl"
        }
        "I" {
            return "idea"
        }
        "o" {
            return "onenote"
        }
        "O" {
            return "outlook"
        }
        "p" {
            return "powerpoint"
        }
        "s" {
            return "sumatrapdf"
        }
        "v" {
            return "code"
        }
        "w" {
            return "word"
        }
        "x" {
            return "excel"
        }
        default {
            return $code
        }
    }
}

foreach ($code in $codeList) {
    $p = $code.split("=")
    Write-Debug "p[0] = $($p[0])"
    Write-Debug "p[1] = $($p[1])"
    $key = "do-$($p[0])"
    $keyFile = Join-Path $KAPP $key
    $appFile = Join-Path $KSRC "$(getApp $p[1]).app"
    Get-Content $appFile | ForEach-Object { $_ -replace "{HOME}",$HOME } | Out-File $keyFile -Encoding utf8 -Force
    Write-Host "Fn-$key -> $appFile"
    Get-Content $keyFile | Write-Host
}
