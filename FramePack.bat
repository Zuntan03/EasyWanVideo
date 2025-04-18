@echo off
chcp 65001 > NUL

echo http://localhost:7840
start http://localhost:7840

call %~dp0FramePack_NoArgs.bat --port 7840 --inbrowser %*
if %ERRORLEVEL% neq 0 ( exit /b 1 )

cmd /k
