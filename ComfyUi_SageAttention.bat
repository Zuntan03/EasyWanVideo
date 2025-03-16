@echo off
chcp 65001 > NUL

call %~dp0ComfyUi.bat --use-sage-attention %*
