$targetPath = "C:\Program Files\AutoHotkey\v2\AutoHotkey64_UIA.exe"
$startupPath = [Environment]::GetFolderPath("Startup")
$shortcutPath = "$startupPath\AutHOtkey_uiAccess.lnk"  # ショートカットの保存先

$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut($shortcutPath)
$shortcut.TargetPath = $targetPath
$shortcut.WorkingDirectory = "$env:USERPROFILEC\OneDrive\ahk-config"
$shortcut.Arguments = "$env:USERPROFILE\OneDrive\ahk-config\AutoHotkey.ahk /uiAccess"
$shortcut.WindowStyle = 1  # 通常のウィンドウ
$shortcut.Description = "AutoHotkey_uiAccess"
$shortcut.IconLocation = "$targetPath,0"
$shortcut.Save()

& $HOME\OneDrive\ahk-config\set-ahk.ps1 d=sumatrapdf
& $HOME\OneDrive\ahk-config\set-ahk.ps1 z=onenote
& $HOME\OneDrive\ahk-config\set-ahk.ps1 x=excel
& $HOME\OneDrive\ahk-config\set-ahk.ps1 c=outlook
& $HOME\OneDrive\ahk-config\set-ahk.ps1 v=code
