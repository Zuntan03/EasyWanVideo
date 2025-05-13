@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\..\ComfyUI\models\diffusion_models

@REM https://huggingface.co/Zuntan/WanNsfw
call %HUGGING_FACE% Kijai\ WanNsfwI2v-14B-480p_fp8_e4m3fn.safetensors Zuntan/WanNsfw
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\ComfyUI\models\diffusion_models
