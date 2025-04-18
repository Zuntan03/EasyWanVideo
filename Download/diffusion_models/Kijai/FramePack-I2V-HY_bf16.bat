@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\..\ComfyUI\models\diffusion_models

@REM https://huggingface.co/Kijai/HunyuanVideo_comfy
call %HUGGING_FACE% Kijai\ FramePack-I2V-HY_bf16.safetensors Kijai/HunyuanVideo_comfy FramePackI2V_HY_bf16.safetensors?
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\ComfyUI\models\diffusion_models
