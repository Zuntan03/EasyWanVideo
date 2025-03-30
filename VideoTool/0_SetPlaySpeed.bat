@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\EasyTools

call "%EASY_TOOLS%\Ffmpeg\Ffmpeg_PlaySpeed.bat" %*
if %ERRORLEVEL% neq 0 ( exit /b 1 )
