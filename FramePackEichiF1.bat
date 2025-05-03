@echo off
chcp 65001 > NUL

echo http://localhost:7843
start http://localhost:7843

call %~dp0FramePackEichiF1_NoArgs.bat --port 7843 %*
if %ERRORLEVEL% neq 0 ( exit /b 1 )

cmd /k
