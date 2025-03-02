@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\EasyTools
set RECURSIVE_BAT_CALL=%EASY_TOOLS%\Bat\RecursiveBatCall_NoErrorCheck.bat

call %~dp0All\upscale_models.bat

call %RECURSIVE_BAT_CALL% %~dp0All\Native
