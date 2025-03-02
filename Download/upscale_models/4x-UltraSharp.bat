@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\ComfyUI\models\upscale_models

@REM https://huggingface.co/Zuntan/dist
call %HUGGING_FACE% .\ 4x-UltraSharp.pth Zuntan/dist
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\ComfyUI\models\upscale_models
