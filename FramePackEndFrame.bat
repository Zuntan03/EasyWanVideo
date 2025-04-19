@echo off
chcp 65001 > NUL

echo http://localhost:7841
start http://localhost:7841

call %~dp0FramePackEndFrame_NoArgs.bat --port 7841 %*
if %ERRORLEVEL% neq 0 ( exit /b 1 )

cmd /k
