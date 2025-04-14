@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\ComfyUI\models\mmaudio

@REM https://huggingface.co/Kijai/MMAudio_safetensors
call %HUGGING_FACE% .\ mmaudio_vae_44k_fp16.safetensors Kijai/MMAudio_safetensors
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\ComfyUI\models\mmaudio
