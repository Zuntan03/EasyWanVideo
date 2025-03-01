@echo off
chcp 65001 > NUL

call %~dp0ComfyUi_NoArgs.bat --auto-launch --fast --max-upload-size 200 --use-sage-attention %*
