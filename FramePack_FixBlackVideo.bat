@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0EasyTools

call "%EASY_TOOLS%\Ffmpeg\Ffmpeg_Save.bat" %*
if %ERRORLEVEL% neq 0 ( exit /b 1 )
