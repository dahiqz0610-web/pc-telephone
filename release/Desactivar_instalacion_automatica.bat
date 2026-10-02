@echo off
setlocal
powershell -NoProfile -ExecutionPolicy Bypass -Command "$startup=[Environment]::GetFolderPath('Startup'); Remove-Item (Join-Path $startup 'PC USB Android.lnk') -Force -ErrorAction SilentlyContinue; Unregister-ScheduledTask -TaskName 'PC USB - Instalacion Android' -Confirm:$false -ErrorAction SilentlyContinue"
taskkill /IM PC_USB_Agent.exe /F >nul 2>&1
echo Se desactivo la instalacion automatica de PC USB.
pause
endlocal
