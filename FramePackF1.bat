@echo off
chcp 65001 > NUL

echo http://localhost:7841
start http://localhost:7841

call %~dp0FramePackF1_NoArgs.bat --port 7841 --inbrowser %*
if %ERRORLEVEL% neq 0 ( exit /b 1 )

cmd /k
