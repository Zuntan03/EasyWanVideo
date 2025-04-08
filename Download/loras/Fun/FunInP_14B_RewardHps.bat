@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\..\ComfyUI\models\loras

@REM https://huggingface.co/Kijai/Wan2.1-Fun-Reward-LoRAs-comfy
call %HUGGING_FACE% Fun\ FunInP_14B_RewardHps.safetensors Kijai/Wan2.1-Fun-Reward-LoRAs-comfy Wan2.1-Fun-14B-InP-HPS2.1_reward_lora_comfy.safetensors?
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\ComfyUI\models\loras
