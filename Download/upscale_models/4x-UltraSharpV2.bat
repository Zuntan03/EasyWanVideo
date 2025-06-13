@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\ComfyUI\models\upscale_models

@REM https://huggingface.co/Kim2091/UltraSharpV2/
call %HUGGING_FACE% .\ 4x-UltraSharpV2.safetensors Kim2091/UltraSharpV2
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\ComfyUI\models\upscale_models
