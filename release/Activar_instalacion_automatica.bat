@echo off
setlocal
set "AGENT=%~dp0PC_USB_Agent.exe"
if not exist "%AGENT%" (
  echo No encuentro PC_USB_Agent.exe. Extrae todos los archivos del ZIP primero.
  pause
  exit /b 1
)
set "PCUSB_AGENT=%AGENT%"
powershell -NoProfile -ExecutionPolicy Bypass -Command "$startup=[Environment]::GetFolderPath('Startup'); $shell=New-Object -ComObject WScript.Shell; $link=$shell.CreateShortcut((Join-Path $startup 'PC USB Android.lnk')); $link.TargetPath=$env:PCUSB_AGENT; $link.WorkingDirectory=Split-Path $env:PCUSB_AGENT; $link.Save()"
if errorlevel 1 (
  echo No se pudo configurar el inicio automatico de Windows.
  pause
  exit /b 1
)
start "" "%AGENT%"
echo Listo. Windows instalara PC USB en los celulares autorizados al conectarlos.
echo La tarea se ejecuta al iniciar sesion y puede quitarse desde el Programador de tareas.
pause
endlocal
