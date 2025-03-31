@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\..\ComfyUI\models\loras

@REM https://huggingface.co/spacepxl/Wan2.1-control-loras
call %HUGGING_FACE% T2v1B\ T2v1B_Tile_v10.safetensors spacepxl/Wan2.1-control-loras 1.3b/tile/wan2.1-1.3b-control-lora-tile-v1.0_comfy.safetensors?
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\ComfyUI\models\loras
