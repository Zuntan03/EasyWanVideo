@echo off
chcp 65001 > NUL
set PS_CMD=PowerShell -Version 5.1 -NoProfile -ExecutionPolicy Bypass
set EASY_TOOLS=%~dp0..\..\EasyTools
set JUNCTION=%EASY_TOOLS%\Link\Junction.bat

pushd %~dp0..\..\ComfyUI

call %JUNCTION% ..\Output output
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %JUNCTION% ..\Model models
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %JUNCTION% ..\Workflow user\default\workflows
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %JUNCTION% user\default\workflows\Easy %~dp0Workflow
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM if not exist user\default\workflows\Easy\ ( goto :SKIP_BACKUP )
@REM set BACKUP_TIME=
@REM for /f %%i in ('%PS_CMD% -c "Get-Date -Format yyyyMMdd_HHmm_ssff"') do set BACKUP_TIME=%%i
@REM echo xcopy /QY user\default\workflows\Easy\ user\default\workflows\Easy_Backup\%BACKUP_TIME%\
@REM xcopy /QY user\default\workflows\Easy\ user\default\workflows\Easy_Backup\%BACKUP_TIME%\ > NUL
@REM if %ERRORLEVEL% neq 0 ( goto :SKIP_BACKUP )
@REM rmdir /S /Q user\default\workflows\Easy
@REM :SKIP_BACKUP
@REM echo xcopy /QY %~dp0Workflow\ user\default\workflows\Easy\
@REM xcopy /QY %~dp0Workflow\ user\default\workflows\Easy\ > NUL

popd rem %~dp0..\..\ComfyUI
