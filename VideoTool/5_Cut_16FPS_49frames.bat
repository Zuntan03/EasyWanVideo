@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\EasyTools

call "%EASY_TOOLS%\Ffmpeg\Ffmpeg_CutFpsFrames.bat" "fps=16" 49 3.0625  %*
if %ERRORLEVEL% neq 0 ( exit /b 1 )
