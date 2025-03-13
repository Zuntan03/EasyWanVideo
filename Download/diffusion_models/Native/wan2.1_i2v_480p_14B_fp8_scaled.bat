@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\..\ComfyUI\models\diffusion_models

@REM https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged
call %HUGGING_FACE% Native\ wan2.1_i2v_480p_14B_fp8_scaled.safetensors Comfy-Org/Wan_2.1_ComfyUI_repackaged split_files/diffusion_models/
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\ComfyUI\models\diffusion_models
