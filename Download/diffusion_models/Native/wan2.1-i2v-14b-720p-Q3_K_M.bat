@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\..\ComfyUI\models\diffusion_models

@REM https://huggingface.co/city96/Wan2.1-I2V-14B-720P-gguf
call %HUGGING_FACE% Native\ wan2.1-i2v-14b-720p-Q3_K_M.gguf city96/Wan2.1-I2V-14B-720P-gguf
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\ComfyUI\models\diffusion_models
