@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\..\ComfyUI\models\diffusion_models

@REM https://huggingface.co/Zuntan/Wan-SkyReels-CausVid
call %HUGGING_FACE% Kijai\ T2v-Wan-14B-FastMix-fp8_e5m2.safetensors Zuntan/Wan-SkyReels-CausVid
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\ComfyUI\models\diffusion_models
