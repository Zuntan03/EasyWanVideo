@echo off
chcp 65001 > NUL
set CURL_CMD=C:\Windows\System32\curl.exe -kL

call %~dp0ComfyUi\SetupComfyUi.bat
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0ComfyUi\SetupComfyUiCustomNodes.bat
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0ComfyUi\SetupComfyUiLink.bat
if %ERRORLEVEL% neq 0 ( exit /b 1 )

@REM if exist %~dp0vs_BuildTools.exe ( goto :EXIST_VS_BUILD_TOOLS )
@REM echo.
@REM echo %CURL_CMD% -o %~dp0vs_BuildTools.exe https://aka.ms/vs/17/release/vs_buildtools.exe
@REM %CURL_CMD% -o %~dp0vs_BuildTools.exe https://aka.ms/vs/17/release/vs_buildtools.exe
@REM if %ERRORLEVEL% neq 0 ( pause & exit /b 1 )
@REM :EXIST_VS_BUILD_TOOLS

if exist %~dp0vc_redist.x64.exe ( goto :EXIST_VS_BUILD_TOOLS )
echo.
echo %CURL_CMD% -o %~dp0vc_redist.x64.exe https://aka.ms/vs/17/release/vc_redist.x64.exe
%CURL_CMD% -o %~dp0vc_redist.x64.exe https://aka.ms/vs/17/release/vc_redist.x64.exe
if %ERRORLEVEL% neq 0 ( pause & exit /b 1 )
:EXIST_VS_BUILD_TOOLS
