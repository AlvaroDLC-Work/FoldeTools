@echo off
@REM set PowerShellScriptPath=Z:\My Drive\Proyects\Developer\PowerShell\TreeFolderZipFile\CreateFolderTreeFromZip.ps1
set PowerShellScriptPath=Z:\My Drive\Proyects\Developer\PowerShell\TreeFolderZipFile\TreeFolder.ps1

powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%PowerShellScriptPath%"
pause
