@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\..\ComfyUI\models\diffusion_models

@REM https://huggingface.co/ali-vilab/VACE-Wan2.1-1.3B-Preview
call %HUGGING_FACE% Kijai\ Wan2_1-VacePreview-1_3B.safetensors ali-vilab/VACE-Wan2.1-1.3B-Preview diffusion_pytorch_model.safetensors?
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\ComfyUI\models\diffusion_models
