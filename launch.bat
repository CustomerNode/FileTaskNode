@echo off
cd /d "%~dp0"
echo.
echo   FileTaskNode
echo   By CustomerNode LLC (customernode.com)
echo   Powered by Claude Code
echo   ============
echo.
echo   1. Start new session
echo   2. Resume previous session
echo.
set /p choice="  Choose (1 or 2): "
if "%choice%"=="2" (
    claude --resume
) else (
    claude
)
