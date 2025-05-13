@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\..\ComfyUI\models\diffusion_models

@REM https://huggingface.co/Kijai/WanVideo_comfy
call %HUGGING_FACE% Kijai\ Wan2_1-SkyReelsV2-I2V-14B-540P_fp8_e4m3fn.safetensors Kijai/WanVideo_comfy Skyreels/Wan2_1-SkyReels-V2-I2V-14B-540P_fp8_e4m3fn.safetensors?
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\ComfyUI\models\diffusion_models
