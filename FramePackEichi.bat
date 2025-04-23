@echo off
chcp 65001 > NUL

echo http://localhost:7842
start http://localhost:7842

call %~dp0FramePackEichi_NoArgs.bat --port 7842 %*
if %ERRORLEVEL% neq 0 ( exit /b 1 )

cmd /k
