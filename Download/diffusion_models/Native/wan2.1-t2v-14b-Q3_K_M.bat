@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\..\ComfyUI\models\diffusion_models

@REM https://huggingface.co/city96/Wan2.1-T2V-14B-gguf
call %HUGGING_FACE% Native\ wan2.1-t2v-14b-Q3_K_M.gguf city96/Wan2.1-T2V-14B-gguf
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\ComfyUI\models\diffusion_models
