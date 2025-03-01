@echo off
chcp 65001 > NUL
set CURL_CMD=C:\Windows\System32\curl.exe -kL

call %~dp0ComfyUi\SetupComfyUi.bat
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0ComfyUi\SetupComfyUiCustomNodes.bat
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0ComfyUi\SetupComfyUiLink.bat
if %ERRORLEVEL% neq 0 ( exit /b 1 )
