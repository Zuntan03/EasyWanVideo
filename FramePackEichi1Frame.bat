@echo off
chcp 65001 > NUL

echo http://localhost:7844
start http://localhost:7844

call %~dp0FramePackEichi1Frame_NoArgs.bat --port 7844 %*
if %ERRORLEVEL% neq 0 ( exit /b 1 )

cmd /k
